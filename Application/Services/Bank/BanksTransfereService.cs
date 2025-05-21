using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;

using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Application.Core.DTOs.Account;
using Application.Core.DTOs.Banks;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.TreasuryTransfere;
using Application.Core.DTOs.TRN_Transfers;
using Application.Core.Services;
using Application.Core.Services.Account;
using Application.Core.Services.Client;
using Application.Core.Services.LookUps;
using Core;
using Core.DTOs;
using Core.Entities.Account;
using Core.Entities.banks;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.TreasuryTransfere;
using Core.Entities.TRN_Transfers;
using Core.Other;
using Core.UnitOfWork;



using Infrastructure.UnitOfWork;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using static Google.Apis.Requests.BatchRequest;

namespace Application.Services.Bank
{
    public class BanksTransfereService : BaseService<BanksTransfere, BanksTransfereDto, BanksTransfereDto, BanksTransfereDto, BanksTransfereDto>, IBanksTransfereService
    {
        IService<BanksBvr, BanksBvrDto, BanksBvrDto, BanksBvrDto, BanksBvrDto> BankBvrService;
        IJvsService AJvService;
        public BanksTransfereService(IUnitOfWork unitOfWork, IService<BanksBvr, BanksBvrDto, BanksBvrDto, BanksBvrDto, BanksBvrDto> bankBvrService
              , IJvsService aJvService) : base(unitOfWork)
        {
            BankBvrService = bankBvrService;
            AJvService = aJvService;
        }



        protected async override Task<bool> OnCreated(BanksTransfere entity, BanksTransfereDto dto)
        {

                //add BVR For currencies all way cash ceck under account

            var item = entity;
            int fromCurrencyId = await AJvService.GetCurrencyId(item.FromBankAccountId);
            int toCurrencyId = await AJvService.GetCurrencyId(item.ToBankAccountId);
            await AddBankBVR(int.Parse( item.FromBankAccountId.ToString()), 1, item.Amount, 1, "B_TRN_F",int.Parse( entity.BanksTransfereId.ToString()), int.Parse(item.BanksTransfereId.ToString()));
            await AddBankBVR(int.Parse(item.ToBankAccountId.ToString()), 2, item.Amount, 1, "B_TRN_T", int.Parse(entity.BanksTransfereId.ToString()), int.Parse(item.BanksTransfereId.ToString()));

            //aJV
            AJv CreatedAJV = await AJvService.BuildAJV(null, 15, 1, int.Parse( entity.BanksTransfereId.ToString()), "تحويل بين البنوك", 0, 0, 0, 0,1, dto.UserId);
            int FromBankAccount = int.Parse((await AJvService.GetBankAJVAccountFrom_bankAccountId(int.Parse(entity.FromBankAccountId.ToString()), fromCurrencyId)).ToString());
            int ToBankAccount = int.Parse((await AJvService.GetBankAJVAccountFrom_bankAccountId(int.Parse(entity.ToBankAccountId.ToString()), toCurrencyId)).ToString());
            CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 15, 1, int.Parse(entity.BanksTransfereId.ToString()), "تحويل بين البنوك", FromBankAccount, item.Amount, 0, fromCurrencyId,0, dto.UserId);
            CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 15, 1, int.Parse(entity.BanksTransfereId.ToString()), "تحويل بين البنوك", ToBankAccount, 0, item.Amount, toCurrencyId,0, dto.UserId);
            await AJvService.SaveBuildAJV(CreatedAJV);
        
            return true;

        }

        protected async override Task<bool> OnDeleting(BanksTransfere entity)
        {
            var item = entity;
            int fromCurrencyId = await AJvService.GetCurrencyId(item.FromBankAccountId);
            int toCurrencyId = await AJvService.GetCurrencyId(item.ToBankAccountId);
            await AddBankBVR(int.Parse(item.FromBankAccountId.ToString()), 1, item.Amount *-1, 1, "Delete_B_TRN_F", int.Parse(entity.BanksTransfereId.ToString()), int.Parse(item.BanksTransfereId.ToString()));
            await AddBankBVR(int.Parse(item.ToBankAccountId.ToString()), 2, item.Amount *-1 , 1, "Delete_B_TRN_T", int.Parse(entity.BanksTransfereId.ToString()), int.Parse(item.BanksTransfereId.ToString()));
            await AJvService.DeleteAJV(15,int.Parse( entity.BanksTransfereId.ToString()));
            return true;
        }
        protected async override Task<BanksTransfereDto> BeforeUpdate(BanksTransfere entity, BanksTransfereDto dto)
        {
            await OnCreated(Mapper.MapperObject.Mapper.Map<BanksTransfere>(dto), dto);
            await OnDeleting(await UnitOfWork.BanksTransfere.GetByIdAsync(entity.BanksTransfereId));
            return dto;
        }

        private async Task<bool> AddBankBVR(int BankAccountId, int InvoiceTypeId, decimal Amount, decimal Rate, string ActionType, int ActionId, int ActionDetailId)
        {
            decimal BankBalance = 0;
            var CurrentBankBVR = (await UnitOfWork.BanksBvr.GetAsync("BankAccountId = " + BankAccountId));
            if (CurrentBankBVR.Count() > 0)
                BankBalance = CurrentBankBVR.OrderByDescending(a => a.BanksBvrId).FirstOrDefault().Balance;
            else
            {
                //from start balance
                var bnk = await UnitOfWork.BankAccount.GetByIdAsync(BankAccountId);
                BankBalance = bnk.OppenningBalance;
            }

            if (InvoiceTypeId == (int)InvoiseType.Sale)
                Amount = Amount * -1;

            BanksBvrDto exCurrenciesBvrDto = new BanksBvrDto()
            {
                BankAccountId = BankAccountId,
                ActionType = ActionType,
                ActionId = ActionId,
                ActionDetailId = ActionDetailId,
                ActionTime = DateTime.Now,
                Amount = Amount,
                Balance = BankBalance + Amount
            };
            await this.BankBvrService.LightCreate(exCurrenciesBvrDto);
            return true;

        }


    }
}

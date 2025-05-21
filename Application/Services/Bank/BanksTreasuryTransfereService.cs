using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;

using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Application.Core.DTOs.Banks;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.TRN_Transfers;
using Application.Core.Services;
using Application.Core.Services.Account;
using Application.Core.Services.Client;
using Application.Core.Services.LookUps;
using Core;
using Core.DTOs;
using Core.Entities.banks;
using Core.Entities.LookUps;
using Core.Entities.others;
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
    public class BanksTreasuryTransfereService : BaseService<BanksTreasuryTransfere, BanksTreasuryTransfereDto, BanksTreasuryTransfereDto, BanksTreasuryTransfereDto, BanksTreasuryTransfereDto>, IBanksTreasuryTransfereService
    {
        IService<ExCurrenciesBvr, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto> ExCurrenciesBvrService;
        IJvsService AJvService;
        IService<BanksBvr, BanksBvrDto, BanksBvrDto, BanksBvrDto, BanksBvrDto> BankBvrService;
        public BanksTreasuryTransfereService(IUnitOfWork unitOfWork, IService<ExCurrenciesBvr, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto> exCurrenciesBvrService
              , IJvsService aJvService, IService<BanksBvr, BanksBvrDto, BanksBvrDto, BanksBvrDto, BanksBvrDto> bankBvrService) : base(unitOfWork)
        {
            ExCurrenciesBvrService = exCurrenciesBvrService;
            AJvService = aJvService;
            BankBvrService = bankBvrService;
        }



        protected async override Task<bool> OnCreated(BanksTreasuryTransfere entity, BanksTreasuryTransfereDto dto)
        {

            //add BVR For currencies all way cash ceck under account

            var item = entity;
            int BankCurrencyId = await AJvService.GetCurrencyId(item.BankAccountId);
            if (item.Type == (int)BanksTreasuryTransfereType.FromTreasuryToBank)
            {
                await AddCurrBVR(item.CurrencyId, 1, item.Amount, 1, "B_T_TRN", int.Parse(entity.BanksTreasuryTransfereId.ToString()), int.Parse(item.BanksTreasuryTransfereId.ToString()));
                await AddBankBVR(int.Parse(item.BankAccountId.ToString()), 2, item.Amount, 1, "B_T_TRN", int.Parse(entity.BanksTreasuryTransfereId.ToString()), int.Parse(item.BanksTreasuryTransfereId.ToString()));
            }
            else
            {
                await AddBankBVR(int.Parse(item.BankAccountId.ToString()), 1, item.Amount, 1, "B_T_TRN", int.Parse(entity.BanksTreasuryTransfereId.ToString()), int.Parse(item.BanksTreasuryTransfereId.ToString()));
                await AddCurrBVR(item.CurrencyId, 2, item.Amount, 1, "B_T_TRN", int.Parse(entity.BanksTreasuryTransfereId.ToString()), int.Parse(item.BanksTreasuryTransfereId.ToString()));

            }
            //aJV
            AJv CreatedAJV = await AJvService.BuildAJV(null, 16, 1, int.Parse(entity.BanksTreasuryTransfereId.ToString()), "تحويل بين البنك والخزينة", 0, 0, 0, 0, 1,dto.UserId);
            int BankAccoun = int.Parse((await AJvService.GetBankAJVAccountFrom_bankAccountId(int.Parse(entity.BankAccountId.ToString()), BankCurrencyId)).ToString());
            int TreasuryAccount = int.Parse((await AJvService.GetTreasury_Account(int.Parse(item.TreasuryId.ToString()), item.CurrencyId)).ToString());

            if (item.Type == (int)BanksTreasuryTransfereType.FromTreasuryToBank)
            {
                CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 16, 1, int.Parse(entity.BanksTreasuryTransfereId.ToString()), "تحويل بين البنك والخزينة", BankAccoun, item.Amount, 0, BankCurrencyId,0, dto.UserId);
                CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 16, 1, int.Parse(entity.BanksTreasuryTransfereId.ToString()), "تحويل بين البنك والخزينة", TreasuryAccount, 0, item.Amount, item.CurrencyId,0, dto.UserId);
            }
            else
            {
                CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 16, 1, int.Parse(entity.BanksTreasuryTransfereId.ToString()), "تحويل بين البنك والخزينة", TreasuryAccount , item.Amount, 0, BankCurrencyId,0, dto.UserId);
                CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 16, 1, int.Parse(entity.BanksTreasuryTransfereId.ToString()), "تحويل بين البنك والخزينة", BankAccoun, 0, item.Amount, item.CurrencyId,0, dto.UserId);

            }
            await AJvService.SaveBuildAJV(CreatedAJV);

            return true;

        }

        protected async override Task<bool> OnDeleting(BanksTreasuryTransfere entity)
        {
            var item = entity;
            int BankCurrencyId = await AJvService.GetCurrencyId(item.BankAccountId);
            if (item.Type == (int)BanksTreasuryTransfereType.FromTreasuryToBank)
            {
                await AddCurrBVR(item.CurrencyId, 1, item.Amount * -1, 1, "Delete_B_T_TRN", int.Parse(entity.BanksTreasuryTransfereId.ToString()), int.Parse(item.BanksTreasuryTransfereId.ToString()));
                await AddBankBVR(int.Parse( item.BankAccountId.ToString()), 2, item.Amount * -1, 1, "Delete_B_T_TRN", int.Parse(entity.BanksTreasuryTransfereId.ToString()), int.Parse(item.BanksTreasuryTransfereId.ToString()));
            }
            else
            {
                await AddBankBVR(int.Parse(item.BankAccountId.ToString()), 1, item.Amount * -1, 1, "Delete_B_T_TRN", int.Parse(entity.BanksTreasuryTransfereId.ToString()), int.Parse(item.BanksTreasuryTransfereId.ToString()));
                await AddCurrBVR(item.CurrencyId, 2, item.Amount * -1, 1, "Delete_B_T_TRN", int.Parse(entity.BanksTreasuryTransfereId.ToString()), int.Parse(item.BanksTreasuryTransfereId.ToString()));

            }

            await AJvService.DeleteAJV(16, int.Parse(entity.BanksTreasuryTransfereId.ToString()));
            return true;
        }
        protected async override Task<BanksTreasuryTransfereDto> BeforeUpdate(BanksTreasuryTransfere entity, BanksTreasuryTransfereDto dto)
        {
            await OnCreated(Mapper.MapperObject.Mapper.Map<BanksTreasuryTransfere>(dto), dto);
            await OnDeleting(await UnitOfWork.BanksTreasuryTransfere.GetByIdAsync(entity.BanksTreasuryTransfereId));
            return dto;
        }

        private async Task<bool> AddCurrBVR(int CurrencyId, int InvoiceTypeId, decimal CurrAmount, decimal Rate, string ActionType, int ActionId, int ActionDetailId)
        {
            decimal CurrBalance = 0;
            var CurrentCurrencies = (await UnitOfWork.ExCurrenciesBvr.GetAsync("CurrencyID = " + CurrencyId));
            if (CurrentCurrencies.Count() > 0)
                CurrBalance = CurrentCurrencies.OrderByDescending(a => a.Id).FirstOrDefault().Balance;
            else
            {
                //from start balance
                var curr = await UnitOfWork.Currency.GetByIdAsync(CurrencyId);
                CurrBalance = curr.OpeningBalance;
            }

            if (InvoiceTypeId == (int)InvoiseType.Sale)
                CurrAmount = CurrAmount * -1;

            ExCurrenciesBvrDto exCurrenciesBvrDto = new ExCurrenciesBvrDto()
            {
                CurrencyId = CurrencyId,
                ActionType = ActionType,
                ActionId = ActionId,
                ActionDetailId = ActionDetailId,
                ActionTime = DateTime.Now,
                Amount = CurrAmount,
                Rate = Rate,
                ValRate = Rate
                ,
                Balance = CurrBalance + CurrAmount
            };
            await this.ExCurrenciesBvrService.LightCreate(exCurrenciesBvrDto);
            return true;

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

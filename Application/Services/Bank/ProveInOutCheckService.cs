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
using Application.Core.Services;
using Application.Core.Services.Account;
using Application.Core.Services.Client;
using Application.Core.Services.LookUps;
using Core;
using Core.DTOs;
using Core.Entities.banks;
using Core.Entities.LookUps;
using Core.Entities.others;
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
    public class ProveInOutCheckService : BaseService<ProveInOutCheck, ProveInOutCheckDto, ProveInOutCheckDto, ProveInOutCheckDto, ProveInOutCheckDto>, IProveInOutCheckService
    {
        IService<BanksBvr, BanksBvrDto, BanksBvrDto, BanksBvrDto, BanksBvrDto> BankBvrService;
        IJvsService AJvService;
        public ProveInOutCheckService(IUnitOfWork unitOfWork, IService<BanksBvr, BanksBvrDto, BanksBvrDto, BanksBvrDto, BanksBvrDto> bankBvrService
              , IJvsService aJvService) : base(unitOfWork)
        {
            BankBvrService = bankBvrService;
            AJvService = aJvService;
        }


        //protected async override Task<bool> OnCreated(ProveInOutCheck entity, ProveInOutCheckDto dto)
        //{

        //    //add BVR For currencies all way cash ceck under account

        //    var item = entity;
        //    await AddBankBVR(int.Parse(item.BankAccountId.ToString()), item.Type, item.Amount, 1, "Prov", int.Parse(entity.ProveInOutCheckId.ToString()), int.Parse(item.ProveInOutCheckId.ToString()));
          
        //    return true;

        //}

        //protected async override Task<bool> OnDeleting(ProveInOutCheck entity)
        //{
        //    var item = entity;
        //    await AddBankBVR(int.Parse(item.BankAccountId.ToString()), item.Type, item.Amount * -1, 1, "Delete_Prov", int.Parse(entity.ProveInOutCheckId.ToString()), int.Parse(item.ProveInOutCheckId.ToString()));

        //    return true;
        //}
        //protected async override Task<ProveInOutCheckDto> BeforeUpdate(ProveInOutCheck entity, ProveInOutCheckDto dto)
        //{
        //    await OnCreated(Mapper.MapperObject.Mapper.Map<ProveInOutCheck>(dto), dto);
        //    await OnDeleting(await UnitOfWork.ProveInOutCheck.GetByIdAsync(entity.ProveInOutCheckId));
        //    return dto;
        //}

        //private async Task<bool> AddBankBVR(int BankAccountId, int InvoiceTypeId, decimal Amount, decimal Rate, string ActionType, int ActionId, int ActionDetailId)
        //{
        //    decimal BankBalance = 0;
        //    var CurrentBankBVR = (await UnitOfWork.BanksBvr.GetAsync("BankAccountId = " + BankAccountId));
        //    if (CurrentBankBVR.Count() > 0)
        //        BankBalance = CurrentBankBVR.OrderByDescending(a => a.BanksBvrId).FirstOrDefault().Balance;
        //    else
        //    {
        //        //from start balance
        //        var bnk = await UnitOfWork.BankAccount.GetByIdAsync(BankAccountId);
        //        BankBalance = bnk.OppenningBalance;
        //    }

        //    if (InvoiceTypeId == (int)InvoiseType.Sale)
        //        Amount = Amount * -1;

        //    BanksBvrDto exCurrenciesBvrDto = new BanksBvrDto()
        //    {
        //        BankAccountId = BankAccountId,
        //        ActionType = ActionType,
        //        ActionId = ActionId,
        //        ActionDetailId = ActionDetailId,
        //        ActionTime = DateTime.Now,
        //        Amount = Amount,
        //        Balance = BankBalance + Amount
        //    };
        //    await this.BankBvrService.LightCreate(exCurrenciesBvrDto);
        //    return true;

        //}



    }
}

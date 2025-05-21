using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;

using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Application.Core.DTOs;
using Application.Core.DTOs.Account;
using Application.Core.DTOs.Banks;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.Taswya;
using Application.Core.DTOs.TRN_Invoices;
using Application.Core.DTOs.TRN_Transfers;
using Application.Core.DTOs.TRN_WholeInvoices;
using Application.Core.DTOs.WorkFlow;
using Application.Core.Services;
using Application.Core.Services.Account;
using Application.Core.Services.LookUps;
using Application.Core.Services.WorkFlow;
using Application.Mapper;
using Core;
using Core.DTOs;
using Core.Entities.Account;
using Core.Entities.banks;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Taswya;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;
using Core.Entities.TRN_WholeInvoices;
using Core.Entities.Workflow;
using Core.Other;
using Core.UnitOfWork;



using Infrastructure.UnitOfWork;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using static Google.Apis.Requests.BatchRequest;

namespace Application.Services.Account
{
    public class ACashFlowService : BaseService<ACashFlow, ACashFlowDto, ACashFlowDto, ACashFlowDto, ACashFlowDto>, IACashFlowService
    {
        IService<ExCurrenciesBvr, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto> ExCurrenciesBvrService;
        IJvsService AJvService;
        IService<BanksBvr, BanksBvrDto, BanksBvrDto, BanksBvrDto, BanksBvrDto> BankBvrService;
        public ACashFlowService(IUnitOfWork unitOfWork
                   , IService<ExCurrenciesBvr, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto> exCurrenciesBvrService
              , IJvsService aJvService, IService<BanksBvr, BanksBvrDto, BanksBvrDto, BanksBvrDto, BanksBvrDto> bankBvrService
          ) : base(unitOfWork)
        {
            ExCurrenciesBvrService = exCurrenciesBvrService;
            AJvService = aJvService;
            BankBvrService = bankBvrService;
        }



  
        public async Task<int> GetNextTrnNo(int brn)
        {
            int response = await UnitOfWork.ACashFlow.GetNextTrnNo(brn);
            return response;
        }


        protected async override Task<bool> OnCreated(ACashFlow entity, ACashFlowDto dto)
        {
            //خزينة
            if (entity.PaymentMethod == 0)
            {
                //add BVR For currencies all way cash ceck under account

                var item = entity;
                await AddCurrBVR(item.CurrencyId, item.VoucherTypeId, item.Amount, 1, "CSH", entity.VoucherId, item.VoucherId);


                //aJV
                AJv CreatedAJV = await AJvService.BuildAJV(null, 12, int.Parse(entity.BranchID.ToString()), entity.VoucherId, "سندات خزينة", 0, 0, 0, 0,1, dto.UserId);


                    int TreasuryId = (await UnitOfWork.Currency.GetByIdAsync(item.CurrencyId)).TreasuryId;
                    int TreasuryAccount = int.Parse((await AJvService.GetTreasury_Account(int.Parse(TreasuryId.ToString()), item.CurrencyId)).ToString());

                    if (item.VoucherTypeId == (int)TaswyaType.Plus)
                    {
                        int TaswyaAccount = int.Parse(await AJvService.GetAccount_setting("Taswya"));
                        int TaswyaCurrAccount = await AJvService.GetNestedAccountsettingByCurency(TaswyaAccount, item.CurrencyId);
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 12, int.Parse(entity.BranchID.ToString()), entity.VoucherId, "سندات خزينة", TreasuryAccount, item.Amount, 0, item.CurrencyId,0, dto.UserId);
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 12, int.Parse(entity.BranchID.ToString()), entity.VoucherId, "سندات خزينة", TaswyaCurrAccount, 0, item.Amount, item.CurrencyId,0, dto.UserId);
                        await AJvService.SaveBuildAJV(CreatedAJV);
                    }
                    //Mins
                    else if (item.VoucherTypeId == (int)TaswyaType.Mins)
                    {
                        int TaswyaAccount = int.Parse(await AJvService.GetAccount_setting("Taswya"));
                        int TaswyaCurrAccount = await AJvService.GetNestedAccountsettingByCurency(TaswyaAccount, item.CurrencyId);
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 12, int.Parse(entity.BranchID.ToString()), entity.VoucherId, "سندات خزينة", TaswyaCurrAccount, item.Amount, 0, item.CurrencyId,0, dto.UserId);
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 12, int.Parse(entity.BranchID.ToString()), entity.VoucherId, "سندات خزينة", TreasuryAccount, 0, item.Amount, item.CurrencyId,0, dto.UserId);
                        await AJvService.SaveBuildAJV(CreatedAJV);

                    }


            }
            //bank
            if (entity.PaymentMethod == 1)
            {

                var item = entity;
                int BankBrvAccount = await AJvService.GetDefaultBankAccountBRV(int.Parse(entity.BankId.ToString()));
                await AddBankBVR(BankBrvAccount, item.VoucherTypeId, item.Amount, 1, "BNK", entity.VoucherId, item.VoucherId);


                //aJV
                AJv CreatedAJV = await AJvService.BuildAJV(null, 12, int.Parse(entity.BranchID.ToString()), entity.VoucherId, "سندات بنك", 0, 0, 0, 0, 1, dto.UserId);
                
                int BankAccoun = int.Parse((await AJvService.GetBank_AJVAccount(int.Parse(entity.BankId.ToString()), entity.CurrencyId)).ToString());

                if (item.VoucherTypeId == (int)TaswyaType.Plus)
                {
                    int TaswyaAccount = int.Parse(await AJvService.GetAccount_setting("Taswya"));
                    int TaswyaCurrAccount = await AJvService.GetNestedAccountsettingByCurency(TaswyaAccount, item.CurrencyId);
                    CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 12, int.Parse(entity.BranchID.ToString()), entity.VoucherId, "سندات بنك", BankAccoun, item.Amount, 0, item.CurrencyId, 0, dto.UserId);
                    CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 12, int.Parse(entity.BranchID.ToString()), entity.VoucherId, "سندات بنك", TaswyaCurrAccount, 0, item.Amount, item.CurrencyId,0, dto.UserId);
                    await AJvService.SaveBuildAJV(CreatedAJV);
                }
                //Mins
                else if (item.VoucherTypeId == (int)TaswyaType.Mins)
                {
                    int TaswyaAccount = int.Parse(await AJvService.GetAccount_setting("Taswya"));
                    int TaswyaCurrAccount = await AJvService.GetNestedAccountsettingByCurency(TaswyaAccount, item.CurrencyId);
                    CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 12, int.Parse(entity.BranchID.ToString()), entity.VoucherId, "سندات بنك", TaswyaCurrAccount, item.Amount, 0, item.CurrencyId,0, dto.UserId);
                    CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 12, int.Parse(entity.BranchID.ToString()), entity.VoucherId, "سندات بنك", BankAccoun, 0, item.Amount, item.CurrencyId,0, dto.UserId);
                    await AJvService.SaveBuildAJV(CreatedAJV);

                }


            }

            return true;

        }




        //protected async override Task<bool> OnCreated(ACashFlow entity, ACashFlowDto dto)
        //{
        //    //خزينة فقط
        //    if (entity.PaymentMethod == 0)
        //    {
        //            var item = dto;
        //            decimal CurrBalance = 0;
        //            var CurrentCurrencies = (await UnitOfWork.ExCurrenciesBvr.GetAsync("CurrencyID = " + item.CurrencyId));
        //            if (CurrentCurrencies.Count() > 0)
        //                CurrBalance = CurrentCurrencies.OrderByDescending(a => a.Id).FirstOrDefault().Balance;
        //            else
        //            {
        //                //from start balance
        //                var curr = await UnitOfWork.Currency.GetByIdAsync(item.CurrencyId);
        //                CurrBalance = curr.OpeningBalance;
        //            }

        //            decimal CurrAmount = item.Amount;
        //            if (item.VoucherTypeId == 1)
        //                CurrAmount = item.Amount * -1;

        //            ExCurrenciesBvrDto exCurrenciesBvrDto = new ExCurrenciesBvrDto()
        //            {
        //                CurrencyId = item.CurrencyId,
        //                ActionType = "CSH",
        //                ActionId = entity.VoucherId,
        //                ActionDetailId = 0,
        //                ActionTime = DateTime.Now,
        //                Amount = CurrAmount,
        //                Rate = 0,
        //                ValRate = 0,
        //                Balance = CurrBalance + CurrAmount
        //            };
        //            await this.ExCurrenciesBvrService.LightCreate(exCurrenciesBvrDto);


        //    }


        //    //aJV
        //    if (entity.PaymentMethod == 0)
        //    {
        //        var TreasuryId = (await UnitOfWork.Currency.GetByIdAsync(entity.CurrencyId)).TreasuryId;
        //        int TreasuryAccount = int.Parse((await AJvService.GetDefaultTreasury_Account(int.Parse(TreasuryId.ToString()))).ToString());
        //        int TaswyaAccount = int.Parse(await AJvService.GetAccount_setting("Taswya"));


        //        var item = entity;
        //            //in
        //            if (item.VoucherTypeId == 2)
        //                await AJvService.AddGeneratedAJV(item.VoucherTypeId, entity.VoucherNo, 12, item.Amount,0,0, item.Amount, 0,0, entity.VoucherId, int.Parse(entity.BranchID.ToString()), TaswyaAccount,0,0, TreasuryAccount,0,0, item.CurrencyId);
        //            //out
        //            else if (item.VoucherTypeId == 1)
        //                await AJvService.AddGeneratedAJV(item.VoucherTypeId, entity.VoucherNo, 12, item.Amount, 0, 0, item.Amount, 0, 0, entity.VoucherId, int.Parse(entity.BranchID.ToString()), TreasuryAccount, 0, 0, TaswyaAccount, 0, 0, item.CurrencyId);


        //    }

        //    return true;

        //}


        protected async override Task<bool> OnDeleting(ACashFlow entity)
        {
            //سندات الخزينة 
            if (entity.PaymentMethod == 0)
            {
                var item = entity;
                await AddCurrBVR(item.CurrencyId, item.VoucherTypeId, item.Amount * -1, 1, "Delete_CSH", entity.VoucherId, item.VoucherId);
                await AJvService.DeleteAJV(12, entity.VoucherId);
           
            }
            //بنك
            if (entity.PaymentMethod == 1)
            {
                var item = entity;
                int BankBrvAccount = await AJvService.GetDefaultBankAccountBRV(int.Parse(entity.BankId.ToString()));
                await AddBankBVR(BankBrvAccount, item.VoucherTypeId, item.Amount * -1, 1, "Delete_BNK", entity.VoucherId, item.VoucherId);

                await AJvService.DeleteAJV(12, entity.VoucherId);

            }
            return true;
        }

        //protected async override Task<bool> OnDeleting(ACashFlow entity)
        //{
        //    //خزينة فقط
        //    if (entity.PaymentMethod == 0)
        //    {
        //        var item = entity;
        //        decimal CurrBalance = 0;
        //        var CurrentCurrencies = (await UnitOfWork.ExCurrenciesBvr.GetAsync("CurrencyID = " + item.CurrencyId));
        //        if (CurrentCurrencies.Count() > 0)
        //            CurrBalance = CurrentCurrencies.OrderByDescending(a => a.Id).FirstOrDefault().Balance;
        //        else
        //        {
        //            //from start balance
        //            var curr = await UnitOfWork.Currency.GetByIdAsync(item.CurrencyId);
        //            CurrBalance = curr.OpeningBalance;
        //        }

        //        decimal CurrAmount = item.Amount * -1;
        //        if (item.VoucherTypeId == 1)
        //            CurrAmount = item.Amount;

        //        ExCurrenciesBvrDto exCurrenciesBvrDto = new ExCurrenciesBvrDto()
        //        {
        //            CurrencyId = item.CurrencyId,
        //            ActionType = "Delete_CSH",
        //            ActionId = entity.VoucherId,
        //            ActionDetailId =0,
        //            ActionTime = DateTime.Now,
        //            Amount = CurrAmount,
        //            Rate = 0,
        //            ValRate = 0,
        //            Balance = CurrBalance + CurrAmount
        //        };
        //        await this.ExCurrenciesBvrService.LightCreate(exCurrenciesBvrDto);

        //    }

        //    if (entity.PaymentMethod == 0)
        //    {
        //        await AJvService.DeleteAJV(12, entity.VoucherId);
        //    }

        //    return true;

        //}

        protected async override Task<ACashFlowDto> BeforeUpdate(ACashFlow entity, ACashFlowDto dto)
        {
            await OnCreated(Mapper.MapperObject.Mapper.Map<ACashFlow>(dto), dto);
            await OnDeleting(await UnitOfWork.ACashFlow.GetByIdAsync(entity.VoucherId));
            return dto;
        }

        //protected async override Task<ACashFlowDto> BeforeUpdate(ACashFlow entity, ACashFlowDto dto)
        //{

        //    //خزينة فقط
        //    if (entity.PaymentMethod == 0)
        //    {
        //        var item = dto;
        //        var oldItem = await this.GetById(item.VoucherId);
        //        await SetCurrencyBvrToUpdate(item, item.Amount - oldItem.Amount, item.VoucherTypeId);
        //        item = await this.LightUpdate(item);



        //    }


        //    return dto;
        //}

        protected async Task<bool> SetCurrencyBvrToUpdate(ACashFlowDto item, decimal Amount, int VoucherTypeId)
        {


            if (Amount == 0)
                return true;

            decimal CurrBalance = 0;
            var CurrentCurrencies = (await UnitOfWork.ExCurrenciesBvr.GetAsync("CurrencyID = " + item.CurrencyId));
            if (CurrentCurrencies.Count() > 0)
                CurrBalance = CurrentCurrencies.OrderByDescending(a => a.Id).FirstOrDefault().Balance;
            else
            {
                var curr = await UnitOfWork.Currency.GetByIdAsync(item.CurrencyId);
                CurrBalance = curr.OpeningBalance;
            }

                if (VoucherTypeId == 1)
                    Amount = Amount * -1;
        
            ExCurrenciesBvrDto exCurrenciesBvrDto = new ExCurrenciesBvrDto()
            {
                CurrencyId = item.CurrencyId,
                ActionType = "Update_CSH",
                ActionId = item.VoucherId,
                ActionDetailId = 0,
                ActionTime = DateTime.Now,
                Amount = Amount,
                Balance = CurrBalance + Amount
            };
            await this.ExCurrenciesBvrService.LightCreate(exCurrenciesBvrDto);


            return true;
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

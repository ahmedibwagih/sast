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
using Application.Core.DTOs.Banks;
using Application.Core.DTOs.Clients;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.TRN_Invoices;
using Application.Core.DTOs.TRN_Transfers;
using Application.Core.DTOs.TRN_WholeInvoices;
using Application.Core.DTOs.WorkFlow;
using Application.Core.Services;
using Application.Core.Services.Account;
using Application.Core.Services.LookUps;
using Application.Core.Services.WorkFlow;
using Application.Mapper;
using Azure;
using Core;
using Core.DTOs;
using Core.Entities.banks;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;
using Core.Entities.TRN_WholeInvoices;
using Core.Entities.Workflow;
using Core.Other;
using Core.Repositories.TRN_Transfers;
using Core.UnitOfWork;



using Infrastructure.UnitOfWork;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using static Google.Apis.Requests.BatchRequest;

namespace Application.Services.LookUps
{
    public class ExWholeInvoiceService : BaseService<ExWholeInvoice, ExWholeInvoiceDto, ExWholeInvoiceDto, ExWholeInvoiceDto, ExWholeInvoiceDto>, IExWholeInvoiceService
    {
        //  private readonly DynamoSession session;

        IService<ExWholeInvoicesDetail, ExWholeInvoicesDetailDto, ExWholeInvoicesDetailDto, ExWholeInvoicesDetailDto, ExWholeInvoicesDetailDto> ExWholeInvoicesDetailService;
        IService<ExCurrenciesBvr, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto> ExCurrenciesBvrService;
        IService<WFRequest, WFRequestDto, WFRequestDto, WFRequestDto, WFRequestDto> WorkFlowService;
        IJvsService AJvService;
        IService<BanksBvr, BanksBvrDto, BanksBvrDto, BanksBvrDto, BanksBvrDto> BankBvrService;
        public ExWholeInvoiceService(IUnitOfWork unitOfWork
            , IService<ExWholeInvoicesDetail, ExWholeInvoicesDetailDto, ExWholeInvoicesDetailDto, ExWholeInvoicesDetailDto, ExWholeInvoicesDetailDto> exWholeInvoicesDetailService
            , IService<ExCurrenciesBvr, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto> exCurrenciesBvrService
              , IService<WFRequest, WFRequestDto, WFRequestDto, WFRequestDto, WFRequestDto> workFlowService
         , IJvsService aJvService
           , IService<BanksBvr, BanksBvrDto, BanksBvrDto, BanksBvrDto, BanksBvrDto> bankBvrService
            ) : base(unitOfWork)
        {
            ExWholeInvoicesDetailService = exWholeInvoicesDetailService;
            ExCurrenciesBvrService = exCurrenciesBvrService;
            WorkFlowService = workFlowService;
            AJvService = aJvService;
            BankBvrService = bankBvrService;
        }

        public async Task<ExchangeResponse<List<ExWholeInvoiceStatusDto>>> GetWholeInvoiceStatus()
        {
            try
            {
                var entity = await UnitOfWork.ExWholeInvoiceStatus.GetAllAsync();
                var entityDto = Mapper.MapperObject.Mapper.Map<List<ExWholeInvoiceStatusDto>>(entity);
                return new ExchangeResponse<List<ExWholeInvoiceStatusDto>> { Status = ResponseEnum.Ok, Result = entityDto.ToList() };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }

        public async Task<ExchangeResponse<List<ExWholePaymentMethodDto>>> GetWholePaymentMethod()
        {
            try
            {
                var entity = await UnitOfWork.ExWholePaymentMethod.GetAllAsync();
                var entityDto = Mapper.MapperObject.Mapper.Map<List<ExWholePaymentMethodDto>>(entity);
                return new ExchangeResponse<List<ExWholePaymentMethodDto>> { Status = ResponseEnum.Ok, Result = entityDto.ToList() };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }

        public async Task<int> GetNextInvoiceNo(int brn)
        {
            int response = await UnitOfWork.ExWholeInvoice.GetNextInvoiceNo(brn);
            return response;
        }

        public override async Task<ExchangeResponse<ExWholeInvoiceDto>> Create_ExResponse(ExWholeInvoiceDto input)
        {


            try
            
            {
               if ( input.InvoiceTime.Year ==1)
                { input.InvoiceTime = input.InvoiceDate; }

                var entity = Mapper.MapperObject.Mapper.Map<ExWholeInvoice>(input);
                await OnCreating(entity, input);
                UnitOfWork.BeginTran();
                entity.InvoiceNo = await UnitOfWork.ExWholeInvoice.GetNextInvoiceNo(input.BranchID);
                var newEntity = await UnitOfWork.ExWholeInvoice.AddAsync(entity);

                await UnitOfWork.CompleteAsync();

                await OnCreated(newEntity, input);

                if (newEntity.IsPendingWorkflow != null)
                    if ((bool)newEntity.IsPendingWorkflow)
                    {
                        await WorkFlowService.LightCreate(new Core.DTOs.WorkFlow.WFRequestDto()
                        {
                            BranchID = newEntity.BranchID,
                            EntityId = newEntity.InvoiceId.ToString(),
                            IsCompleted = false,
                            RegisterDate = DateTime.Now
                        ,
                            RequestTypeId = 2,
                            UserId = input.UserId,
                            Username = "fulladmin"
                        });
                    }


                UnitOfWork.CommitTran();

               


                var response = Mapper.MapperObject.Mapper.Map<ExWholeInvoiceDto>(newEntity);
                return new ExchangeResponse<ExWholeInvoiceDto> { Status = ResponseEnum.Ok, Result = response };
            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<ExWholeInvoiceDto> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء حفظ البيانات" };
            }

        }


        protected async override Task<ExWholeInvoiceDto> BeforeUpdate(ExWholeInvoice entity, ExWholeInvoiceDto dto)
        {
            await OnCreated(Mapper.MapperObject.Mapper.Map<ExWholeInvoice>(dto), dto);
            await OnDeleting(await UnitOfWork.ExWholeInvoice.GetByIdAsync(entity.InvoiceId));
            return dto;
        }



        //protected async override Task<ExWholeInvoiceDto> BeforeUpdate(ExWholeInvoice entity, ExWholeInvoiceDto dto)
        //{

        //    for (int i = 0; i < dto.ExWholeInvoicesDetails.Count(); i++)
        //    {
        //        var item = dto.ExWholeInvoicesDetails.ToList()[i];
        //        if (item.InvoiceDetailId == 0)
        //        {
        //            item = await ExWholeInvoicesDetailService.LightCreate(item);
        //            await SetCurrencyBvrToUpdate(item, item.Amount, entity.PaymentMethod, dto.InvoiceTypeId, "create");
        //        }
        //        else
        //        {
        //            var oldItem = await ExWholeInvoicesDetailService.GetById(item.InvoiceDetailId);
        //            decimal newamount = item.Amount - oldItem.Amount;
        //            int PaymentMethod = dto.PaymentMethod;
        //            if (dto.PaymentMethod == (int)WholePaymentMethodTypes.Cash && entity.PaymentMethod != (int)WholePaymentMethodTypes.Cash)
        //            {
        //                newamount = item.Amount;
        //                PaymentMethod = dto.PaymentMethod;
        //            }
        //            if (entity.PaymentMethod == 1 && dto.PaymentMethod != 1)
        //            {
        //                newamount = item.Amount * -1;
        //                PaymentMethod = entity.PaymentMethod;
        //            }
        //            await SetCurrencyBvrToUpdate(item, newamount, PaymentMethod, dto.InvoiceTypeId, "update");
        //            item = await ExWholeInvoicesDetailService.LightUpdate(item);
        //        }

        //        dto.ExWholeInvoicesDetails.ToList()[i] = item;
        //        dto.ExWholeInvoicesDetails.ToList()[i].InvoiceDetailId = item.InvoiceDetailId;

        //    }

        //    //delete 
        //    var mainData = (await ExWholeInvoicesDetailService.GetByCond("InvoiceID == " + entity.InvoiceId + "")).ToList();
        //    for (int i = 0; i < mainData.Count(); i++)
        //    {
        //        var item = mainData.ToList()[i];
        //        if (dto.ExWholeInvoicesDetails.Where(a => a.InvoiceDetailId == item.InvoiceDetailId).ToList().Count() <= 0)
        //        {
        //            await ExWholeInvoicesDetailService.Delete(item.InvoiceDetailId);
        //            await SetCurrencyBvrToUpdate(item, item.Amount, dto.PaymentMethod, dto.InvoiceTypeId, "delete");
        //        }
        //    }


        //    return dto;
        //}


        public async Task<bool> CreateCurrencyBvr(ExWholeInvoice entity)
        {
            return await OnCreated(entity, null);
        }

        protected async override Task<bool> OnCreated(ExWholeInvoice entity, ExWholeInvoiceDto dto)
        {
            if ((entity.IsPendingWorkflow == false || entity.IsPendingWorkflow == null))
            {
                //add BVR For currencies all way cash ceck under account
                for (int i = 0; i < entity.ExWholeInvoicesDetails.Count(); i++)
                {
                    var item = entity.ExWholeInvoicesDetails.ToList()[i];
                    await AddCurrBVR(item.CurrencyId, entity.InvoiceTypeId, item.Amount, item.SupplierExRate, "whl", entity.InvoiceId, item.InvoiceDetailId);
                }

                //add bvr cash and bank

                if (entity.PaidCash != null && entity.PaidCash != 0)
                {
                    int Riyal_curr = (await UnitOfWork.Currency.GetAsync("TreasuryId = " + entity.TreasuryId + " && CurrencyCode = 1")).FirstOrDefault().CurrencyId;
                    await AddCurrBVR(Riyal_curr, entity.InvoiceTypeId, decimal.Parse(entity.PaidCash.ToString()) * -1, 1, "whl", entity.InvoiceId, 0);
                }
                if (entity.PaidCheck != null && entity.PaidCheck != 0)
                {
                    int BankBrvAccount = await AJvService.GetDefaultBankAccountBRV(int.Parse(entity.BankId.ToString()));
                    await AddBankBVR(BankBrvAccount, entity.InvoiceTypeId, decimal.Parse(entity.PaidCheck.ToString()) * -1, 1, "whl", entity.InvoiceId, 0);
                }
                //UnderAccount no bvr
                //add bvr cash

                //aJV
                AJv CreatedAJV = await AJvService.BuildAJV(null, 2, entity.BranchID, entity.InvoiceId, "فاتوره جمله ", 0, 0, 0, 0, 1, dto.UserId);

                int TreasuryAccount = int.Parse((await AJvService.GetDefaultTreasury_Account(int.Parse(entity.TreasuryId.ToString()))).ToString());
                int RiyalCurrId = int.Parse((await AJvService.GetRiyal_currencyId(int.Parse(entity.TreasuryId.ToString()))).ToString());
                if (entity.InvoiceTypeId == (int)InvoiseType.Purchase)
                {
                    int BuyAccount = int.Parse(await AJvService.GetAccount_setting("BUYS"));
                    for (int i = 0; i < entity.ExWholeInvoicesDetails.Count(); i++)
                    {
                        var item = entity.ExWholeInvoicesDetails.ToList()[i];
                        int BuyCurrAccount = await AJvService.GetNestedAccountsettingByCurency(BuyAccount, item.CurrencyId);
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 2, entity.BranchID, entity.InvoiceId, "فاتوره جمله ", BuyCurrAccount, item.Amount, 0, item.CurrencyId,item.SupplierExRate, dto.UserId);
                        //  await AJvService.AddGeneratedAJV(entity.InvoiceTypeId, entity.InvoiceNo, 1, item.Amount, 0, 0,item.Amount, 0, 0, entity.InvoiceId, entity.BranchID, BuyCurrAccount, 0, 0, TreasuryAccount, 0, 0, item.CurrencyId);
                    }
                    if (entity.PaidCash != 0)
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 2, entity.BranchID, entity.InvoiceId, "فاتوره جمله ", TreasuryAccount, 0, decimal.Parse(entity.PaidCash.ToString()), RiyalCurrId,1, dto.UserId);
                    if (entity.PaidCheck != 0)
                    {
                        int BankAccount = int.Parse((await AJvService.GetBank_AJVAccount(int.Parse(entity.BankId.ToString()), RiyalCurrId)).ToString());
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 2, entity.BranchID, entity.InvoiceId, "فاتوره جمله ", BankAccount, 0, decimal.Parse(entity.PaidCheck.ToString()), RiyalCurrId,1, dto.UserId);
                    }
                    if (entity.PaidUnderAccount != 0)
                    {
                        int SupplierAccId = int.Parse((await AJvService.GetSupplier_Account(int.Parse(entity.SupplierId.ToString()))).ToString());
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 2, entity.BranchID, entity.InvoiceId, "فاتوره جمله ", SupplierAccId, 0, decimal.Parse(entity.PaidCheck.ToString()), RiyalCurrId,1, dto.UserId);

                    }
                    await AJvService.SaveBuildAJV(CreatedAJV);

                }
                //Salse
                else if (entity.InvoiceTypeId == (int)InvoiseType.Sale)
                {
                    if (entity.PaidCash != 0)
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 2, entity.BranchID, entity.InvoiceId, "فاتوره جمله ", TreasuryAccount, decimal.Parse(entity.PaidCash.ToString()), 0, RiyalCurrId,1, dto.UserId);
                    if (entity.PaidCheck != 0)
                    {
                        int BankAccount = int.Parse((await AJvService.GetBank_AJVAccount(int.Parse(entity.BankId.ToString()), RiyalCurrId)).ToString());
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 2, entity.BranchID, entity.InvoiceId, "فاتوره جمله ", BankAccount, decimal.Parse(entity.PaidCheck.ToString()), 0, RiyalCurrId,1, dto.UserId);
                    }
                    if (entity.PaidUnderAccount != 0)
                    {
                        int SupplierAccId = int.Parse((await AJvService.GetSupplier_Account(int.Parse(entity.SupplierId.ToString()))).ToString());
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 2, entity.BranchID, entity.InvoiceId, "فاتوره جمله ", SupplierAccId,decimal.Parse(entity.PaidCheck.ToString()) ,0 , RiyalCurrId,1, dto.UserId);

                    }

                    int SaleAccount = int.Parse(await AJvService.GetAccount_setting("Sales"));
                    for (int i = 0; i < entity.ExWholeInvoicesDetails.Count(); i++)
                    {
                        var item = entity.ExWholeInvoicesDetails.ToList()[i];
                        int SaleCurrAccount = await AJvService.GetNestedAccountsettingByCurency(SaleAccount, item.CurrencyId);
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 2, entity.BranchID, entity.InvoiceId, " فاتوره جمله  ", SaleCurrAccount, 0, item.Amount, item.CurrencyId,item.SupplierExRate, dto.UserId);
                        //  await AJvService.AddGeneratedAJV(entity.InvoiceTypeId, entity.InvoiceNo, 1, item.Amount, 0, 0, item.Amount, 0, 0, item.InvoiceId, entity.BranchID, TreasuryAccount, 0, 0, SaleCurrAccount, 0, 0, item.CurrencyId);
                    }

                    await AJvService.SaveBuildAJV(CreatedAJV);
                }

            }


            return true;

        }

        //protected async override Task<bool> OnCreated(ExWholeInvoice entity, ExWholeInvoiceDto dto)
        //{
        //    if (entity.PaymentMethod == (int)WholePaymentMethodTypes.Cash && (entity.IsPendingWorkflow == false || entity.IsPendingWorkflow == null))
        //    {
        //        for (int i = 0; i < entity.ExWholeInvoicesDetails.Count(); i++)
        //        {
        //            var item = entity.ExWholeInvoicesDetails.ToList()[i];
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
        //            if (entity.InvoiceTypeId == 1)
        //                CurrAmount = item.Amount * -1;

        //            ExCurrenciesBvrDto exCurrenciesBvrDto = new ExCurrenciesBvrDto()
        //            {
        //                CurrencyId = item.CurrencyId,
        //                ActionType = "whl",
        //                ActionId = entity.InvoiceId,
        //                ActionDetailId = item.InvoiceDetailId,
        //                ActionTime = DateTime.Now,
        //                Amount = CurrAmount,
        //                Rate = item.SystemExRate,
        //                ValRate = item.SystemExRate
        //                ,
        //                Balance = CurrBalance + CurrAmount
        //            };
        //            await this.ExCurrenciesBvrService.LightCreate(exCurrenciesBvrDto);

        //        }
        //    }

        //    //aJV
        //    if ((entity.IsPendingWorkflow == false || entity.IsPendingWorkflow == null))
        //    {
        //        int mainAccount = 0;
        //        //nakdy
        //        if (entity.PaymentMethod == (int)WholePaymentMethodTypes.Cash)
        //            mainAccount = int.Parse((await AJvService.GetTreasury_Account(int.Parse(entity.TreasuryId.ToString()))).ToString());
        //        //علي الحساب
        //        else if (entity.PaymentMethod == (int)WholePaymentMethodTypes.UnderAccount)
        //            mainAccount = int.Parse((await AJvService.GetSupplier_Account(int.Parse(entity.SupplierId.ToString()))).ToString());


        //        if (entity.PaymentMethod == (int)WholePaymentMethodTypes.Cash || entity.PaymentMethod == (int)WholePaymentMethodTypes.UnderAccount)
        //        {
        //            //Buy
        //            if (entity.InvoiceTypeId == 2)
        //            {
        //                int BuyAccount = int.Parse(await AJvService.GetAccount_setting("BUYS"));
        //                for (int i = 0; i < entity.ExWholeInvoicesDetails.Count(); i++)
        //                {
        //                    var item = entity.ExWholeInvoicesDetails.ToList()[i];
        //                    int BuyCurrAccount = await AJvService.GetNestedAccountsettingByCurency(BuyAccount, item.CurrencyId);
        //                    await AJvService.AddGeneratedAJV(entity.InvoiceTypeId, entity.InvoiceNo, 2, item.Amount, 0, 0,item.Amount, 0, 0, entity.InvoiceId, entity.BranchID, BuyCurrAccount, 0, 0, mainAccount, 0, 0, item.CurrencyId);
        //                }
        //            }
        //            //Salse
        //            else if (entity.InvoiceTypeId == 1)
        //            {
        //                int SaleAccount = int.Parse(await AJvService.GetAccount_setting("Sales"));
        //                for (int i = 0; i < entity.ExWholeInvoicesDetails.Count(); i++)
        //                {
        //                    var item = entity.ExWholeInvoicesDetails.ToList()[i];
        //                    int SaleCurrAccount = await AJvService.GetNestedAccountsettingByCurency(SaleAccount, item.CurrencyId);
        //                    await AJvService.AddGeneratedAJV(entity.InvoiceTypeId, entity.InvoiceNo, 2, item.Amount, 0, 0,item.Amount, 0, 0, item.InvoiceDetailId, entity.BranchID, mainAccount, 0, 0, SaleCurrAccount, 0, 0, item.CurrencyId);
        //                }
        //            }
        //        }
        //        //check
        //        else if (entity.PaymentMethod == (int)WholePaymentMethodTypes.Check)
        //        {
        //            //سيتم عمل قيد الشيك عند تحصيله لاني لا اعلم سيتم تحصيله في انهي بنك
        //        }
        //    }
        //    return true;

        //}

        protected async override Task<bool> OnDeleting(ExWholeInvoice entity)
        {
            //add BVR For currencies all way cash ceck under account
            for (int i = 0; i < entity.ExWholeInvoicesDetails.Count(); i++)
            {
                var item = entity.ExWholeInvoicesDetails.ToList()[i];
                await AddCurrBVR(item.CurrencyId, entity.InvoiceTypeId, item.Amount * -1, item.SupplierExRate, "Delete_whl", entity.InvoiceId, item.InvoiceDetailId);
            }

            //add bvr cash and bank
            if (entity.PaidCash != null && entity.PaidCash != 0)
            {
                int Riyal_curr = (await UnitOfWork.Currency.GetAsync("TreasuryId = " + entity.TreasuryId + " && CurrencyCode = 1")).FirstOrDefault().CurrencyId;
                await AddCurrBVR(Riyal_curr, entity.InvoiceTypeId, decimal.Parse(entity.PaidCash.ToString()), 1, "Delete_whl", entity.InvoiceId, 0);
            }
                if (entity.PaidCheck != null && entity.PaidCheck != 0)
            {
                int BankBrvAccount = await AJvService.GetDefaultBankAccountBRV(int.Parse(entity.BankId.ToString()));
                await AddBankBVR(BankBrvAccount, entity.InvoiceTypeId, decimal.Parse(entity.PaidCheck.ToString()) , 1, "Delete_whl", entity.InvoiceId, 0);
            }
            //UnderAccount no bvr
            //AJV
            await AJvService.DeleteAJV(1, entity.InvoiceId);
            return true;

        }

        //protected async override Task<bool> OnDeleting(ExWholeInvoice entity)
        //{
        //    if (entity.PaymentMethod == (int)WholePaymentMethodTypes.Cash)
        //    {
        //        for (int i = 0; i < entity.ExWholeInvoicesDetails.Count(); i++)
        //        {
        //            var item = entity.ExWholeInvoicesDetails.ToList()[i];
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

        //            decimal CurrAmount = item.Amount* -1;
        //            if (entity.InvoiceTypeId == 1)
        //                CurrAmount = item.Amount ;

        //            ExCurrenciesBvrDto exCurrenciesBvrDto = new ExCurrenciesBvrDto()
        //            {
        //                CurrencyId = item.CurrencyId,
        //                ActionType = "Delete_whl",
        //                ActionId = entity.InvoiceId,
        //                ActionDetailId = item.InvoiceDetailId,
        //                ActionTime = DateTime.Now,
        //                Amount = CurrAmount,
        //                Rate = item.SystemExRate,
        //                ValRate = item.SystemExRate
        //                ,
        //                Balance = CurrBalance + CurrAmount
        //            };
        //            await this.ExCurrenciesBvrService.LightCreate(exCurrenciesBvrDto);

        //        }
        //    }

        //    if (entity.PaymentMethod == (int)WholePaymentMethodTypes.UnderAccount)
        //    {
        //        await AJvService.DeleteAJV(1, entity.InvoiceId);
        //    }
        //    return true;

        //}


        //protected async Task<bool> SetCurrencyBvrToUpdate(ExWholeInvoicesDetailDto item, decimal Amount, int PaymentMethod, int InvoiceTypeId, string action)
        //{

        //    if (PaymentMethod == (int)WholePaymentMethodTypes.Cash)
        //    {
        //        if (Amount == 0)
        //            return true;

        //        decimal CurrBalance = 0;
        //        var CurrentCurrencies = (await UnitOfWork.ExCurrenciesBvr.GetAsync("CurrencyID = " + item.CurrencyId));
        //        if (CurrentCurrencies.Count() > 0)
        //            CurrBalance = CurrentCurrencies.OrderByDescending(a => a.Id).FirstOrDefault().Balance;
        //        else
        //        {
        //            var curr = await UnitOfWork.Currency.GetByIdAsync(item.CurrencyId);
        //            CurrBalance = curr.OpeningBalance;
        //        }

        //        if (action == "create" || action == "update")
        //        {
        //            if (InvoiceTypeId == 1)
        //                Amount = Amount * -1;
        //        }
        //        else if (action == "delete")
        //        {
        //            if (InvoiceTypeId == 2)
        //                Amount = Amount * -1;
        //        }



        //        ExCurrenciesBvrDto exCurrenciesBvrDto = new ExCurrenciesBvrDto()
        //        {
        //            CurrencyId = item.CurrencyId,
        //            ActionType = "Update_whl_" + action,
        //            ActionId = item.InvoiceId,
        //            ActionDetailId = item.InvoiceDetailId,
        //            ActionTime = DateTime.Now,
        //            Amount = Amount,
        //            Rate = item.SystemExRate,
        //            ValRate = item.SystemExRate
        //                    ,
        //            Balance = CurrBalance + Amount
        //        };
        //        await this.ExCurrenciesBvrService.LightCreate(exCurrenciesBvrDto);
        //    }

        //    return true;
        //}

        public override async Task<ExchangeResponse<PagingResultDto<ExWholeInvoiceDto>>> GetAllPaging_ExResponse(PagingInputDto pagingInputDto)
        {
            try
            {
                var result = await Repository.GetAllPagingAsync(pagingInputDto);

                var list = Mapper.MapperObject.Mapper.Map<IList<ExWholeInvoiceDto>>(result.Item1);

            
                    foreach (var item in list)
                    {
                        if (item.IsPendingWorkflow == true)
                        {
                        try
                        {
                            var request = (await UnitOfWork.WFRequest.GetAsync("EntityId==   \"" + item.InvoiceId.ToString() + "\" && RequestTypeid == 1 && BranchID ==" + item.BranchID)).Where(a => a.IsCompleted == false).FirstOrDefault();
                            var allApprovals = (await UnitOfWork.WFListOfApprovals.GetAsync("RequestTypeid == 2 && BranchID ==" + item.BranchID)).OrderBy(a => a.ActionOrder);
                            var xx2 = (await UnitOfWork.WFRequestDetails.GetAsync("RequestId== " + request.RequestId.ToString())).Where(a => a.ActionType == 0);

                            if (xx2.Count() > 0)
                            {
                                item.WorkFlowStatus = "تم الرفض " ;
                            }
                            else
                                foreach (var approval in allApprovals)
                                {

                                    var xx = (await UnitOfWork.WFRequestDetails.GetAsync("RequestId== " + request.RequestId.ToString())).Where(a => a.ActionOrder == approval.ActionOrder);
                                    if (xx.Count() <= 0)
                                    {
                                        var user = await UnitOfWork.SecUser.GetByIdAsync(long.Parse(approval.UserId.ToString()));
                                        item.WorkFlowStatus = "في انتظار موافقة " + ExchangeEncrypt.Decryp(user.UserNameAr);
                                        break;
                                    }
                                }
                        }
                        catch { }
                    }
                    }
           

                var response = new PagingResultDto<ExWholeInvoiceDto>
                {
                    Result = list,
                    Total = result.Item2
                };

                return new ExchangeResponse<PagingResultDto<ExWholeInvoiceDto>> { Status = ResponseEnum.Ok, Result = response };
                // return response;
            }
            catch (System.Exception ex)
            {
                return new ExchangeResponse<PagingResultDto<ExWholeInvoiceDto>> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء التعامل مع البيانات" };
            }
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

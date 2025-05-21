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
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.Taswya;
using Application.Core.DTOs.TRN_Invoices;
using Application.Core.DTOs.TRN_Transfers;
using Application.Core.DTOs.TRN_WholeInvoices;
using Application.Core.Services;
using Application.Core.Services.Account;
using Application.Core.Services.LookUps;
using Azure;
using Core;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Taswya;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;
using Core.Entities.TRN_WholeInvoices;
using Core.Other;
using Core.UnitOfWork;



using Infrastructure.UnitOfWork;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using NetTopologySuite.Index.HPRtree;
using static Google.Apis.Requests.BatchRequest;

namespace Application.Services.LookUps
{
    public class ExTaswyaService : BaseService<ExTaswya, ExTaswyaDto, ExTaswyaDto, ExTaswyaDto, ExTaswyaDto>, IExTaswyaService
    {
        //  private readonly DynamoSession session;

        IService<ExTaswyaDetail, ExTaswyaDetailDto, ExTaswyaDetailDto, ExTaswyaDetailDto, ExTaswyaDetailDto> ExTaswyaDetailService;
        IService<ExCurrenciesBvr, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto> ExCurrenciesBvrService;
        IJvsService AJvService;
        public ExTaswyaService(IUnitOfWork unitOfWork, IService<ExTaswyaDetail, ExTaswyaDetailDto, ExTaswyaDetailDto, ExTaswyaDetailDto, ExTaswyaDetailDto> exTaswyaDetailService
       , IService<ExCurrenciesBvr, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto> exCurrenciesBvrService
              , IJvsService aJvService
            ) : base(unitOfWork)
       
        {
            ExTaswyaDetailService = exTaswyaDetailService;
            ExCurrenciesBvrService = exCurrenciesBvrService;
            AJvService = aJvService;
        }


        public async Task<int> GetNextTransferNo(int brn)
        {
            int response = await UnitOfWork.ExTaswya.GetNextTransferNo( brn);
            return response;
        }


        public async Task<ExchangeResponse<List<ExBranchTransferTypeDto>>> GetTransferType()
        {
            try
            {
                var entity = await UnitOfWork.ExBranchTransferType.GetAllAsync();
                var entityDto = Mapper.MapperObject.Mapper.Map<List<ExBranchTransferTypeDto>>(entity);
               // return entityDto;
                return new ExchangeResponse<List<ExBranchTransferTypeDto>>{ Status = ResponseEnum.Ok, Result = entityDto.ToList() };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }

        public override async Task<ExchangeResponse<ExTaswyaDto>> Create_ExResponse(ExTaswyaDto input)
        {
            try
            {
                var entity = Mapper.MapperObject.Mapper.Map<ExTaswya>(input);
                await OnCreating(entity, input);
                UnitOfWork.BeginTran();
                entity.TransferNo = await UnitOfWork.ExTaswya.GetNextTransferNo(int.Parse( input.BranchID.ToString()));
                var newEntity = await UnitOfWork.ExTaswya.AddAsync(entity);
                await UnitOfWork.CompleteAsync();
                await OnCreated(newEntity, input);
                UnitOfWork.CommitTran();
                var response = Mapper.MapperObject.Mapper.Map<ExTaswyaDto>(newEntity);
                return new ExchangeResponse<ExTaswyaDto> { Status = ResponseEnum.Ok, Result = response };
            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<ExTaswyaDto> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء حفظ البيانات" };

            }

        }

   
        public async Task<ExchangeResponse<ExTaswyaDetailDto>> AddExTaswyaDetail(ExTaswyaDetailDto input)
        {
            try
            {

                var inserted = await(ExTaswyaDetailService.LightCreate(input));
                return new ExchangeResponse<ExTaswyaDetailDto> { Status = ResponseEnum.Ok, Result = inserted };

            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<ExTaswyaDetailDto> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء حفظ البيانات" };

            }
        }



        protected async override Task<bool> OnCreated(ExTaswya entity, ExTaswyaDto dto)
        {
            if ((entity.IsPendingWorkflow == false || entity.IsPendingWorkflow == null))
            {
                //add BVR For currencies all way cash ceck under account
                for (int i = 0; i < entity.ExTaswyaDetails.Count(); i++)
                {
                    var item = entity.ExTaswyaDetails.ToList()[i];
                    await AddCurrBVR(item.CurrencyId, item.TransferType, item.TransferAmount, 1, "TSw", entity.TransferId, item.TransferDetailId);
                }

                //aJV
                AJv CreatedAJV = await AJvService.BuildAJV(null, 10,int.Parse( entity.BranchID.ToString()) , entity.TransferId, "تسوية", 0, 0, 0, 0,1, dto.UserId);


                for (int i = 0; i < entity.ExTaswyaDetails.Count(); i++)
                {
                    var item = entity.ExTaswyaDetails.ToList()[i];
                    int TreasuryAccount = int.Parse((await AJvService.GetTreasury_Account(int.Parse(entity.TreasuryId.ToString()), item.CurrencyId)).ToString());

                    if (item.TransferType == (int)TaswyaType.Plus)
                    {
                      
                        int TaswyaAccount = int.Parse(await AJvService.GetAccount_setting("Taswya"));
                        int TaswyaCurrAccount = await AJvService.GetNestedAccountsettingByCurency(TaswyaAccount, item.CurrencyId);
                        int RiyalCurrId = int.Parse((await AJvService.GetRiyal_currencyId(int.Parse(entity.TreasuryId.ToString()))).ToString());
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 10, int.Parse(entity.BranchID.ToString()), entity.TransferId, "تسوية",TreasuryAccount , item.TransferAmount, 0, item.CurrencyId,0, dto.UserId);
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 10, int.Parse(entity.BranchID.ToString()), entity.TransferId, "تسوية",TaswyaCurrAccount , 0, item.TransferAmount, RiyalCurrId,0, dto.UserId);
                        await AJvService.SaveBuildAJV(CreatedAJV);
                    }
                    //Mins
                    else if (item.TransferType == (int)TaswyaType.Mins)
                    {
                        int TaswyaAccount = int.Parse(await AJvService.GetAccount_setting("Taswya"));
                        int TaswyaCurrAccount = await AJvService.GetNestedAccountsettingByCurency(TaswyaAccount, item.CurrencyId);
                        int RiyalCurrId = int.Parse((await AJvService.GetRiyal_currencyId(int.Parse(entity.TreasuryId.ToString()))).ToString());
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 10, int.Parse(entity.BranchID.ToString()), entity.TransferId, "تسوية", TaswyaCurrAccount, item.TransferAmount, 0, item.CurrencyId,0, dto.UserId);
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 10, int.Parse(entity.BranchID.ToString()), entity.TransferId, "تسوية", TreasuryAccount, 0, item.TransferAmount, RiyalCurrId,0, dto.UserId);
                        await AJvService.SaveBuildAJV(CreatedAJV);

                    }
                }

            }


            return true;

        }



        //protected async override Task<bool> OnCreated(ExTaswya entity, ExTaswyaDto dto)
        //{
        //    if (entity.IsPendingWorkflow == false || entity.IsPendingWorkflow == null)
        //    {
        //        for (int i = 0; i < entity.ExTaswyaDetails.Count(); i++)
        //        {
        //            var item = entity.ExTaswyaDetails.ToList()[i];
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

        //            decimal CurrAmount = item.TransferAmount;
        //            if (item.TransferType == 1)
        //                CurrAmount = item.TransferAmount * -1;

        //            ExCurrenciesBvrDto exCurrenciesBvrDto = new ExCurrenciesBvrDto()
        //            {
        //                CurrencyId = item.CurrencyId,
        //                ActionType = "TSw",
        //                ActionId = entity.TransferId,
        //                ActionDetailId = item.TransferDetailId,
        //                ActionTime = DateTime.Now,
        //                Amount = CurrAmount,
        //                Rate = 0,
        //                ValRate = 0
        //                ,
        //                Balance = CurrBalance + CurrAmount
        //            };
        //            await this.ExCurrenciesBvrService.LightCreate(exCurrenciesBvrDto);

        //        }
        //    }


        //    //aJV
        //    if ((entity.IsPendingWorkflow == false || entity.IsPendingWorkflow == null))
        //    {
        //            int TreasuryAccount = int.Parse((await AJvService.GetTreasury_Account(int.Parse(entity.TreasuryId.ToString()))).ToString());
        //            int TaswyaAccount = int.Parse(await AJvService.GetAccount_setting("Taswya"));
        //        for (int i = 0; i < entity.ExTaswyaDetails.Count(); i++)
        //        {


        //            var item = entity.ExTaswyaDetails.ToList()[i];
        //            //in
        //            if (item.TransferType == 2)
        //               await AJvService.AddGeneratedAJV(item.TransferType, entity.TransferNo, 10, item.TransferAmount, 0, 0,item.TransferAmount, 0, 0, entity.TransferId, int.Parse(entity.BranchID.ToString()), TaswyaAccount, 0, 0, TreasuryAccount, 0, 0, item.CurrencyId);
        //            //out
        //            else if (item.TransferType == 1)
        //                await AJvService.AddGeneratedAJV(item.TransferType, entity.TransferNo, 10, item.TransferAmount, 0, 0,item.TransferAmount, 0, 0, entity.TransferId, int.Parse(entity.BranchID.ToString()), TreasuryAccount, 0, 0, TaswyaAccount, 0, 0, item.CurrencyId);
        //        }


        //    }

        //    return true;

        //}

        protected async override Task<bool> OnDeleting(ExTaswya entity)
        {
            for (int i = 0; i < entity.ExTaswyaDetails.Count(); i++)
            {
                var item = entity.ExTaswyaDetails.ToList()[i];
                 await AddCurrBVR(item.CurrencyId, item.TransferType, item.TransferAmount * -1, 1, "Delete_TSw", entity.TransferId, item.TransferDetailId);
            }

            await AJvService.DeleteAJV(10, entity.TransferId);
            return true;

        }

        //protected async override Task<bool> OnDeleting(ExTaswya entity)
        //{

        //        for (int i = 0; i < entity.ExTaswyaDetails.Count(); i++)
        //        {
        //            var item = entity.ExTaswyaDetails.ToList()[i];
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

        //            decimal CurrAmount = item.TransferAmount* -1;
        //            if (item.TransferType == 1)
        //                CurrAmount = item.TransferAmount ;

        //            ExCurrenciesBvrDto exCurrenciesBvrDto = new ExCurrenciesBvrDto()
        //            {
        //                CurrencyId = item.CurrencyId,
        //                ActionType = "Delete_TSW",
        //                ActionId = entity.TransferId,
        //                ActionDetailId = item.TransferDetailId,
        //                ActionTime = DateTime.Now,
        //                Amount = CurrAmount,
        //                Rate = 0,
        //                ValRate = 0
        //                ,
        //                Balance = CurrBalance + CurrAmount
        //            };
        //            await this.ExCurrenciesBvrService.LightCreate(exCurrenciesBvrDto);

        //        }


        //        await AJvService.DeleteAJV(10, entity.TransferId);


        //    return true;

        //}

        protected async override Task<ExTaswyaDto> BeforeUpdate(ExTaswya entity, ExTaswyaDto dto)
        {
            await OnCreated(Mapper.MapperObject.Mapper.Map<ExTaswya>(dto), dto);
            await OnDeleting(await UnitOfWork.ExTaswya.GetByIdAsync(entity.TransferId));
            return dto;
        }
            //protected async override Task<ExTaswyaDto> BeforeUpdate(ExTaswya entity, ExTaswyaDto dto)
            //{

            //    for (int i = 0; i < dto.ExTaswyaDetails.Count(); i++)
            //    {
            //        var item = dto.ExTaswyaDetails.ToList()[i];
            //        if (item.TransferDetailId == 0)
            //        {
            //            item = await ExTaswyaDetailService.LightCreate(item);
            //            await SetCurrencyBvrToUpdate(item, item.TransferAmount, item.TransferType, "create");
            //        }
            //        else
            //        {

            //            var oldItem = await ExTaswyaDetailService.GetById(item.TransferDetailId);
            //            await SetCurrencyBvrToUpdate(item, item.TransferAmount - oldItem.TransferAmount, item.TransferType, "update");
            //            item = await ExTaswyaDetailService.LightUpdate(item);
            //        }
            //        dto.ExTaswyaDetails.ToList()[i] = item;
            //        dto.ExTaswyaDetails.ToList()[i].TransferDetailId = item.TransferDetailId;

            //    }

            //    //delete 
            //    var mainData = (await ExTaswyaDetailService.GetByCond("TransferId == " + entity.TransferId + "")).ToList();
            //    for (int i = 0; i < mainData.Count(); i++)
            //    {
            //        var item = mainData.ToList()[i];
            //        if (dto.ExTaswyaDetails.Where(a => a.TransferDetailId == item.TransferDetailId).ToList().Count() <= 0)
            //        {
            //            await ExTaswyaDetailService.Delete(item.TransferDetailId);
            //            await SetCurrencyBvrToUpdate(item, item.TransferAmount, item.TransferType, "delete");
            //        }
            //    }


            //    return dto;
            //}

            protected async Task<bool> SetCurrencyBvrToUpdate(ExTaswyaDetailDto item, decimal Amount, int InvoiceTypeId, string action)
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

                if (action == "create" || action == "update")
                {
                    if (InvoiceTypeId == 1)
                        Amount = Amount * -1;
                }
                else if (action == "delete")
                {
                    if (InvoiceTypeId == 2)
                        Amount = Amount * -1;
                }



                ExCurrenciesBvrDto exCurrenciesBvrDto = new ExCurrenciesBvrDto()
                {
                    CurrencyId = item.CurrencyId,
                    ActionType = "Update_TSW_" + action,
                    ActionId = item.TransferId,
                    ActionDetailId = item.TransferDetailId,
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

            if (InvoiceTypeId == (int)TaswyaType.Mins)
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


    }
}

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
using Application.Core.DTOs.TreasuryTransfere;
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
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Taswya;
using Core.Entities.TreasuryTransfere;
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
using NetTopologySuite.Index.HPRtree;
using static Google.Apis.Requests.BatchRequest;

namespace Application.Services.LookUps
{
    public class TreasuryTransfereService : BaseService<ExTreasuryTransfere, ExTreasuryTransfereDto, ExTreasuryTransfereDto, ExTreasuryTransfereDto, ExTreasuryTransfereDto>, ITreasuryTransfereService
    {
        //  private readonly DynamoSession session;

        IService<ExTreasuryTransfereDetail, ExTreasuryTransfereDetailDto, ExTreasuryTransfereDetailDto, ExTreasuryTransfereDetailDto, ExTreasuryTransfereDetailDto> ExTreasuryTransfereDetailervice;
        IService<ExCurrenciesBvr, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto> ExCurrenciesBvrService;
        IService<WFRequest, WFRequestDto, WFRequestDto, WFRequestDto, WFRequestDto> WorkFlowService;
        IJvsService AJvService;
        public TreasuryTransfereService(IUnitOfWork unitOfWork, IService<ExTreasuryTransfereDetail, ExTreasuryTransfereDetailDto, ExTreasuryTransfereDetailDto, ExTreasuryTransfereDetailDto, ExTreasuryTransfereDetailDto> ExTreasuryTransfereDetailervice
       , IService<ExCurrenciesBvr, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto> exCurrenciesBvrService
             , IService<WFRequest, WFRequestDto, WFRequestDto, WFRequestDto, WFRequestDto> workFlowService
             , IJvsService aJvService
            ) : base(unitOfWork)
        {
            ExTreasuryTransfereDetailervice = ExTreasuryTransfereDetailervice;
            ExCurrenciesBvrService = exCurrenciesBvrService;
            WorkFlowService = workFlowService;
            AJvService = aJvService;
        }


        public async Task<int> GetNextTransferNo(int brn)
        {
            int response = await UnitOfWork.ExTreasuryTransfere.GetNextTransferNo(brn);
            return response;
        }


        public async Task<ExchangeResponse<List<ExBranchTransferTypeDto>>> GetTransferType()
        {
            try
            {
                var entity = await UnitOfWork.ExBranchTransferType.GetAllAsync();
                var entityDto = Mapper.MapperObject.Mapper.Map<List<ExBranchTransferTypeDto>>(entity);
                // return entityDto;
                return new ExchangeResponse<List<ExBranchTransferTypeDto>> { Status = ResponseEnum.Ok, Result = entityDto.ToList() };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }

        public override async Task<ExchangeResponse<ExTreasuryTransfereDto>> Create_ExResponse(ExTreasuryTransfereDto input)
        {


            try
            {

                var entity = Mapper.MapperObject.Mapper.Map<ExTreasuryTransfere>(input);
                await OnCreating(entity, input);
                UnitOfWork.BeginTran();
                entity.TransferNo = await UnitOfWork.ExTreasuryTransfere.GetNextTransferNo(int.Parse(input.FromBranchID.ToString()));
                var newEntity = await UnitOfWork.ExTreasuryTransfere.AddAsync(entity);

                await UnitOfWork.CompleteAsync();

                await OnCreated(newEntity, input);

                if (newEntity.IsPendingWorkflow != null)
                    if ((bool)newEntity.IsPendingWorkflow)
                    {
                        int RequestTypeId = 5;
                        if (newEntity.FromBranchID != newEntity.ToBranchID)
                            RequestTypeId = 6;

                        await WorkFlowService.LightCreate(new Core.DTOs.WorkFlow.WFRequestDto()
                        {
                            BranchID = (int)newEntity.FromBranchID,
                            EntityId = newEntity.TransferId.ToString(),
                            IsCompleted = false,
                            RegisterDate = DateTime.Now,
                            RequestTypeId = RequestTypeId,
                            UserId = input.UserId,
                            Username = "fulladmin"
                        });
                    }


                UnitOfWork.CommitTran();




                var response = Mapper.MapperObject.Mapper.Map<ExTreasuryTransfereDto>(newEntity);
                return new ExchangeResponse<ExTreasuryTransfereDto> { Status = ResponseEnum.Ok, Result = response };
            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<ExTreasuryTransfereDto> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء حفظ البيانات" };

            }

        }

        public async Task<ExchangeResponse<ExTreasuryTransfereDetailDto>> AddExTreasuryTransfereDetail(ExTreasuryTransfereDetailDto input)
        {
            try
            {

                var inserted = await (ExTreasuryTransfereDetailervice.LightCreate(input));
                return new ExchangeResponse<ExTreasuryTransfereDetailDto> { Status = ResponseEnum.Ok, Result = inserted };

            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<ExTreasuryTransfereDetailDto> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء حفظ البيانات" };

            }
        }


        public async Task<bool> CreateCurrencyBvr(ExTreasuryTransfere entity)
        {
            return await OnCreated(entity, null);
        }

        protected async override Task<bool> OnCreated(ExTreasuryTransfere entity, ExTreasuryTransfereDto dto)
        {
            if ((entity.IsPendingWorkflow == false || entity.IsPendingWorkflow == null))
            {
                //add BVR For currencies all way cash ceck under account
                for (int i = 0; i < entity.ExTreasuryTransfereDetail.Count(); i++)
                {
                    var item = entity.ExTreasuryTransfereDetail.ToList()[i];
                    int CurrencyCode = (await UnitOfWork.Currency.GetAsync("CurrencyID = " + item.CurrencyId)).FirstOrDefault().CurrencyCode;
                    int curr_from = (await UnitOfWork.Currency.GetAsync("CurrencyCode = " + CurrencyCode)).Where(a => a.BranchID == entity.FromBranchID && a.TreasuryId == entity.FromTreasuryId).FirstOrDefault().CurrencyId;
                    int curr_to = (await UnitOfWork.Currency.GetAsync("CurrencyCode = " + CurrencyCode)).Where(a => a.BranchID == entity.ToBranchID && a.TreasuryId == entity.ToTreasuryId).FirstOrDefault().CurrencyId;

                    await AddCurrBVR(curr_from, 1, item.TransferAmount , 1, "TRN_F", entity.TransferId, item.TransferDetailId);
                    await AddCurrBVR(curr_to, 2, item.TransferAmount , 1, "TRN_T", entity.TransferId, item.TransferDetailId);
                }

                //aJV
                AJv CreatedAJV = await AJvService.BuildAJV(null, 11, int.Parse(entity.FromBranchID.ToString()), entity.TransferId, "تحويل بين الخزن", 0, 0, 0, 0,1, dto.UserId);


                for (int i = 0; i < entity.ExTreasuryTransfereDetail.Count(); i++)
                {

                    var item = entity.ExTreasuryTransfereDetail.ToList()[i];
                    int CurrencyCode = (await UnitOfWork.Currency.GetAsync("CurrencyID = " + item.CurrencyId)).FirstOrDefault().CurrencyCode;
                    int curr_from = (await UnitOfWork.Currency.GetAsync("CurrencyCode = " + CurrencyCode)).Where(a => a.BranchID == entity.FromBranchID && a.TreasuryId == entity.FromTreasuryId).FirstOrDefault().CurrencyId;
                    int curr_to = (await UnitOfWork.Currency.GetAsync("CurrencyCode = " + CurrencyCode)).Where(a => a.BranchID == entity.ToBranchID && a.TreasuryId == entity.ToTreasuryId).FirstOrDefault().CurrencyId;

                    int TreasuryAccountFrom = int.Parse((await AJvService.GetTreasury_Account(int.Parse(entity.FromTreasuryId.ToString()), curr_from)).ToString());
                    int TreasuryAccountTo = int.Parse((await AJvService.GetTreasury_Account(int.Parse(entity.ToTreasuryId.ToString()), curr_to)).ToString());

                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 11, int.Parse(entity.FromBranchID.ToString()), entity.TransferId, "تحويل بين الخزن", TreasuryAccountFrom, item.TransferAmount, 0, curr_from,0, dto.UserId);
                        CreatedAJV = await AJvService.BuildAJV(CreatedAJV, 11, int.Parse(entity.FromBranchID.ToString()), entity.TransferId, "تحويل بين الخزن", TreasuryAccountTo,0 , item.TransferAmount, curr_to,0, dto.UserId);
                        await AJvService.SaveBuildAJV(CreatedAJV);
                   
                }

            }


            return true;

        }



        //protected async override Task<bool> OnCreated(ExTreasuryTransfere entity, ExTreasuryTransfereDto dto)
        //{



        //    if (entity.IsPendingWorkflow == false || entity.IsPendingWorkflow == null)
        //    {

        //        for (int i = 0; i < entity.ExTreasuryTransfereDetail.Count(); i++)
        //        {

        //            var item = entity.ExTreasuryTransfereDetail.ToList()[i];
        //            int CurrencyCode = (await UnitOfWork.Currency.GetAsync("CurrencyID = " + item.CurrencyId)).FirstOrDefault().CurrencyCode;
        //            int curr_from = (await UnitOfWork.Currency.GetAsync("CurrencyCode = " + CurrencyCode)).Where(a => a.BranchID == entity.FromBranchID && a.TreasuryId == entity.FromTreasuryId).FirstOrDefault().CurrencyId;
        //            int curr_to = (await UnitOfWork.Currency.GetAsync("CurrencyCode = " + CurrencyCode)).Where(a => a.BranchID == entity.ToBranchID && a.TreasuryId == entity.ToTreasuryId).FirstOrDefault().CurrencyId;

        //            #region from
        //            decimal CurrBalance = 0;
        //            var CurrentCurrencies = (await UnitOfWork.ExCurrenciesBvr.GetAsync("CurrencyID = " + curr_from));
        //            if (CurrentCurrencies.Count() > 0)
        //                CurrBalance = CurrentCurrencies.OrderByDescending(a => a.Id).FirstOrDefault().Balance;
        //            else
        //            {
        //                var curr = await UnitOfWork.Currency.GetByIdAsync(curr_from);
        //                CurrBalance = curr.OpeningBalance;
        //            }

        //            decimal CurrAmount = item.TransferAmount * -1;

        //            ExCurrenciesBvrDto exCurrenciesBvrDto = new ExCurrenciesBvrDto()
        //            {
        //                CurrencyId = curr_from,
        //                ActionType = "TRN_F",
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
        //            #endregion

        //            #region to
        //            decimal CurrBalance2 = 0;
        //            var CurrentCurrencies2 = (await UnitOfWork.ExCurrenciesBvr.GetAsync("CurrencyID = " + curr_to));
        //            if (CurrentCurrencies2.Count() > 0)
        //                CurrBalance2 = CurrentCurrencies2.OrderByDescending(a => a.Id).FirstOrDefault().Balance;
        //            else
        //            {
        //                var curr2 = await UnitOfWork.Currency.GetByIdAsync(curr_to);
        //                CurrBalance2 = curr2.OpeningBalance;
        //            }

        //            decimal CurrAmount2 = item.TransferAmount;

        //            ExCurrenciesBvrDto exCurrenciesBvrDto2 = new ExCurrenciesBvrDto()
        //            {
        //                CurrencyId = curr_to,
        //                ActionType = "TRN_T",
        //                ActionId = entity.TransferId,
        //                ActionDetailId = item.TransferDetailId,
        //                ActionTime = DateTime.Now,
        //                Amount = CurrAmount2,
        //                Rate = 0,
        //                ValRate = 0
        //                ,
        //                Balance = CurrBalance2 + CurrAmount2

        //            };
        //            await this.ExCurrenciesBvrService.LightCreate(exCurrenciesBvrDto2);
        //            #endregion

        //        }
        //    }


        //    //aJV
        //    if ((entity.IsPendingWorkflow == false || entity.IsPendingWorkflow == null))
        //    {
        //        int FromTreasuryAccount = int.Parse((await AJvService.GetDefaultTreasury_Account(int.Parse(entity.FromTreasuryId.ToString()))).ToString());
        //        int ToTreasuryAccount = int.Parse((await AJvService.GetDefaultTreasury_Account(int.Parse(entity.ToTreasuryId.ToString()))).ToString());

        //        for (int i = 0; i < entity.ExTreasuryTransfereDetail.Count(); i++)
        //        {

        //            var item = entity.ExTreasuryTransfereDetail.ToList()[i];
        //            await AJvService.AddGeneratedAJV(item.TransferType, entity.TransferNo, 11, item.TransferAmount, 0, 0, item.TransferAmount, 0, 0, entity.TransferId, int.Parse(entity.FromBranchID.ToString()), FromTreasuryAccount, 0, 0, ToTreasuryAccount, 0, 0, item.CurrencyId);
        //        }


        //    }
        //    return true;

        //}

        protected async override Task<bool> OnDeleting(ExTreasuryTransfere entity)
        {
            //add BVR For currencies all way cash ceck under account


            for (int i = 0; i < entity.ExTreasuryTransfereDetail.Count(); i++)
            {
                var item = entity.ExTreasuryTransfereDetail.ToList()[i];
                int CurrencyCode = (await UnitOfWork.Currency.GetAsync("CurrencyID = " + item.CurrencyId)).FirstOrDefault().CurrencyCode;
                int curr_from = (await UnitOfWork.Currency.GetAsync("CurrencyCode = " + CurrencyCode)).Where(a => a.BranchID == entity.FromBranchID && a.TreasuryId == entity.FromTreasuryId).FirstOrDefault().CurrencyId;
                int curr_to = (await UnitOfWork.Currency.GetAsync("CurrencyCode = " + CurrencyCode)).Where(a => a.BranchID == entity.ToBranchID && a.TreasuryId == entity.ToTreasuryId).FirstOrDefault().CurrencyId;

                await AddCurrBVR(curr_from, 1, item.TransferAmount * -1 , 1, "TRN_F", entity.TransferId, item.TransferDetailId);
                await AddCurrBVR(curr_to, 2, item.TransferAmount* -1, 1  , "TRN_T", entity.TransferId, item.TransferDetailId);
            }


            //AJV
            await AJvService.DeleteAJV(11, entity.TransferId);
            return true;

        }




        //protected async override Task<bool> OnDeleting(ExTreasuryTransfere entity)
        //{
        //    for (int i = 0; i < entity.ExTreasuryTransfereDetail.Count(); i++)
        //    {
        //        var item = entity.ExTreasuryTransfereDetail.ToList()[i];
        //        int CurrencyCode = (await UnitOfWork.Currency.GetAsync("CurrencyID = " + item.CurrencyId)).FirstOrDefault().CurrencyCode;
        //        int curr_from = (await UnitOfWork.Currency.GetAsync("CurrencyCode = " + CurrencyCode)).Where(a => a.BranchID == entity.FromBranchID && a.TreasuryId == entity.FromTreasuryId).FirstOrDefault().CurrencyId;
        //        int curr_to = (await UnitOfWork.Currency.GetAsync("CurrencyCode = " + CurrencyCode)).Where(a => a.BranchID == entity.ToBranchID && a.TreasuryId == entity.ToTreasuryId).FirstOrDefault().CurrencyId;

        //        #region from
        //        decimal CurrBalance = 0;
        //        var CurrentCurrencies = (await UnitOfWork.ExCurrenciesBvr.GetAsync("CurrencyID = " + curr_from));
        //        if (CurrentCurrencies.Count() > 0)
        //            CurrBalance = CurrentCurrencies.OrderByDescending(a => a.Id).FirstOrDefault().Balance;
        //        else
        //        {
        //            var curr = await UnitOfWork.Currency.GetByIdAsync(curr_from);
        //            CurrBalance = curr.OpeningBalance;
        //        }

        //        decimal CurrAmount = item.TransferAmount;

        //        ExCurrenciesBvrDto exCurrenciesBvrDto = new ExCurrenciesBvrDto()
        //        {
        //            CurrencyId = curr_from,
        //            ActionType = "Delete_TRN_F",
        //            ActionId = entity.TransferId,
        //            ActionDetailId = item.TransferDetailId,
        //            ActionTime = DateTime.Now,
        //            Amount = CurrAmount,
        //            Rate = 0,
        //            ValRate = 0
        //            ,
        //            Balance = CurrBalance + CurrAmount

        //        };
        //        await this.ExCurrenciesBvrService.LightCreate(exCurrenciesBvrDto);
        //        #endregion

        //        #region to
        //        CurrBalance = 0;
        //        CurrentCurrencies = (await UnitOfWork.ExCurrenciesBvr.GetAsync("CurrencyID = " + curr_to));
        //        if (CurrentCurrencies.Count() > 0)
        //            CurrBalance = CurrentCurrencies.OrderByDescending(a => a.Id).FirstOrDefault().Balance;
        //        else
        //        {
        //            var curr = await UnitOfWork.Currency.GetByIdAsync(curr_to);
        //            CurrBalance = curr.OpeningBalance;
        //        }

        //        CurrAmount = item.TransferAmount * -1;

        //        ExCurrenciesBvrDto exCurrenciesBvrDto2 = new ExCurrenciesBvrDto()
        //        {
        //            CurrencyId = curr_to,
        //                ActionType = "Delete_TRN_T",
        //            ActionId = entity.TransferId,
        //            ActionDetailId = item.TransferDetailId,
        //            ActionTime = DateTime.Now,
        //            Amount = CurrAmount,
        //            Rate = 0,
        //            ValRate = 0
        //            ,
        //            Balance = CurrBalance + CurrAmount

        //        };
        //        await this.ExCurrenciesBvrService.LightCreate(exCurrenciesBvrDto2);
        //        #endregion

        //    }


        //        await AJvService.DeleteAJV(11, entity.TransferId);


        //    return true;

        //}

        protected async override Task<ExTreasuryTransfereDto> BeforeUpdate(ExTreasuryTransfere entity, ExTreasuryTransfereDto dto)
        {
            await OnCreated(Mapper.MapperObject.Mapper.Map<ExTreasuryTransfere>(dto), dto);
            await OnDeleting(await UnitOfWork.ExTreasuryTransfere.GetByIdAsync(entity.TransferId));

            return dto;
        }
            //protected async override Task<ExTreasuryTransfereDto> BeforeUpdate(ExTreasuryTransfere entity, ExTreasuryTransfereDto dto)
            //{

            //    for (int i = 0; i < dto.ExTreasuryTransfereDetail.Count(); i++)
            //    {
            //        var item = dto.ExTreasuryTransfereDetail.ToList()[i];
            //        if (item.TransferDetailId == 0)
            //        {
            //            item = await ExTreasuryTransfereDetailervice.LightCreate(item);
            //            await SetCurrencyBvrToUpdate(item, item.TransferAmount, dto.FromBranchID, dto.ToBranchID, dto.FromTreasuryId, dto.ToTreasuryId, "create");
            //        }
            //        else
            //        {
            //            var oldItem = await ExTreasuryTransfereDetailervice.GetById(item.TransferDetailId);
            //            await SetCurrencyBvrToUpdate(item, item.TransferAmount - oldItem.TransferAmount, dto.FromBranchID, dto.ToBranchID, dto.FromTreasuryId, dto.ToTreasuryId, "update");
            //            item = await ExTreasuryTransfereDetailervice.LightUpdate(item);
            //        }

            //        dto.ExTreasuryTransfereDetail.ToList()[i] = item;
            //        dto.ExTreasuryTransfereDetail.ToList()[i].TransferDetailId = item.TransferDetailId;

            //    }

            //    //delete 
            //    var mainData = (await ExTreasuryTransfereDetailervice.GetByCond("TransferId == " + entity.TransferId + "")).ToList();
            //    for (int i = 0; i < mainData.Count(); i++)
            //    {
            //        var item = mainData.ToList()[i];
            //        if (dto.ExTreasuryTransfereDetail.Where(a => a.TransferDetailId == item.TransferDetailId).ToList().Count() <= 0)
            //        {
            //            await ExTreasuryTransfereDetailervice.Delete(item.TransferDetailId);
            //            await SetCurrencyBvrToUpdate(item, item.TransferAmount, dto.FromBranchID, dto.ToBranchID, dto.FromTreasuryId, dto.ToTreasuryId, "delete");
            //        }
            //    }


            //    return dto;
            //}


        //    protected async Task<bool> SetCurrencyBvrToUpdate(ExTreasuryTransfereDetailDto item, decimal Amount, int? FromBranchID, int? ToBranchID, int? FromTreasuryId, int? ToTreasuryId, string action)
        //{


        //    if (Amount == 0)
        //        return true;
        //    decimal Amount1 = Amount;
        //    decimal Amount2 = Amount;
        //    int CurrencyCode = (await UnitOfWork.Currency.GetAsync("CurrencyID = " + item.CurrencyId)).FirstOrDefault().CurrencyCode;
        //    int curr_from = (await UnitOfWork.Currency.GetAsync("CurrencyCode = " + CurrencyCode)).Where(a => a.BranchID == FromBranchID && a.TreasuryId == FromTreasuryId).FirstOrDefault().CurrencyId;
        //    int curr_to = (await UnitOfWork.Currency.GetAsync("CurrencyCode = " + CurrencyCode)).Where(a => a.BranchID == ToBranchID && a.TreasuryId == ToTreasuryId).FirstOrDefault().CurrencyId;

        //    //from
        //    decimal CurrBalance = 0;
        //    var CurrentCurrencies = (await UnitOfWork.ExCurrenciesBvr.GetAsync("CurrencyID = " + curr_from));
        //    if (CurrentCurrencies.Count() > 0)
        //        CurrBalance = CurrentCurrencies.OrderByDescending(a => a.Id).FirstOrDefault().Balance;
        //    else
        //    {
        //        var curr = await UnitOfWork.Currency.GetByIdAsync(curr_from);
        //        CurrBalance = curr.OpeningBalance;
        //    }

        //    if (action == "create" || action == "update")
        //    {
        //        Amount1 = Amount1 * -1;
        //    }
        //    else
        //        Amount1 = Amount1;

        //    ExCurrenciesBvrDto exCurrenciesBvrDto = new ExCurrenciesBvrDto()
        //    {
        //        CurrencyId = curr_from,
        //        ActionType = "Update_TRN_F_" + action,
        //        ActionId = item.TransferId,
        //        ActionDetailId = item.TransferDetailId,
        //        ActionTime = DateTime.Now,
        //        Amount = Amount1,
        //        Balance = CurrBalance + Amount1
        //    };
        //    await this.ExCurrenciesBvrService.LightCreate(exCurrenciesBvrDto);



        //    //to

        //    decimal CurrBalance2 = 0;
        //    var CurrentCurrencies2 = (await UnitOfWork.ExCurrenciesBvr.GetAsync("CurrencyID = " + curr_to));
        //    if (CurrentCurrencies2.Count() > 0)
        //        CurrBalance2 = CurrentCurrencies2.OrderByDescending(a => a.Id).FirstOrDefault().Balance;
        //    else
        //    {
        //        var curr2 = await UnitOfWork.Currency.GetByIdAsync(curr_to);
        //        CurrBalance2 = curr2.OpeningBalance;
        //    }

        //    if (action == "create" || action == "update")
        //    {
        //        Amount2 = Amount2;
        //    }
        //    else
        //        Amount2 = Amount2 * -1;

        //    ExCurrenciesBvrDto exCurrenciesBvrDto2 = new ExCurrenciesBvrDto()
        //    {
        //        CurrencyId = curr_to,
        //        ActionType = "Update_TRN_F_" + action,
        //        ActionId = item.TransferId,
        //        ActionDetailId = item.TransferDetailId,
        //        ActionTime = DateTime.Now,
        //        Amount = Amount2,
        //        Balance = CurrBalance2 + Amount2
        //    };
        //    await this.ExCurrenciesBvrService.LightCreate(exCurrenciesBvrDto2);
        //    return true;
        //}



        public override async Task<ExchangeResponse<PagingResultDto<ExTreasuryTransfereDto>>> GetAllPaging_ExResponse(PagingInputDto pagingInputDto)
        {
            try
            {
                var result = await Repository.GetAllPagingAsync(pagingInputDto);

                var list = Mapper.MapperObject.Mapper.Map<IList<ExTreasuryTransfereDto>>(result.Item1);

                foreach (var item in list)
                {
                    if (item.IsPendingWorkflow == true)
                    {
                        try
                        {

                            var request = (await UnitOfWork.WFRequest.GetAsync("EntityId==   \"" + item.TransferId.ToString() + "\" && RequestTypeid == 1 && BranchID ==" + item.FromBranchID)).Where(a => a.IsCompleted == false).FirstOrDefault();
                            var allApprovals = (await UnitOfWork.WFListOfApprovals.GetAsync("(RequestTypeid == 5 || RequestTypeid == 6 ) && BranchID ==" + item.FromBranchID)).OrderBy(a => a.ActionOrder);
                            foreach (var approval in allApprovals)
                            {
                                var xx = (await UnitOfWork.WFRequestDetails.GetAsync("RequestId== " + request.RequestId.ToString())).Where(a => a.ActionOrder == approval.ActionOrder);
                                var xx2 = (await UnitOfWork.WFRequestDetails.GetAsync("RequestId== " + request.RequestId.ToString())).Where(a => a.ActionType == 0);

                                if (xx2.Count() > 0)
                                {
                                    item.WorkFlowStatus = "تم الرفض ";
                                }
                                else
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


                var response = new PagingResultDto<ExTreasuryTransfereDto>
                {
                    Result = list,
                    Total = result.Item2
                };

                return new ExchangeResponse<PagingResultDto<ExTreasuryTransfereDto>> { Status = ResponseEnum.Ok, Result = response };
                // return response;
            }
            catch (System.Exception ex)
            {
                return new ExchangeResponse<PagingResultDto<ExTreasuryTransfereDto>> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء التعامل مع البيانات" };
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


    }
}

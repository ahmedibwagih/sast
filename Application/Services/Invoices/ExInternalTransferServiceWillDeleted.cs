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
using Application.Core.DTOs.TRN_Invoices;
using Application.Core.DTOs.TRN_Transfers;
using Application.Core.DTOs.TRN_WholeInvoices;
using Application.Core.Services;
using Application.Core.Services.LookUps;
using Azure;
using Core;
using Core.DTOs;
using Core.Entities.LookUps;
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
    public class ExInternalTransferService : BaseService<ExInternalTransfer, ExInternalTransferDto, ExInternalTransferDto, ExInternalTransferDto, ExInternalTransferDto>, IExInternalTransferService
    {
        //  private readonly DynamoSession session;

        IService<ExInternalTransfersDetail, ExInternalTransfersDetailDto, ExInternalTransfersDetailDto, ExInternalTransfersDetailDto, ExInternalTransfersDetailDto> ExInternalTransfersDetailService;
        IService<ExCurrenciesBvr, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto> ExCurrenciesBvrService;
        public ExInternalTransferService(IUnitOfWork unitOfWork, IService<ExInternalTransfersDetail, ExInternalTransfersDetailDto, ExInternalTransfersDetailDto, ExInternalTransfersDetailDto, ExInternalTransfersDetailDto> exInternalTransfersDetailService
       , IService<ExCurrenciesBvr, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto, ExCurrenciesBvrDto> exCurrenciesBvrService ) : base(unitOfWork)
        {
            ExInternalTransfersDetailService = exInternalTransfersDetailService;
            ExCurrenciesBvrService = exCurrenciesBvrService;
        }


        public async Task<int> GetNextTransferNo()
        {
            int response = await UnitOfWork.ExInternalTransfer.GetNextTransferNo();
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

        public override async Task<ExchangeResponse<ExInternalTransferDto>> Create_ExResponse(ExInternalTransferDto input)
        {


            try
            {

                var entity = Mapper.MapperObject.Mapper.Map<ExInternalTransfer>(input);
                await OnCreating(entity, input);
                UnitOfWork.BeginTran();
                entity.TransferNo = await UnitOfWork.ExInternalTransfer.GetNextTransferNo();
                var newEntity = await UnitOfWork.ExInternalTransfer.AddAsync(entity);

                await UnitOfWork.CompleteAsync();

                await OnCreated(newEntity, input);

                UnitOfWork.CommitTran();

                var response = Mapper.MapperObject.Mapper.Map<ExInternalTransferDto>(newEntity);
                return new ExchangeResponse<ExInternalTransferDto> { Status = ResponseEnum.Ok, Result = response };
            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<ExInternalTransferDto> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء حفظ البيانات" };

            }

        }



        //async Task<ExchangeResponse<ExInternalTransfersDetailDto>> AddExInternalTransfersDetail(ExInternalTransfersDetailDto input)
        //{


        //}

        public async Task<ExchangeResponse<ExInternalTransfersDetailDto>> AddExInternalTransfersDetail(ExInternalTransfersDetailDto input)
        {
            try
            {

                var inserted = await(ExInternalTransfersDetailService.LightCreate(input));
                return new ExchangeResponse<ExInternalTransfersDetailDto> { Status = ResponseEnum.Ok, Result = inserted };

            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<ExInternalTransfersDetailDto> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء حفظ البيانات" };

            }
        }

        //protected async override Task<bool> OnCreated(ExInternalTransfer entity, ExInternalTransferDto dto)
        //{

        //    for (int i = 0; i < entity.ExInternalTransfersDetails.Count(); i++)
        //    {
        //        var item = entity.ExInternalTransfersDetails.ToList()[i];
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

        //        decimal CurrAmount = item.TransferAmount;
        //        if (item.TransferType == 1)
        //            CurrAmount = item.TransferAmount * -1;

        //        ExCurrenciesBvrDto exCurrenciesBvrDto = new ExCurrenciesBvrDto()
        //        {
        //            CurrencyId = item.CurrencyId,
        //            ActionType = "whl",
        //            ActionId = entity.TransferId,
        //            ActionDetailId = item.TransferDetailId,
        //            ActionTime = DateTime.Now,
        //            Amount = CurrAmount,
        //            Rate =0 ,
        //            ValRate = 0
        //            ,
        //            Balance = CurrBalance + CurrAmount
        //        };
        //        await this.ExCurrenciesBvrService.LightCreate(exCurrenciesBvrDto);

        //    }
        //    return true;

        //}

        //protected async override Task<ExInternalTransferDto> BeforeUpdate(ExInternalTransfer entity, ExInternalTransferDto dto)
        //{

        //    for (int i = 0; i < dto.ExInternalTransfersDetails.Count(); i++)
        //    {
        //        var item = dto.ExInternalTransfersDetails.ToList()[i];
        //        if (item.TransferDetailId == 0)
        //            item = await ExInternalTransfersDetailService.LightCreate(item);
        //        else
        //            item = await ExInternalTransfersDetailService.LightUpdate(item);

        //        dto.ExInternalTransfersDetails.ToList()[i] = item;
        //        dto.ExInternalTransfersDetails.ToList()[i].TransferDetailId = item.TransferDetailId;

        //    }

        //    //delete 
        //    var mainData = (await ExInternalTransfersDetailService.GetByCond("TransferId == " + entity.TransferId + "")).ToList();
        //    for (int i = 0; i < mainData.Count(); i++)
        //    {
        //        var item = mainData.ToList()[i];
        //        if (dto.ExInternalTransfersDetails.Where(a => a.TransferDetailId == item.TransferDetailId).ToList().Count() <= 0)
        //            await ExInternalTransfersDetailService.Delete(item.TransferDetailId);
        //    }


        //    return dto;
        //}



    }
}

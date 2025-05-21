using System;
using System.Collections.Generic;
using System.Configuration;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;

using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

using Application.Core.DTOs.LookUps;
using Application.Core.Services;
using Application.Core.Services.LookUps;
using Azure;
using Core;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.TRN_WholeInvoices;
using Core.Other;
using Core.UnitOfWork;



using Infrastructure.UnitOfWork;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using static Google.Apis.Requests.BatchRequest;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace Application.Services.LookUps
{
    public class CurrenciesService : BaseService<Currency, CurrencyDto, CurrencyDto, CurrencyDto, CurrencyDto>, ICurrenciesMainService
    {
       // private readonly DynamoSession session;
        private IUnitOfWork unitOfWork;
        public CurrenciesService(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
            
            //this.session = session;
            this.unitOfWork = unitOfWork;
        }

        public override async Task<CurrencyDto> GetById(long id)
        {
            var response = await base.GetById(id);
            return response;
        }

        public async Task<bool> SetDefaultCurrency(long id)
        {
            var Currencies = await this.GetAll();
            foreach (var cur in Currencies)
            {
                var response = await unitOfWork.Currency.GetByIdAsync(cur.CurrencyId );
                if (response.CurrencyId == id)
                    response.IsDefault = true;
                else
                    response.IsDefault = false;
                await unitOfWork.CompleteAsync();
            }

           //await unitOfWork.CompleteAsync();
           // await base.UnitOfWork.CompleteAsync();
            return true;
        }

        public async Task<CurrencyDto> GetDefaultCurrency()
        {
            var Currency = (await base.GetAll()).ToList().Where(a=>a.IsDefault==true).FirstOrDefault();

            return Currency;
        }


        public override async Task<CurrencyDto> Create(CurrencyDto input)
        {


            try
            {
               
                var cheh_dup = await UnitOfWork.Currency.GetAsync("CurrencyCode == " + input.CurrencyCode.ToString() + " && BranchID == " + input.BranchID.ToString() + " && IsDeleted = false");

                if (cheh_dup.Count > 0)
                {
                    throw new System.Exception("this Currency with  branch exists");
                }


                var entity = Mapper.MapperObject.Mapper.Map<Currency>(input);

                var x = 0;
                try
                { x = (await UnitOfWork.Currency.GetAllAsync_withDeleted()).Max(a => a.CurrencyId); }
                catch { }


                entity.CurrencyId = x + 1;





                if (entity is null)
                {
                    throw new System.Exception(AppMessages.InternalError);
                }

                await OnCreating(entity, input);


                UnitOfWork.BeginTran();

                var newEntity = await Repository.AddAsync(entity);

                await UnitOfWork.CompleteAsync();

                await OnCreated(newEntity, input);

                UnitOfWork.CommitTran();

                var response = Mapper.MapperObject.Mapper.Map<CurrencyDto>(newEntity);
                return response;
            }
            catch (System.Exception ex)
            {

                throw;
            }
            return null;
        }


        public virtual async Task<IList<CurrencyDto>> GetByBranchid(int branchId)
        {
            var list = (await Repository.GetAllAsync()).Where(a=>a.BranchID == branchId);
            if (list.Count() == 0)
            {
                unitOfWork.ExecuteRawSql(@"INSERT INTO [dbo].[Currencies]
           ([CurrencyID]
           ,[CurrencyCode]
           ,[CurrencyNameEn]
           ,[CurrencyNameAr]
           ,[Sign]
           ,[SalePrice]
           ,[BuyPrice]
           ,[ValuationPrice]
           ,[IsActive]
           ,[OpeningBalance]
           ,[OpeningPrice]
           ,[ShowInPricesScreen]
           ,[IsDefault]
           ,[IsDeleted]
           ,[BranchID])
SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) + (SELECT ISNULL(MAX(CurrencyID), 0) + 1 FROM [dbo].[Currencies]) AS [CurrencyID],
       [CurrencyCode]
       ,[CurrencyNameEn]
       ,[CurrencyNameAr]
       ,0 AS [Sign]
       ,0 AS [SalePrice]
       ,0 AS [BuyPrice]
       ,0 AS [ValuationPrice]
       ,1 AS [IsActive]
       ,0 AS [OpeningBalance]
       ,0 AS [OpeningPrice]
       ,0 AS [ShowInPricesScreen]
       ,0 AS [IsDefault]
       ,0 AS [IsDeleted]
       ," + branchId + @" AS [BranchID]
        FROM [CurrencyBase]");

                list = (await Repository.GetAllAsync()).Where(a => a.BranchID == branchId);
            }
            var result = Mapper.MapperObject.Mapper.Map<IList<CurrencyDto>>(list);

            return result;
        }

        public override async Task<bool> TrackingUpdate(Currency entity, CurrencyDto dto)
        {
            string before  = JsonSerializer.Serialize(entity);
            string after  = JsonSerializer.Serialize(dto);
           await unitOfWork.TrackingData.AddAsync(new TrackingData() { ActionType = 1, date = DateTime.Now, EntityId = dto.CurrencyId.ToString(), JsonAfter = after, JsonBefore = before, TableName = "Currency" });
            // await unitOfWork.CompleteAsync();
            return true;
        }

        protected async override Task<bool> OnUpdated(Currency entity, CurrencyDto dto)
        {

            unitOfWork.ExecuteRawSql(@" UPDATE Currencies
        SET saleprice ="+ entity.SalePrice.ToString() +@",
        buyprice = "+ entity.BuyPrice.ToString() + @",
        valuationprice = "+ entity.ValuationPrice.ToString() + @"
        where   currencycode =" + entity.CurrencyCode.ToString() + @"
        ");
            return true;
        }





        //protected async override Task<bool> OnCreated(Currencies entity, CurrenciesDto dto)
        //{
        //    await this.attachmentService.Save(entity.Id, AttachmentTypeEnum.Currencies, dto.Attachments, true);

        //    return await base.OnCreated(entity, dto);
        //}

        //protected async override Task<bool> OnUpdated(Currencies entity, CurrenciesDto dto)
        //{
        //    await this.attachmentService.Save(entity.Id, AttachmentTypeEnum.Currencies, dto.Attachments, false);

        //    return await base.OnUpdated(entity, dto);
        //}

        //public virtual async Task<PagingResultDto<CurrenciesDto>> GetActiveCurrenciessPaging(ActiveCurrenciesPagingInputDto pagingInputDto)
        //{
        //    var result = await Repository.GetAllPagingAsync(new PagingInputDto());

        //    var list = Mapper.MapperObject.Mapper.Map<IList<CurrenciesInfoDto>>(result.Item1);

        //    var response = new PagingResultDto<CurrenciesInfoDto>
        //    {
        //        Result = list,
        //        Total = result.Item2
        //    };

        //    foreach (var item in response.Result)
        //    {
        //        item.Attachments = await attachmentService.GetAttachments(item.Id, AttachmentTypeEnum.Currencies);
        //    }

        //    return response;
        //}


    }
}

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
using Application.Core.DTOs.Workflow;
using Application.Core.DTOs.WorkFlow;
using Application.Core.Services;
using Application.Core.Services.LookUps;
using Application.Core.Services.WorkFlow;
using Azure;
using Core;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.Taswya;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;
using Core.Entities.TRN_WholeInvoices;
using Core.Entities.Workflow;
using Core.Other;
using Core.UnitOfWork;
using Infrastructure.UnitOfWork;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Diagnostics;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using NetTopologySuite.Index.HPRtree;
using Org.BouncyCastle.Ocsp;
using static Google.Apis.Requests.BatchRequest;

namespace Application.Services.LookUps
{
    public class TrackingDataService : BaseService<TrackingData, TrackingDataDto, TrackingDataDto, TrackingDataDto, TrackingDataDto>, ITrackingDataService
    {
        //  private readonly DynamoSession session;

      
        public TrackingDataService(IUnitOfWork unitOfWork
           
            ): base(unitOfWork)
        {
           
        }


        public async Task<ExchangeResponse<List<CurrencyChangesDto>>> GetCurrencyChanges(DateTime from, DateTime to,int userid)
        {
            try
            {
                var entity = await this.UnitOfWork.TrackingData.GetTracking("Currency", from, to, 1);
                List<CurrencyChangesDto> result = new List<CurrencyChangesDto>();

                foreach (var item in entity.ToList())
                {
                    Currency before = JsonSerializer.Deserialize<Currency>(item.JsonBefore);
                    CurrencyDto after = JsonSerializer.Deserialize<CurrencyDto>(item.JsonAfter);
                    string brn = (await UnitOfWork.ExBranch.GetByIdAsync(after.BranchID)).BranchNameAr;
                    string treasury= (await UnitOfWork.Treasury.GetByIdAsync(after.TreasuryId)).TreasuryNameAr;
                    if (before.BuyPrice != after.BuyPrice || before.SalePrice != after.SalePrice)
                    {
                        result.Add(new CurrencyChangesDto {currencuName=after.CurrencyNameAr,BranchName=brn,TreasuryName=treasury,
                            BuyPriceAfter=after.BuyPrice,BuyPriceBefore=before.BuyPrice,date=item.date,SalePriceAfter=after.SalePrice,SalePriceBefore=before.SalePrice,userid=userid });
                    }
                }
             
                return new ExchangeResponse<List<CurrencyChangesDto>> { Status = ResponseEnum.Ok, Result = result.ToList() };
            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<List<CurrencyChangesDto>> { Status = ResponseEnum.Fail, Error_Desc = ex.Message };
            }
        }



    }
}

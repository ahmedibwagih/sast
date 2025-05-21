using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;

using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.Services;
using Application.Core.Services.LookUps;
using Core;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.Sec;
using Core.Other;
using Core.UnitOfWork;



using Infrastructure.UnitOfWork;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using static Google.Apis.Requests.BatchRequest;
using Application.Mapper;

namespace Application.Services.LookUps
{
  
        public class ShiftTrackingService : BaseService<ShiftTracking, ShiftTrackingDto, ShiftTrackingDto, ShiftTrackingDto, ShiftTrackingDto>, IShiftTrackingService
    {
        //  private readonly DynamoSession session;
        IUnitOfWork UnitOfWork;
        public ShiftTrackingService(IUnitOfWork unitOfWork
       ) : base(unitOfWork)
        {
            UnitOfWork = unitOfWork;
            //this.session = session;
        }



        public async Task<ExchangeResponse<result1Dto>> GetLastTreasuryUser(int treasuryId)
        {
            try
            {
                var tr = (await UnitOfWork.ShiftTracking.GetAsync("TreasuryId == " + treasuryId.ToString())).ToList();
                if (tr.Count > 0)
                    return new ExchangeResponse<result1Dto>() { Status = ResponseEnum.Ok, Result = new result1Dto() { UserID = tr.OrderByDescending(a => a.ShiftTrackingID).FirstOrDefault().ToUserId } };
                else
                {
                    var tr2 = (await UnitOfWork.Treasury.GetAsync("TreasuryId == " + treasuryId.ToString())).ToList().FirstOrDefault().OwnerId;
                    return new ExchangeResponse<result1Dto> (){ Status = ResponseEnum.Ok, Result =new result1Dto() {UserID=tr2 } };
                }    
                   
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }

        public async Task<ExchangeResponse<List<result2Dto>>> GetTreasuryBalances(int treasuryId)
        {
            try
            {
                var trs = (await UnitOfWork.Currency.GetAsync("TreasuryId == " + treasuryId.ToString())).ToList();
                List<result2Dto> l = new List<result2Dto>();

                foreach (var tr in trs)
                {
                    l.Add(new result2Dto() { CurrencyName = tr.CurrencyNameAr, TreasuryId = treasuryId, Balance = (await GetBalance(tr.CurrencyId)) });
                }

                return new ExchangeResponse<List<result2Dto>>() { Status = ResponseEnum.Ok, Result = l };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }


        public async Task<ExchangeResponse<List<ShiftTrackingDto>>> SaveShiftTracking(ShiftTrackingSaveInput input)
        {
            try
            {
                var trs = (await UnitOfWork.Currency.GetAsync("TreasuryId == " + input.TreasuryId.ToString())).ToList();
                List<ShiftTrackingDto> l = new List<ShiftTrackingDto>();

                UnitOfWork.BeginTran();
                foreach (var tr in trs)
                {
                    ShiftTrackingDto n = new ShiftTrackingDto() { CurrencyId = tr.CurrencyId, CurrentBalance = (await GetBalance(tr.CurrencyId)), Date = input.Date, FromUserId = input.FromUserId, Notes = input.Notes, ToUserId = input.ToUserId, TreasuryId = input.TreasuryId };
                    l.Add(n);
                    await this.LightCreate(n);
                }
                UnitOfWork.CommitTran();
                return new ExchangeResponse<List<ShiftTrackingDto>>() { Result = l, Status = ResponseEnum.Ok };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }


        private async Task<decimal> GetBalance(int CurrencyId)
        {
            try
            {
                var tr = (await UnitOfWork.ExCurrenciesBvr.GetAsync("CurrencyId == " + CurrencyId.ToString())).ToList();
                    
                    
                if (tr.Count > 0)
                    return tr.OrderByDescending(a => a.Id).FirstOrDefault().Balance;
                else
                {
                    var tr2 = (await UnitOfWork.Currency.GetAsync("CurrencyId == " + CurrencyId.ToString())).ToList().FirstOrDefault().OpeningBalance;
                    return tr2;
                }

            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }




        public async Task<ExchangeResponse<List<ShiftTrackingDto>>> GetAllShiftTracking(GetAllShiftTrackingInput input)
        {
            try
            {
                List < ShiftTracking> trs = (await UnitOfWork.ShiftTracking.GetAsync("TreasuryId == " + input.TreasuryId.ToString())).ToList();
                List<ShiftTrackingDto> list = MapperObject.Mapper.Map<List<ShiftTrackingDto>>(trs);
                if (input.CurrencyId != null && input.CurrencyId != 0)
                    list= list.Where(a=>a.CurrencyId == input.CurrencyId).ToList();

                if (input.Date != null)
                    list = list.Where(a => a.Date.ToString("yyyy-MM-dd") == input.Date?.ToString("yyyy-MM-dd")).ToList();

                return new ExchangeResponse<List<ShiftTrackingDto>>() { Result = list, Status = ResponseEnum.Ok };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }


    }

}

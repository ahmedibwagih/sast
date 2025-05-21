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
using Application.Core.Services;
using Application.Core.Services.LookUps;
using Core;
using Core.DTOs;
using Core.DTOs.FinReports;
using Core.Entities.LookUps;
using Core.Other;
using Core.UnitOfWork;
using Infrastructure.UnitOfWork;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using static Google.Apis.Requests.BatchRequest;

namespace Application.Services.LookUps
{
    public class ProcService :  BaseService<ExBank, ExBankDto, ExBankDto, ExBankDto, ExBankDto>, IProcService
    {
        //  private readonly DynamoSession session;

        public ProcService(IUnitOfWork unitOfWork
       ) :base(unitOfWork) 
        {
    

        }

        public async Task<ExchangeResponse<List<Exchange_CurrenciesBalanceOutput>>> Sp_Exchange_CurrenciesBalance(Exchange_CurrenciesBalanceInput input)
        {
            //var xx = this.UnitOfWork.Sp_Exchange_CurrenciesBalance(new Exchange_CurrenciesBalanceInput() { branchId = 1, date = DateTime.Now, Type = 1, Userid = 2244 });
            // var response = await base.GetById(id);
            try
            {
                return new ExchangeResponse<List<Exchange_CurrenciesBalanceOutput>>() { Result = this.UnitOfWork.Sp_Exchange_CurrenciesBalance(input), Status = ResponseEnum.Ok };
            }
            catch (Exception ex) {
                return new ExchangeResponse<List<Exchange_CurrenciesBalanceOutput>>() { Error_Desc=ex.Message,Notes="خطا بالبيانات", Status = ResponseEnum.Fail };
            }
        }



        public async Task<ExchangeResponse<List<Exchange_MovementOutput>>> Sp_Exchange_Movement(Exchange_MovementInput input)
        {
            try
            {
                return new ExchangeResponse<List<Exchange_MovementOutput>>() { Result = this.UnitOfWork.Sp_Exchange_Movement(input), Status = ResponseEnum.Ok };
            }
            catch (Exception ex)
            {
                return new ExchangeResponse<List<Exchange_MovementOutput>>() { Error_Desc = ex.Message, Notes = "خطا بالبيانات", Status = ResponseEnum.Fail };
            }
        }




        public async Task<ExchangeResponse<List<Exchange_WholeMovementOutput>>> Sp_Exchange_WholeMovement(Exchange_WholeMovementInput input)
        {
            try
            {
                return new ExchangeResponse<List<Exchange_WholeMovementOutput>>() { Result = this.UnitOfWork.Sp_Exchange_WholeMovement(input), Status = ResponseEnum.Ok };
            }
            catch (Exception ex)
            {
                return new ExchangeResponse<List<Exchange_WholeMovementOutput>>() { Error_Desc = ex.Message, Notes = "خطا بالبيانات", Status = ResponseEnum.Fail };
            }
        }




        public async Task<ExchangeResponse<List<Exchange_CurrencyMovementOutput>>> Sp_Exchange_CurrencyMovement(Exchange_CurrencyMovementInput input)
        {
            try
            {
                return new ExchangeResponse<List<Exchange_CurrencyMovementOutput>>() { Result = this.UnitOfWork.Sp_Exchange_CurrencyMovement(input), Status = ResponseEnum.Ok };
            }
            catch (Exception ex)
            {
                return new ExchangeResponse<List<Exchange_CurrencyMovementOutput>>() { Error_Desc = ex.Message, Notes = "خطا بالبيانات", Status = ResponseEnum.Fail };
            }
        }



        
       public async Task<ExchangeResponse<List<ProfitOutput>>> Sp_Exchange_Profit(ProfitInput input)
        {
            try
            {
                return new ExchangeResponse<List<ProfitOutput>>() { Result = this.UnitOfWork.Sp_Exchange_Profit(input), Status = ResponseEnum.Ok };
            }
            catch (Exception ex)
            {
                return new ExchangeResponse<List<ProfitOutput>>() { Error_Desc = ex.Message, Notes = "خطا بالبيانات", Status = ResponseEnum.Fail };
            }
        }
        

         public async Task<ExchangeResponse<List<SalesBuysOutput>>> Sp_Exchange_SalesBuys(SalesBuysInput input)
        {
            try
            {
                return new ExchangeResponse<List<SalesBuysOutput>>() { Result = this.UnitOfWork.Sp_Exchange_SalesBuys(input), Status = ResponseEnum.Ok };
            }
            catch (Exception ex)
            {
                return new ExchangeResponse<List<SalesBuysOutput>>() { Error_Desc = ex.Message, Notes = "خطا بالبيانات", Status = ResponseEnum.Fail };
            }
        }

        public async Task<ExchangeResponse<List<DialyKoyodOutput>>> Sp_Exchange_DialyKoyod(DialyKoyodInput input)
        {
            try
            {
                return new ExchangeResponse<List<DialyKoyodOutput>>() { Result = this.UnitOfWork.Sp_Exchange_DialyKoyod(input), Status = ResponseEnum.Ok };
            }
            catch (Exception ex)
            {
                return new ExchangeResponse<List<DialyKoyodOutput>>() { Error_Desc = ex.Message, Notes = "خطا بالبيانات", Status = ResponseEnum.Fail };
            }
        }
        public async Task<ExchangeResponse<List<KashfHesabOutput>>> Sp_Exchange_KashfHesab(KashfHesabInput input)
        {
            try
            {
                return new ExchangeResponse<List<KashfHesabOutput>>() { Result = this.UnitOfWork.Sp_Exchange_KashfHesab(input), Status = ResponseEnum.Ok };
            }
            catch (Exception ex)
            {
                return new ExchangeResponse<List<KashfHesabOutput>>() { Error_Desc = ex.Message, Notes = "خطا بالبيانات", Status = ResponseEnum.Fail };
            }
        }
        public async Task<ExchangeResponse<List<Central_statmentOutPut>>> Sp_Exchange_Central_statment(Central_statmentInput input)
        {
            try
            {
                
                return new ExchangeResponse<List<Central_statmentOutPut>>() { Result = this.UnitOfWork.Sp_Exchange_Central_statment(input), Status = ResponseEnum.Ok };
            }
            catch (Exception ex)
            {
                return new ExchangeResponse<List<Central_statmentOutPut>>() { Error_Desc = ex.Message, Notes = "خطا بالبيانات", Status = ResponseEnum.Fail };
            }
        }

        public async Task<ExchangeResponse<List<Central_statmentOutPut_compare>>> Sp_Exchange_Central_statment_compare(Central_statmentInput_compare input)
        {
            try
            {
                List<Central_statmentOutPut> result1 = this.UnitOfWork.Sp_Exchange_Central_statment(new Central_statmentInput() { branchId = input.branchId, Date = input.Date1, AccountLevel = input.AccountLevel, onlythislevel = 1 });
                List<Central_statmentOutPut> result2 = this.UnitOfWork.Sp_Exchange_Central_statment(new Central_statmentInput() { branchId = input.branchId, Date = input.Date2, AccountLevel = input.AccountLevel, onlythislevel = 1 });
                List<Central_statmentOutPut_compare> result = new List<Central_statmentOutPut_compare>();
                foreach (Central_statmentOutPut i in result1)
                {
                    result.Add(new Central_statmentOutPut_compare() { AccountID = i.AccountID, AccountName = i.AccountName, ParentID = i.ParentID, Value1 = i.Value, Value2 = 0 });
                }

                foreach (Central_statmentOutPut i in result2)
                {
                    if (result.Where(a => a.AccountID == i.AccountID && a.ParentID==i.ParentID).Count() == 1)
                    {
                        Central_statmentOutPut_compare current = result.Where(a => a.AccountID == i.AccountID && a.ParentID == i.ParentID).FirstOrDefault();
                        current.Value2 = i.Value;
                       
                    }
                    else
                        result.Add(new Central_statmentOutPut_compare() { AccountID = i.AccountID, AccountName = i.AccountName, ParentID = i.ParentID, Value2 = i.Value, Value1 = 0 });
                }
                return new ExchangeResponse<List<Central_statmentOutPut_compare>>() { Result = result, Status = ResponseEnum.Ok };
            }
            catch (Exception ex)
            {
                return new ExchangeResponse<List<Central_statmentOutPut_compare>>() { Error_Desc = ex.Message, Notes = "خطا بالبيانات", Status = ResponseEnum.Fail };
            }
        }
        public async Task<ExchangeResponse<List<Income_StOutPut>>> Sp_Exchange_Income_St(Income_StInput input)
        {
            try
            {
                return new ExchangeResponse<List<Income_StOutPut>>() { Result = this.UnitOfWork.Sp_Exchange_Income_St(input), Status = ResponseEnum.Ok };
            }
            catch (Exception ex)
            {
                return new ExchangeResponse<List<Income_StOutPut>>() { Error_Desc = ex.Message, Notes = "خطا بالبيانات", Status = ResponseEnum.Fail };
            }
        }

        public async Task<ExchangeResponse<List<Income_StOutPut_compare>>> Sp_Exchange_Income_St_compare(Income_StInput_compare input)
        {
            try
            {
                List<Income_StOutPut> result1 = this.UnitOfWork.Sp_Exchange_Income_St(new Income_StInput() { branchId = input.branchId, FromDate = input.FromDate1, ToDate = input.ToDate1 });
                List<Income_StOutPut> result2 = this.UnitOfWork.Sp_Exchange_Income_St(new Income_StInput() { branchId = input.branchId, FromDate = input.FromDate2, ToDate = input.ToDate2 });
                List<Income_StOutPut_compare> result = new List<Income_StOutPut_compare>();
                foreach (Income_StOutPut i in result1)
                {
                    result.Add(new Income_StOutPut_compare() { AccountID = i.AccountID, AccountName = i.AccountName, balance1 = i.balance, credit1 = i.credit, Debit1 = i.Debit, balance2 = 0, credit2 = 0, Debit2 = 0 });
                }

                foreach (Income_StOutPut i in result2)
                {
                    if (result.Where(a => a.AccountID == i.AccountID).Count() == 1)
                    {
                        Income_StOutPut_compare current = result.Where(a => a.AccountID == i.AccountID).FirstOrDefault();
                        current.balance2 = i.balance; 
                        current.credit2=i.credit; 
                        current.Debit2=i.Debit; 
                    }
                    else
                        result.Add(new Income_StOutPut_compare() { AccountID = i.AccountID, AccountName = i.AccountName, balance2 = i.balance, credit2 = i.credit, Debit2 = i.Debit, balance1 = 0, credit1 = 0, Debit1 = 0 });
                }
                 return new ExchangeResponse<List<Income_StOutPut_compare>>() { Result = result, Status = ResponseEnum.Ok };
            }
            catch (Exception ex)
            {
                return new ExchangeResponse<List<Income_StOutPut_compare>>() { Error_Desc = ex.Message, Notes = "خطا بالبيانات", Status = ResponseEnum.Fail };
            }
        }


        public async Task<ExchangeResponse<List<mezanOutPut>>> Sp_Exchange_mezan(mezanInput input)
        {
            try
            {
                return new ExchangeResponse<List<mezanOutPut>>() { Result = this.UnitOfWork.Sp_Exchange_mezan(input), Status = ResponseEnum.Ok };
            }
            catch (Exception ex)
            {
                return new ExchangeResponse<List<mezanOutPut >>() { Error_Desc = ex.Message, Notes = "خطا بالبيانات", Status = ResponseEnum.Fail };
            }
        }
        public async Task<ExchangeResponse<Kashf_TahlelyOutPut>> Sp_Exchange_Kashf_Tahlely(Kashf_TahlelyInput input)
        {
            try
            {
                return new ExchangeResponse<Kashf_TahlelyOutPut>() { Result = this.UnitOfWork.Sp_Exchange_Kashf_Tahlely(input), Status = ResponseEnum.Ok };
            }
            catch (Exception ex)
            {
                return new ExchangeResponse<Kashf_TahlelyOutPut>() { Error_Desc = ex.Message, Notes = "خطا بالبيانات", Status = ResponseEnum.Fail };
            }
        }

        public async Task<ExchangeResponse<AssetBalanceOutPut>> Sp_Exchange_AssetBalance(AssetBalanceInput input)
        {
            try
            {
                return new ExchangeResponse<AssetBalanceOutPut>() { Result = this.UnitOfWork.Sp_Exchange_AssetBalance(input), Status = ResponseEnum.Ok };
            }
            catch (Exception ex)
            {
                return new ExchangeResponse<AssetBalanceOutPut>() { Error_Desc = ex.Message, Notes = "خطا بالبيانات", Status = ResponseEnum.Fail };
            }
        }
        public async Task<ExchangeResponse<List<TreasutyMonementOutput>>> Sp_Exchange_TreasutyMonement(TreasutyMonementInput input)
        {
            try
            {
                return new ExchangeResponse<List<TreasutyMonementOutput>>() { Result = this.UnitOfWork.Sp_Exchange_TreasutyMonement(input), Status = ResponseEnum.Ok };
            }
            catch (Exception ex)
            {
                return new ExchangeResponse<List<TreasutyMonementOutput>>() { Error_Desc = ex.Message, Notes = "خطا بالبيانات", Status = ResponseEnum.Fail };
            }
        }
    }
}

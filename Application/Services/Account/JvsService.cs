using System;
using System.Collections.Generic;
using System.Globalization;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;

using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Application.Core.DTOs;
using Application.Core.DTOs.Account;
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
using Core;
using Core.DTOs;
using Core.Entities.Account;
using Core.Entities.banks;
using Core.Entities.LookUps;
using Core.Entities.others;
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

namespace Application.Services.Account
{
    public class JvsService : BaseService<AJv, AJvDto, AJvDto, AJvDto, AJvDto>, IJvsService
    {
        IService<AJvsDetail, AJvsDetailDto, AJvsDetailDto, AJvsDetailDto, AJvsDetailDto> AJvsDetailService;
        //IService<AJvstatus, AJvstatusDto, AJvstatusDto, AJvstatusDto, AJvstatusDto> AJvstatuservice;
        //IService<AJvtype, AJvtypeDto, AJvtypeDto, AJvtypeDto, AJvtypeDto> AJvtypeService;
        public JvsService(IUnitOfWork unitOfWork
           , IService<AJvsDetail, AJvsDetailDto, AJvsDetailDto, AJvsDetailDto, AJvsDetailDto> aJvsDetailService
            //IService<AJvstatus, AJvstatusDto, AJvstatusDto, AJvstatusDto, AJvstatusDto> aJvstatuservice,
            //IService<AJvtype, AJvtypeDto, AJvtypeDto, AJvtypeDto, AJvtypeDto> aJvtypeService

            ) : base(unitOfWork)
        {
            AJvsDetailService = aJvsDetailService;
            //AJvstatuservice = aJvstatuservice;
            //AJvtypeService = aJvtypeService;
        }

        public virtual async Task<ExchangeResponse<List<UserActionsInputResult>>> GetUserActions(UserActionsInputDto input)
        {
            try
            {
       
                string filter = $"JVDate >= \"{input.From.Year +"-" + input.From.Month + "-" + input.From.Day}\" && JVDate <= \"{input.To.Year + "-" + input.To.Month + "-" + input.To.Day}\"";
                var entity = await UnitOfWork.AJv.GetAsync(filter);
                if (input.BranchID != null && input.BranchID != 0)
                    entity = entity.Where(a => a.BranchID == input.BranchID).ToList();

                if (input.UserId != null && input.UserId != 0)
                    entity = entity.Where(a => a.UserId == input.UserId).ToList();


                if (input.JvtypeId != null && input.JvtypeId != 0)
                    entity = entity.Where(a => a.JvtypeId == input.JvtypeId).ToList();



                List<UserActionsInputResult> response = Mapper.MapperObject.Mapper.Map<List<UserActionsInputResult>>(entity);

                foreach (var item in response)
                {
                    if(item.BranchID != null && item.BranchID != 0)
                    item.BranchName = (await this.UnitOfWork.ExBranch.GetByIdLightAsync(long.Parse(item.BranchID.ToString()))).BranchNameAr;
                    if (item.JvtypeId != null && item.JvtypeId != 0)
                        item.JvtypeName = (await this.UnitOfWork.AJvtype.GetByIdLightAsync(long.Parse(item.JvtypeId.ToString()))).JvtypeNameAr;
              
                    foreach (var item2 in item.AJvsDetails)
                    {
                        if (item2.CurrencyId != null && item2.CurrencyId != 0)
                            item2.CurrencyName = (await this.UnitOfWork.Currency.GetByIdLightAsync(long.Parse(item2.CurrencyId.ToString()))).CurrencyNameAr;

                    }
                }
                return new ExchangeResponse<List<UserActionsInputResult>> { Status = ResponseEnum.Ok, Result = response };
            }
            catch (System.Exception ex)
            {
                return new ExchangeResponse<List<UserActionsInputResult>> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء التعامل مع البيانات" };
            }
        }

        public async Task<bool> UpdatebankAccount(int entityid, int accountId)
        {
            var entity = await UnitOfWork.ExBank.GetByIdAsync(entityid);
            if (entity != null)
                entity.AccountId = accountId;
            await UnitOfWork.CompleteAsync();
            return true;
        }

        public async Task<bool> UpdatebankAccount_forbankaccount(int entityid, int accountId)
        {
            var entity = await UnitOfWork.BankAccount.GetByIdAsync(entityid);
            if (entity != null)
                entity.AccountId = accountId;
            await UnitOfWork.CompleteAsync();
            return true;
        }





        public async Task<bool> UpdateTreasuryAccount(int entityid, int accountId)
        {
            var entity = await UnitOfWork.Treasury.GetByIdAsync(entityid);
            if (entity != null)
                entity.AccountId = accountId;
            await UnitOfWork.CompleteAsync();
            return true;
        }

        public async Task<bool> UpdateSupplierAccount(int entityid, int accountId)
        {
            var entity = await UnitOfWork.ExSupplier.GetByIdAsync(entityid);
            if (entity != null)
                entity.AccountId = accountId;
            await UnitOfWork.CompleteAsync();
            return true;

        }
        //sandok,bank,suppliers,capital,branches,firstStock,LastStock,Sales,Buys,Profit
        public async Task<bool> UpdateStaticAccount(String AccountName, int accountId)
        {
            var entity = (await UnitOfWork.AJvAccountSetting.GetAllAsync()).Where(a => a.AccountName.ToLower() == AccountName.ToLower());

            if (entity != null && entity.Count() > 0)
            {
                var entity2 = await UnitOfWork.AJvAccountSetting.GetByIdAsync(entity.FirstOrDefault().AJvAccountSettingId);
                if (entity2 != null)
                    entity2.AccountId = accountId.ToString();
            }
            else
            {
                await UnitOfWork.AJvAccountSetting.AddAsync(new AJvAccountSetting() { AccountId = accountId.ToString(), AccountName = AccountName });
            }

            await UnitOfWork.CompleteAsync();
            return true;

        }
        public async Task<List<AJvAccountSettingDto>> GetStaticAccount()
        {
            var entities = (await UnitOfWork.AJvAccountSetting.GetAllAsync());

            var entitiesDto = Mapper.MapperObject.Mapper.Map<List<AJvAccountSettingDto>>(entities);

            return entitiesDto;

        }



        protected async override Task<AJvDto> BeforeUpdate(AJv entity, AJvDto dto)
        {

            for (int i = 0; i < dto.AJvsDetails.Count(); i++)
            {
                var item = dto.AJvsDetails.ToList()[i];
                if (item.JvdetailId == 0)
                    item = await AJvsDetailService.LightCreate(item);
                else
                    item = await AJvsDetailService.LightUpdate(item);

                // dto.AJvsDetails.ToList()[i] = item;
                //  dto.AJvsDetails.ToList()[i].JvdetailId = item.JvdetailId;

            }

            //delete 
            var mainData = (await AJvsDetailService.GetByCond("JVID == " + entity.Jvid + "")).ToList();
            for (int i = 0; i < mainData.Count(); i++)
            {
                var item = mainData.ToList()[i];
                if (dto.AJvsDetails.Where(a => a.JvdetailId == item.JvdetailId).ToList().Count() <= 0)
                    await AJvsDetailService.Delete(item.JvdetailId);
            }


            return dto;
        }

        public async Task<int> GetNextTrnNo(int brn)
        {
            int response = await UnitOfWork.AJv.GetNextTrnNo(brn);
            return response;
        }

        public async Task<string> GetAccount_setting(string accountName)
        {
            var result = (await this.UnitOfWork.AJvAccountSetting.GetAllAsync()).Where(a => a.AccountName.ToLower() == accountName.ToLower()).FirstOrDefault();
            return result.AccountId;
        }
        public async Task<int?> GetTreasury_Account(int treasuryId, int currencyId)
        {
            var result = (await this.UnitOfWork.Treasury.GetByIdAsync(treasuryId));
            int result2 = await GetNestedAccountsettingByCurency(int.Parse(result.AccountId.ToString()), currencyId);
            return result2;
        }

        public async Task<int> GetCurrencyId(long BankAccountId)
        {
            var result = (await this.UnitOfWork.BankAccount.GetByIdAsync(BankAccountId));
            return result.CurrencyId;
        }


        public async Task<int?> GetDefaultTreasury_Account(int treasuryId)
        {
            return  await GetTreasury_Account( treasuryId, 1);
        }

        public async Task<int> GetDefaultBankAccountBRV(int bankId)
        {
            return int.Parse( (await this.UnitOfWork.BankAccount.GetAsync("bankId =" + bankId.ToString())).Where(a=>a.IsDeleted != true && a.CurrencyId == 1).FirstOrDefault().BankAccountId.ToString());
        }

        public async Task<int> GetBank_AJVAccount(int bankId,int currencyId)
        {
            var result = (await this.UnitOfWork.ExBank.GetAllAsync()).Where(a => a.IsDeleted != true && a.BankId == bankId).FirstOrDefault();
            var result2 = (await this.UnitOfWork.BankAccount.GetAllAsync()).Where(a => a.IsDeleted != true && a.BankId == bankId && a.CurrencyId == currencyId);
            if (result2.Count() > 0)
                return int.Parse( result2.FirstOrDefault().AccountId?.ToString());
            else
                return int.Parse(result.AccountId?.ToString());
           

        }
        public async Task<int> GetBankaccount_AJVAccount(int bankAccountId)
        {
            var result = (await this.UnitOfWork.BankAccount.GetAllAsync()).Where(a => a.IsDeleted != true && a.BankAccountId == bankAccountId).FirstOrDefault();
           if(result !=null)
                if (result.BankAccountId != null)
                    return int.Parse( result.AccountId.ToString());

            return 0;

        }

        public async Task<int> GetBankAJVAccountFrom_bankAccountId(int bankAccountId, int currencyId)
        {
            //int bankId = (await this.UnitOfWork.BankAccount.GetByIdAsync(bankAccountId)).BankId;
            //return await GetBank_AJVAccount(bankId, currencyId);

            int? BankAccountId = (await this.UnitOfWork.BankAccount.GetByIdAsync(bankAccountId)).AccountId;

            if (BankAccountId == null)
                return 0;
            else
                return int.Parse (BankAccountId.ToString());
        }



        public async Task<int?> GetRiyal_currencyId(int treasuryId)
        {
            //var result = (await this.UnitOfWork.Currencies.GetByIdAsync(treasuryId));
            var result = (await this.UnitOfWork.Currency.GetAllAsync()).Where(a => a.IsDeleted != true && a.TreasuryId == treasuryId && a.CurrencyCode == 1).FirstOrDefault();

            return result.CurrencyId;
        }

        public async Task<int?> GetSupplier_Account(int supplierId)
        {
            var result = (await this.UnitOfWork.ExSupplier.GetByIdAsync(supplierId));
            return result.AccountId;
        }
        public async Task<int> GetNestedAccountsettingByCurency(int accountId, int currencyId)
        {
            return accountId;
            //var childs = (await this.UnitOfWork.AAccount.GetAsync("ParentID == " + accountId + ""));
            //var curr = await UnitOfWork.Currency.GetByIdAsync (currencyId);
            //return childs.Where(a => a.CurrencyId == curr.CurrencyCode).FirstOrDefault().AccountId;
        }

        //int internalType, int entityNo, int jvtypeId, decimal Fromval1, decimal Fromval2, decimal Fromval3, decimal Toval1, decimal Toval2, decimal Toval3, int entityId, int branchId, int FromAccountId1, int FromAccountId2, int FromAccountId3, int ToAccountId1, int ToAccountId2, int ToAccountId3, int currencyId
        
        public async Task<AJv> BuildAJV(AJv created,  int jvtypeId,int branchId, int entityId, string Desc, int AccountId,decimal DebitVal, decimal CreditVal, int currencyId,decimal rate,int? userid)
        {
            //  Desc += " # " + entityNo.ToString();
            if (rate == 0)
            {
                rate = (await UnitOfWork.Currency.GetByIdAsync(currencyId)).BuyPrice;
            }
            int JvNo = await GetNextTrnNo(branchId);
            if(created != null)
                created.UserId = userid;
            //invoice
            if (jvtypeId == 1)
            {
                if (created == null)
                    created = new AJv() { UserId = userid, InvoiceId = entityId, BranchID = branchId, Generated = true, Jvdate = DateTime.Now, IsDeleted = false, JvstatusId = 1, JvtypeId = jvtypeId, Jvtime = DateTime.Now, Jvno = JvNo, Remarks = Desc };
                else
                    created.AJvsDetails.Add(new AJvsDetail() { AccountId = AccountId, Debit = DebitVal * rate, Credit = CreditVal * rate, ForeignCredit = CreditVal, IsDeleted = false, ForeignDebit = DebitVal, CurrencyId = currencyId });
            }
            //whole invoice
            else if (jvtypeId == 2)
            {
                if (created == null)
                    created = new AJv() { UserId = userid, WholeInvoiceId = entityId, BranchID = branchId, Generated = true, Jvdate = DateTime.Now, IsDeleted = false, JvstatusId = 1, JvtypeId = jvtypeId, Jvtime = DateTime.Now, Jvno = JvNo, Remarks = Desc };
                else
                    created.AJvsDetails.Add(new AJvsDetail() { AccountId = AccountId, Debit = DebitVal * rate, Credit = CreditVal * rate, ForeignCredit = CreditVal, IsDeleted = false, ForeignDebit = DebitVal, CurrencyId = currencyId });

            }
            //Taswya
            else if (jvtypeId == 10)
            {
                if (created == null)
                    created = new AJv() { UserId = userid, TaswyaTransferId = entityId, BranchID = branchId, Generated = true, Jvdate = DateTime.Now, IsDeleted = false, JvstatusId = 1, JvtypeId = jvtypeId, Jvtime = DateTime.Now, Jvno = JvNo, Remarks = Desc };
                else
                    created.AJvsDetails.Add(new AJvsDetail() { AccountId = AccountId, Debit = DebitVal * rate, Credit = CreditVal * rate, ForeignCredit = CreditVal, IsDeleted = false, ForeignDebit = DebitVal, CurrencyId = currencyId });

            }
            //treasury transfere
            else if (jvtypeId == 11)
            {
                if (created == null)
                    created = new AJv() { UserId = userid, TreasuryTransferId = entityId, BranchID = branchId, Generated = true, Jvdate = DateTime.Now, IsDeleted = false, JvstatusId = 1, JvtypeId = jvtypeId, Jvtime = DateTime.Now, Jvno = JvNo, Remarks = Desc };
                else
                    created.AJvsDetails.Add(new AJvsDetail() { AccountId = AccountId, Debit = DebitVal * rate, Credit = CreditVal * rate, ForeignCredit = CreditVal, IsDeleted = false, ForeignDebit = DebitVal, CurrencyId = currencyId });

            }
            //cashflow
            else if (jvtypeId == 12)
            {
                if (created == null)
                    created = new AJv() { UserId = userid, CashFlowId = entityId, BranchID = branchId, Generated = true, Jvdate = DateTime.Now, IsDeleted = false, JvstatusId = 1, JvtypeId = jvtypeId, Jvtime = DateTime.Now, Jvno = JvNo, Remarks = Desc };
                else
                    created.AJvsDetails.Add(new AJvsDetail() { AccountId = AccountId, Debit = DebitVal * rate, Credit = CreditVal * rate, ForeignCredit = CreditVal, IsDeleted = false, ForeignDebit = DebitVal, CurrencyId = currencyId });

            }
            //banktransfere
            else if (jvtypeId == 15)
            {
                if (created == null)
                    created = new AJv() { UserId = userid, BanksTransfereId = entityId, BranchID = branchId, Generated = true, Jvdate = DateTime.Now, IsDeleted = false, JvstatusId = 1, JvtypeId = jvtypeId, Jvtime = DateTime.Now, Jvno = JvNo, Remarks = Desc };
                else
                    created.AJvsDetails.Add(new AJvsDetail() { AccountId = AccountId, Debit = DebitVal * rate, Credit = CreditVal * rate, ForeignCredit = CreditVal, IsDeleted = false, ForeignDebit = DebitVal, CurrencyId = currencyId });

            }
            //bankTreasurytransfere
            else if (jvtypeId == 16)
            {
                if (created == null)
                    created = new AJv() { UserId = userid, BanksTreasuryTransfereId = entityId, BranchID = branchId, Generated = true, Jvdate = DateTime.Now, IsDeleted = false, JvstatusId = 1, JvtypeId = jvtypeId, Jvtime = DateTime.Now, Jvno = JvNo, Remarks = Desc };
                else
                    created.AJvsDetails.Add(new AJvsDetail() { AccountId = AccountId, Debit = DebitVal * rate, Credit = CreditVal * rate, ForeignCredit = CreditVal, IsDeleted = false, ForeignDebit = DebitVal, CurrencyId = currencyId });

            }
            return created;
        }
        public async Task<Boolean> SaveBuildAJV(AJv created)
        {
            int JvNo = await GetNextTrnNo(int.Parse (created.BranchID.ToString()));
            created.Jvno = JvNo;
            await this.UnitOfWork.AJv.AddAsync(created);
            await this.UnitOfWork.CompleteAsync();

            return true;

        }


        public async Task<Boolean> AddGeneratedAJV(int internalType ,int entityNo, int jvtypeId, decimal Fromval1, decimal Fromval2, decimal Fromval3, decimal Toval1, decimal Toval2, decimal Toval3, int entityId, int branchId,int FromAccountId1, int FromAccountId2, int FromAccountId3, int ToAccountId1, int ToAccountId2, int ToAccountId3, int currencyId)
        {
            //invoice
            if (jvtypeId == 1)
            {
                string Desc = "فاتوره صرافه افراد  -";
                if (internalType == 1)
                    Desc += " بيع";
                else
                    Desc += " شراء";

                Desc += " # " + entityNo.ToString();
                int JvNo = await GetNextTrnNo(branchId);
                AJv created = new AJv() { InvoiceId = entityId, BranchID = branchId, Generated = true, Jvdate = DateTime.Now, IsDeleted = false, JvstatusId = 1, JvtypeId = jvtypeId, Jvtime = DateTime.Now, Jvno = JvNo, Remarks = Desc };
                created.AJvsDetails.Add(new AJvsDetail() { AccountId = FromAccountId1, Debit = Fromval1, IsDeleted = false, ForeignDebit = Fromval1, CurrencyId = currencyId });
               if (Fromval2 != 0) created.AJvsDetails.Add(new AJvsDetail() { AccountId = FromAccountId2, Debit = Fromval2, IsDeleted = false, ForeignDebit = Fromval2, CurrencyId = currencyId });
                if (Fromval3 != 0) created.AJvsDetails.Add(new AJvsDetail() { AccountId = FromAccountId3, Debit = Fromval3, IsDeleted = false, ForeignDebit = Fromval3, CurrencyId = currencyId });
               
                created.AJvsDetails.Add(new AJvsDetail() { AccountId = ToAccountId1, Credit = Toval1, IsDeleted = false, ForeignCredit = Toval1, CurrencyId = currencyId });
                if (Toval2 != 0) created.AJvsDetails.Add(new AJvsDetail() { AccountId = ToAccountId2, Credit = Toval2, IsDeleted = false, ForeignCredit = Toval2, CurrencyId = currencyId });
                if (Toval3 != 0)  created.AJvsDetails.Add(new AJvsDetail() { AccountId = ToAccountId3, Credit = Toval3, IsDeleted = false, ForeignCredit = Toval3, CurrencyId = currencyId });
                await this.UnitOfWork.AJv.AddAsync(created);
                await this.UnitOfWork.CompleteAsync();
            }
            //whole invoice
            else if (jvtypeId == 2)
            {
                string Desc = "فاتوره صرافه جملة  -";
                if (internalType == 1)
                    Desc += " بيع";
                else
                    Desc += " شراء";

                Desc += " # " + entityNo.ToString();
                int JvNo = await GetNextTrnNo(branchId);
                AJv created = new AJv() { WholeInvoiceId = entityId, BranchID = branchId, Generated = true, Jvdate = DateTime.Now, IsDeleted = false, JvstatusId = 1, JvtypeId = jvtypeId, Jvtime = DateTime.Now, Jvno = JvNo, Remarks = Desc };
                created.AJvsDetails.Add(new AJvsDetail() { AccountId = FromAccountId1, Debit = Fromval1, IsDeleted = false, ForeignDebit = Fromval1, CurrencyId = currencyId });
                if (Fromval2 != 0) created.AJvsDetails.Add(new AJvsDetail() { AccountId = FromAccountId2, Debit = Fromval2, IsDeleted = false, ForeignDebit = Fromval2, CurrencyId = currencyId });
                if (Fromval3 != 0) created.AJvsDetails.Add(new AJvsDetail() { AccountId = FromAccountId3, Debit = Fromval3, IsDeleted = false, ForeignDebit = Fromval3, CurrencyId = currencyId });
                
                created.AJvsDetails.Add(new AJvsDetail() { AccountId = ToAccountId1, Credit = Toval1, IsDeleted = false, ForeignCredit = Toval1, CurrencyId = currencyId });
                if (Toval2 != 0) created.AJvsDetails.Add(new AJvsDetail() { AccountId = ToAccountId2, Credit = Toval2, IsDeleted = false, ForeignCredit = Toval2, CurrencyId = currencyId });
                if (Toval3 != 0) created.AJvsDetails.Add(new AJvsDetail() { AccountId = ToAccountId3, Credit = Toval3, IsDeleted = false, ForeignCredit = Toval3, CurrencyId = currencyId });
                await this.UnitOfWork.AJv.AddAsync(created);
                await this.UnitOfWork.CompleteAsync();
            }

            //Taswya
            else if (jvtypeId == 10)
            {
                string Desc = "تسوية -";
                if (internalType == 1)
                    Desc += " صرف";
                else
                    Desc += " توريد";

                Desc += " # " + entityNo.ToString();
                int JvNo = await GetNextTrnNo(branchId);
                AJv created = new AJv() { TaswyaTransferId = entityId, BranchID = branchId, Generated = true, Jvdate = DateTime.Now, IsDeleted = false, JvstatusId = 1, JvtypeId = jvtypeId, Jvtime = DateTime.Now, Jvno = JvNo, Remarks = Desc };
                created.AJvsDetails.Add(new AJvsDetail() { AccountId = FromAccountId1, Debit = Fromval1, IsDeleted = false, ForeignDebit = Fromval1, CurrencyId = currencyId });
                
                created.AJvsDetails.Add(new AJvsDetail() { AccountId = ToAccountId1, Credit = Toval1, IsDeleted = false, ForeignCredit = Toval1, CurrencyId = currencyId });
                await this.UnitOfWork.AJv.AddAsync(created);
                await this.UnitOfWork.CompleteAsync();
            }
            //treasury transfere
            else if (jvtypeId == 11)
            {
                string Desc = "التحويل بين الخزن -";
                Desc += " # " + entityNo.ToString();
                int JvNo = await GetNextTrnNo(branchId);
                AJv created = new AJv() { TreasuryTransferId = entityId, BranchID = branchId, Generated = true, Jvdate = DateTime.Now, IsDeleted = false, JvstatusId = 1, JvtypeId = jvtypeId, Jvtime = DateTime.Now, Jvno = JvNo, Remarks = Desc };
                created.AJvsDetails.Add(new AJvsDetail() { AccountId = FromAccountId1, Debit = Fromval1, IsDeleted = false, ForeignDebit = Fromval1, CurrencyId = currencyId });
                created.AJvsDetails.Add(new AJvsDetail() { AccountId = ToAccountId1, Credit = Toval1, IsDeleted = false, ForeignCredit = Toval1, CurrencyId = currencyId });
                await this.UnitOfWork.AJv.AddAsync(created);
                await this.UnitOfWork.CompleteAsync();
            }

            //cashflow
            else if (jvtypeId == 12)
            {
                string Desc = "سندات خزينة -";
                if (internalType == 1)
                    Desc += " صرف";
                else
                    Desc += " توريد";

                Desc += " # " + entityNo.ToString();
                int JvNo = await GetNextTrnNo(branchId);
                AJv created = new AJv() { CashFlowId = entityId, BranchID = branchId, Generated = true, Jvdate = DateTime.Now, IsDeleted = false, JvstatusId = 1, JvtypeId = jvtypeId, Jvtime = DateTime.Now, Jvno = JvNo, Remarks = Desc };
                created.AJvsDetails.Add(new AJvsDetail() { AccountId = FromAccountId1, Debit = Fromval1, IsDeleted = false, ForeignDebit = Fromval1, CurrencyId = currencyId });
                created.AJvsDetails.Add(new AJvsDetail() { AccountId = ToAccountId1, Credit = Toval1, IsDeleted = false, ForeignCredit = Toval1, CurrencyId = currencyId });
                await this.UnitOfWork.AJv.AddAsync(created);
                await this.UnitOfWork.CompleteAsync();
            }
            return true; 
        }

        public async Task<Boolean> DeleteAJV(int jvtypeId, int entityId)
        {
            int Jvid = 0;
            //invoice
            if (jvtypeId == 1)
            {
                 Jvid = (await UnitOfWork.AJv.GetAsync("InvoiceID ==" + entityId)).FirstOrDefault().Jvid;
               
            }
            //whole invoice
            else if (jvtypeId == 2)
            {
                Jvid = (await UnitOfWork.AJv.GetAsync("WholeInvoiceID ==" + entityId)).FirstOrDefault().Jvid;
            }

            //Taswya
            else if (jvtypeId == 10)
            {
                Jvid = (await UnitOfWork.AJv.GetAsync("TaswyaTransferId ==" + entityId)).FirstOrDefault().Jvid;
            }
            //treasury transfere
            else if (jvtypeId == 11)
            {
                Jvid = (await UnitOfWork.AJv.GetAsync("TreasuryTransferId ==" + entityId)).FirstOrDefault().Jvid;
            }

            //cashflow
            else if (jvtypeId == 12)
            {
                Jvid = (await UnitOfWork.AJv.GetAsync("CashFlowID ==" + entityId)).FirstOrDefault().Jvid;
            }

            AJv delete = await UnitOfWork.AJv.GetByIdAsync(Jvid);
            delete.IsDeleted = true;


           var JvidDetails = await UnitOfWork.AJvsDetail.GetAsync("jvid = " + Jvid);

            foreach (var item in JvidDetails)
            {
                item.IsDeleted = true;
            }
            await this.UnitOfWork.CompleteAsync();
            return true;
        }

        //Task<int> IJvsService.GetCurrencyId(long BankAccountId)
        //{
        //    throw new NotImplementedException();
        //}



        //Task<List<AJvAccountSettingDto>> IJvsService.GetStaticAccount()
        //{
        //    throw new NotImplementedException();
        //}

        //Task<bool> IJvsService.UpdateStaticAccount(string AccountName, int accountId)
        //{
        //    throw new NotImplementedException();
        //}

        //Task<bool> IJvsService.UpdateSupplierAccount(string type, int entityid, int accountId)
        //{
        //    throw new NotImplementedException();
        //}
    }
}

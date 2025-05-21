using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;
using Application.Core.DTOs;
using Application.Core.DTOs.Account;
using Application.Core.DTOs.Banks;
using Application.Core.DTOs.Clients;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.Sec;
using Application.Core.DTOs.Taswya;
using Application.Core.DTOs.TreasuryTransfere;
using Application.Core.DTOs.TRN_Invoices;
using Application.Core.DTOs.TRN_Transfers;
using Application.Core.DTOs.TRN_WholeInvoices;
using Application.Core.DTOs.Workflow;
using Application.Core.DTOs.WorkFlow;
using AutoMapper;
using Core.DTOs;
using Core.Entities.Account;
using Core.Entities.banks;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.Taswya;
using Core.Entities.TreasuryTransfere;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;
using Core.Entities.TRN_WholeInvoices;
using Core.Entities.Workflow;
using Core.Other;
using Core.UnitOfWork;
using Infrastructure.Repositories;
using Infrastructure.UnitOfWork;
using MailKit.Net.Imap;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Identity.Client;
using NetTopologySuite;
using NetTopologySuite.Geometries;

namespace Application.Mapper
{
    public class MappingProfile : Profile
    {

        string getActionName(int id)
        {
            if (id == 0) return "مرفوض";
            else if (id == 1) return "موافقه";
            else if (id == 2) return "ملاحظه";
            else if (id == -1) return "تراجع";
            else return "";
        }

        string getRequestDescription(WFRequest input)
        {
            try
            {
              //  return "طلب " + input.WFRequestType.NameAr + " من " + ExchangeEncrypt.Decryp(input.SecUser.UserNameAr);
            }
            catch { }

            return "";
        }

        public Point GetPoint(string longitude,string latitude)
        {
            var goemetryFactory = NtsGeometryServices.Instance.CreateGeometryFactory(srid: 4326);

            Point Location = null;
            try
            {
                Location = goemetryFactory.CreatePoint(new Coordinate(double.Parse(longitude), double.Parse(latitude)));
            }
            catch (System.Exception) { }
            return Location;
        }
        int getint (string d)
        {
            try
            {
                return int.Parse(d);
            }
            catch { }

            return 0;
        
        }

        decimal getdecimal(string d)
        {
            try
            {
                return decimal.Parse(d);
            }
            catch { }

            return 0;

        }

        List<NewPaymentMethods> GetNewPaymentMethods(ExInvoice d)
        {
            List<NewPaymentMethods> l = new List<NewPaymentMethods> ();
            if (d.PaidCash != null && d.PaidCash != 0)
                l.Add(new NewPaymentMethods() {Paid=decimal.Parse( d.PaidCash.ToString()),PaymentMethodId= (int)PaymentMethodTypes.Cash });

            if (d.PaidCheck != null && d.PaidCheck != 0)
                l.Add(new NewPaymentMethods() { Paid = decimal.Parse(d.PaidCheck.ToString()), PaymentMethodId = (int)PaymentMethodTypes.Check, BankId=d.BankId,CheckNo=d.PaidCheckNo });

            if (d.PaidUnderAccount != null && d.PaidUnderAccount != 0)
                l.Add(new NewPaymentMethods() { Paid = decimal.Parse(d.PaidUnderAccount.ToString()), PaymentMethodId = (int)PaymentMethodTypes.UnderAccount });

            return l;
        }

        List<NewWholePaymentMethods> GetNewWholePaymentMethods(ExWholeInvoice d)
        {
            List<NewWholePaymentMethods> l = new List<NewWholePaymentMethods>();
            if (d.PaidCash != null && d.PaidCash != 0)
                l.Add(new NewWholePaymentMethods() { Paid = decimal.Parse(d.PaidCash.ToString()), WholePaymentMethodId = (int)WholePaymentMethodTypes.Cash });

            if (d.PaidCheck != null && d.PaidCheck != 0)
                l.Add(new NewWholePaymentMethods() { Paid = decimal.Parse(d.PaidCheck.ToString()), WholePaymentMethodId = (int)WholePaymentMethodTypes.Check, BankId = d.BankId,CheckNo=d.PaidCheckNo });

            if (d.PaidUnderAccount != null && d.PaidUnderAccount != 0)
                l.Add(new NewWholePaymentMethods() { Paid = decimal.Parse(d.PaidUnderAccount.ToString()), WholePaymentMethodId = (int)WholePaymentMethodTypes.UnderAccount });

            return l;
        }

        decimal? GetTotalWholePaid(ExWholeInvoiceDto d)
        {
            decimal? o = 0;
            if (d.NewWholePaymentMethods != null)
                o += d.NewWholePaymentMethods.Sum(a=>a.Paid);

            return o;
        }
        decimal? GetTotalWholePaidCash(ExWholeInvoiceDto d)
        {
            decimal? o = 0;
            if (d.NewWholePaymentMethods != null && d.NewWholePaymentMethods.Where(a => a.WholePaymentMethodId == (int)WholePaymentMethodTypes.Cash).Count() > 0)
                o += d.NewWholePaymentMethods.Where(a=>a.WholePaymentMethodId== (int)WholePaymentMethodTypes.Cash).ToList().Sum(a => a.Paid);

            return o;
        }
        decimal? GetTotalWholePaidCheck(ExWholeInvoiceDto d)
        {
            decimal? o = 0;
            if (d.NewWholePaymentMethods != null && d.NewWholePaymentMethods.Where(a => a.WholePaymentMethodId == (int)WholePaymentMethodTypes.Check).Count() > 0)
                o += d.NewWholePaymentMethods.Where(a => a.WholePaymentMethodId == (int)WholePaymentMethodTypes.Check).ToList().Sum(a => a.Paid);

            return o;
        }
        decimal? GetTotalWholePaidUnderAccount(ExWholeInvoiceDto d)
        {
            decimal? o = 0;
            if (d.NewWholePaymentMethods != null && d.NewWholePaymentMethods.Where(a => a.WholePaymentMethodId == (int)WholePaymentMethodTypes.UnderAccount).Count() > 0)
                o += d.NewWholePaymentMethods.Where(a => a.WholePaymentMethodId == (int)WholePaymentMethodTypes.UnderAccount).ToList().Sum(a => a.Paid);

            return o;
        }



        decimal? GetTotalPaid(ExInvoiceDto d)
        {
            decimal? o = 0;
            if (d.NewPaymentMethods != null)
                o += d.NewPaymentMethods.Sum(a => a.Paid);

            return o;
        }
        decimal? GetTotalPaidCash(ExInvoiceDto d)
        {
            decimal? o = 0;
            if (d.NewPaymentMethods != null && d.NewPaymentMethods.Where(a => a.PaymentMethodId == (int)PaymentMethodTypes.Cash).Count() > 0)
                o += d.NewPaymentMethods.Where(a => a.PaymentMethodId == (int)PaymentMethodTypes.Cash).ToList().Sum(a => a.Paid);

            return o;
        }
        decimal? GetTotalPaidCheck(ExInvoiceDto d)
        {
            decimal? o = 0;
            if (d.NewPaymentMethods != null && d.NewPaymentMethods.Where(a => a.PaymentMethodId == (int)PaymentMethodTypes.Check).Count() > 0)
                o += d.NewPaymentMethods.Where(a => a.PaymentMethodId == (int)PaymentMethodTypes.Check).ToList().Sum(a => a.Paid);

            return o;
        }
        decimal? GetTotalPaidUnderAccount(ExInvoiceDto d)
        {
            decimal? o = 0;
            if (d.NewPaymentMethods != null && d.NewPaymentMethods.Where(a => a.PaymentMethodId == (int)PaymentMethodTypes.UnderAccount).Count() > 0)
                o += d.NewPaymentMethods.Where(a => a.PaymentMethodId == (int)PaymentMethodTypes.UnderAccount).ToList().Sum(a => a.Paid);

            return o;
        }
        
        string GetTotalPaidCheckNo(ExInvoiceDto d)
        {
            if (d.NewPaymentMethods != null  && d.NewPaymentMethods.Where(a => a.PaymentMethodId == (int)PaymentMethodTypes.Check).ToList().Count() > 0)
            return d.NewPaymentMethods.Where(a => a.PaymentMethodId == (int)PaymentMethodTypes.Check).ToList().SingleOrDefault().CheckNo;

            return "";
        }

        string GetTotalPaidwholeCheckNo(ExWholeInvoiceDto d)
        {
            if (d.NewWholePaymentMethods != null && d.NewWholePaymentMethods.Where(a => a.WholePaymentMethodId == (int)WholePaymentMethodTypes.Check).Count() > 0)
                return d.NewWholePaymentMethods.Where(a => a.WholePaymentMethodId == (int)WholePaymentMethodTypes.Check).ToList().SingleOrDefault().CheckNo;

            return "";
        }

        int? GetBankId(ExInvoiceDto d)
        {
            if (d.NewPaymentMethods != null && d.NewPaymentMethods.Where(a => a.PaymentMethodId == (int)PaymentMethodTypes.Check).ToList().Count() > 0)
                return d.NewPaymentMethods.Where(a => a.PaymentMethodId == (int)PaymentMethodTypes.Check).ToList().SingleOrDefault().BankId;

            return null;
        }
        int? GetWholeBankId(ExWholeInvoiceDto d)
        {
            if (d.NewWholePaymentMethods != null && d.NewWholePaymentMethods.Where(a => a.WholePaymentMethodId == (int)WholePaymentMethodTypes.Check).Count() > 0)
                return d.NewWholePaymentMethods.Where(a => a.WholePaymentMethodId == (int)WholePaymentMethodTypes.Check).ToList().SingleOrDefault().BankId;

            return null;
        }

        int GetActionType(AJv input )
        { 

            if (input.JvtypeId ==1 && input.InvoiceId != null)
                return int.Parse( input.InvoiceId.ToString());            
            
            if (input.JvtypeId == 2 && input.WholeInvoiceId != null)
                return int.Parse(input.WholeInvoiceId.ToString());
            
            
            if (input.JvtypeId == 15 && input.BranchTransferId != null)
                return int.Parse(input.BranchTransferId.ToString());

            if (input.JvtypeId == 10 && input.TaswyaTransferId != null)
                return int.Parse(input.TaswyaTransferId.ToString());

            if (input.JvtypeId == 11 && input.TreasuryTransferId != null)
                return int.Parse(input.TreasuryTransferId.ToString());

            if (input.JvtypeId == 12 && input.CashFlowId != null)
                return int.Parse(input.CashFlowId.ToString());

            if (input.JvtypeId == 16 && input.BanksTreasuryTransfereId != null)
                return int.Parse(input.BanksTreasuryTransfereId.ToString());

            return 0;

        }
        //public async Task<string> GetCountryName(int countryId)
        //{
        //    try
        //    {

        //        var entity = await MapperObject.UnitOfWork.ExCountry.GetByIdAsync(countryId);
        //        return entity.CountryNameAr;
        //    }
        //    catch { }
        //    return "";
        //}




        public MappingProfile()
    {
  
        //    CreateMap<UserDto, DynamoUser>()
        //        .ForMember(m => m.UserRoles, op => op.Ignore())
        //        .ForMember(m => m.Id, op => op.Ignore());

        //    CreateMap<DynamoUser, UserDto>().ReverseMap();
        //    CreateMap<DynamoUser, UserAllDto>();

        //    CreateMap<UserUpdateDto, DynamoUser>()
        //        .ForMember(m => m.UserRoles, op => op.Ignore())
        //        .ForMember(m => m.Id, op => op.Ignore());

        //    CreateMap<DynamoUser, UserUpdateDto>();

        #region lookups
        CreateMap<ExBank, ExBankDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.BankId)).ReverseMap();
            CreateMap<ExCountry, ExCountryDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.CountryId)).ReverseMap();
            CreateMap<Currency, CurrencyDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.CurrencyId)).ReverseMap();
            CreateMap<ExIdsource, ExIdsourceDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.IdsourceId))
                    .ForMember(m => m.CountryName, op => op.MapFrom(mp => mp.Country.CountryNameAr));

            CreateMap<ExIdsourceDto, ExIdsource>().ForMember(m => m.IdsourceId, op => op.MapFrom(mp => mp.Id));

            CreateMap<ExClientJob, ExClientJobDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.JobId)).ReverseMap();
            CreateMap<ExExchangePurpose, ExExchangePurposeDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.ExchangePurposeId)).ReverseMap();
            CreateMap<ExIncomeSource, ExIncomeSourceDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.IncomeSourceId)).ReverseMap();
            CreateMap<ExClientJobSeverity, ExClientJobSeverityDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.SeverityId)).ReverseMap();
            #endregion

            #region sec
            CreateMap<SecUser, SecUserDto>()
            .ForMember(m => m.Id, op => op.MapFrom(mp => mp.UserId))
            .ForMember(m => m.UserCode, op => op.MapFrom(mp => ExchangeEncrypt.Decryp(mp.UserCode)))
            .ForMember(m => m.LoginName, op => op.MapFrom(mp => ExchangeEncrypt.Decryp(mp.LoginName)))
            .ForMember(m => m.Password, op => op.MapFrom(mp => ExchangeEncrypt.Decryp(mp.Password)))
            .ForMember(m => m.UserNameAr, op => op.MapFrom(mp => ExchangeEncrypt.Decryp(mp.UserNameAr)))
            .ForMember(m => m.UserNameEn, op => op.MapFrom(mp => ExchangeEncrypt.Decryp(mp.UserNameEn)))
             .ForMember(m => m.branchName , op => op.MapFrom(mp => mp.Branch.BranchNameAr))
             .ForMember(m => m.PermissionTypeName , op => op.MapFrom(mp => mp.PermissionType.PermissionTypeNameAr))
            ;

            CreateMap<SecUserDto, SecUser>()
            .ForMember(m => m.UserCode, op => op.MapFrom(mp => ExchangeEncrypt.Encryp(mp.UserCode)))
            .ForMember(m => m.LoginName, op => op.MapFrom(mp => ExchangeEncrypt.Encryp(mp.LoginName)))
            .ForMember(m => m.Password, op => op.MapFrom(mp => ExchangeEncrypt.Encryp(mp.Password)))
            .ForMember(m => m.UserNameAr, op => op.MapFrom(mp => ExchangeEncrypt.Encryp(mp.UserNameAr)))
            .ForMember(m => m.UserNameEn, op => op.MapFrom(mp => ExchangeEncrypt.Encryp(mp.UserNameEn)))
            ;

            CreateMap<SecUser, SecUserCreateDto>()
            .ForMember(m => m.Id, op => op.MapFrom(mp => mp.UserId))
            .ForMember(m => m.UserCode, op => op.MapFrom(mp => ExchangeEncrypt.Decryp(mp.UserCode)))
            .ForMember(m => m.LoginName, op => op.MapFrom(mp => ExchangeEncrypt.Decryp(mp.LoginName)))
            .ForMember(m => m.Password, op => op.MapFrom(mp => ExchangeEncrypt.Decryp(mp.Password)))
            .ForMember(m => m.UserNameAr, op => op.MapFrom(mp => ExchangeEncrypt.Decryp(mp.UserNameAr)))
            .ForMember(m => m.UserNameEn, op => op.MapFrom(mp => ExchangeEncrypt.Decryp(mp.UserNameEn)))
            ;

            CreateMap<SecUserCreateDto, SecUser>()
            .ForMember(m => m.UserCode, op => op.MapFrom(mp => ExchangeEncrypt.Encryp(mp.UserCode)))
            .ForMember(m => m.LoginName, op => op.MapFrom(mp => ExchangeEncrypt.Encryp(mp.LoginName)))
            .ForMember(m => m.Password, op => op.MapFrom(mp => ExchangeEncrypt.Encryp(mp.Password)))
            .ForMember(m => m.UserNameAr, op => op.MapFrom(mp => ExchangeEncrypt.Encryp(mp.UserNameAr)))
            .ForMember(m => m.UserNameEn, op => op.MapFrom(mp => ExchangeEncrypt.Encryp(mp.UserNameEn)))
            .ForMember(m => m.CreatedDate, op => op.MapFrom(mp => DateTime.Now))
            .ForMember(m => m.Enabled, op => op.MapFrom(mp =>true))
            .ForMember(m => m.LiveExchange, op => op.MapFrom(mp =>true))
            ;


            CreateMap<SecForm, SecFormDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.FormId)).ReverseMap();
            CreateMap<SecFormsFunction, SecFormsFunctionDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.FormFunctionId))
                .ForMember(m => m.FormName, op => op.MapFrom(mp => mp.Form.DisplayNameAr))
                .ForMember(m => m.HasTextValue, op => op.MapFrom(mp => mp.Function.HasTextValue))
                .ForMember(m => m.FunctionName, op => op.MapFrom(mp => mp.Function.FunctionNameAr));

            CreateMap<SecFormsFunctionDto, SecFormsFunction>().ForMember(m => m.FormFunctionId, op => op.MapFrom(mp => mp.Id));

            CreateMap<SecFunction, SecFunctionDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.FunctionId)).ReverseMap();
            CreateMap<SecTransactionLog, SecTransactionLogDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.LogId)).ReverseMap();
            CreateMap<SecUsersForm, SecUsersFormDto>().ReverseMap();
            CreateMap<SecUsersFunction, SecUsersFunctionDto>().ReverseMap();
            CreateMap<ExBranch, ExBranchDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.BranchId)).ReverseMap();
            CreateMap<SecPermissionType, SecPermissionTypeDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.PermissionTypeId)).ReverseMap();
            CreateMap<SecPermissionTypeBranches, SecPermissionTypeBranchesDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.ID)).ReverseMap();

            #endregion


            CreateMap<ExClient, ClientOrSuppliersDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.ClientId)).ReverseMap();
            CreateMap<ExAttachmentType, ExAttachmentTypeDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.TypeId)).ReverseMap();
            CreateMap<ExClientsAttachment, ExClientsAttachmentDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.ClientAttachmentId)).ReverseMap();
            CreateMap<ExClientsMembership, ExClientsMembershipDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.MembershipId)).ReverseMap();
            CreateMap<ExClientsRepresentative, ExClientsRepresentativeDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.RepresentativeId)).ReverseMap();
            CreateMap<ExClientsType, ExClientsTypeDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.ClientTypeId)).ReverseMap();
            CreateMap<CurrencyBase, CurrencyBaseDto>().ReverseMap();

            //CreateMap<CurrencyBase, CurrencyBaseDto>().ForMember(m => m.CurrencyCode, op => op.MapFrom(mp => int.Parse(mp.Id.ToString())));
            //CreateMap<CurrencyBaseDto, CurrencyBase>().ForMember(m => m.CurrencyCode, op => op.MapFrom(mp => 0));


            CreateMap<ExClientsNote, ExClientsNoteDto>().ReverseMap();
            CreateMap<ExLocallyWanted, ExLocallyWantedDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.LocallyWantedId)).ReverseMap();
            CreateMap<IsilList, IsilListDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.Id)).ReverseMap();
            CreateMap<IsilXmlDatum, IsilXmlDatumDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.Id)).ReverseMap();
            CreateMap<ExSuppliersType, ExSuppliersTypeDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.SupplierTypeId)).ReverseMap();
            CreateMap<ExTaswya, ExTaswyaDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.TransferId)).ReverseMap();
             CreateMap<ExTaswyaDetail, ExTaswyaDetailDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.TransferDetailId)).ReverseMap();
             CreateMap<ActivationKeys, ActivationKeysDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.ActivationKeyId)).ReverseMap();
             CreateMap<FinYears, FinYearsDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.FinYearId)).ReverseMap();
             CreateMap<FinYearsPeriods, FinYearsPeriodsDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.FinYearsPeriodId)).ReverseMap();


           // CreateMap<ExClient, ClientOrSuppliersDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.ClientId));

           CreateMap<ExSupplier, ClientOrSuppliersDto>().
                ForMember(m => m.ClientId, op => op.MapFrom(mp => mp.SupplierId))
                .ForMember(m => m.Id, op => op.MapFrom(mp => mp.SupplierId))
                  .ForMember(m => m.ClientCode, op => op.MapFrom(mp => mp.SupplierCode))
                  .ForMember(m => m.ClientNameEn, op => op.MapFrom(mp => mp.SupplierNameEn))
                  .ForMember(m => m.ClientNameAr, op => op.MapFrom(mp => mp.SupplierNameAr))
                  .ForMember(m => m.Mobile, op => op.MapFrom(mp => mp.Phone))
                  .ForMember(m => m.Fax, op => op.MapFrom(mp => mp.Fax))
                  .ForMember(m => m.Email, op => op.MapFrom(mp => mp.Email))
                  .ForMember(m => m.wholesaleClientTyp, op => op.MapFrom(mp => mp.SupplierTypeId))
                  .ForMember(m => m.CountryId, op => op.MapFrom(mp => mp.CountryId))
                 // .ForMember(m => m., op => op.MapFrom(mp => mp.BankAccount))
                  .ForMember(m => m.CurrencyId, op => op.MapFrom(mp => mp.CurrencyId))
                  .ForMember(m => m.CurrencyExRate, op => op.MapFrom(mp => mp.CurrencyExRate))
                  .ForMember(m => m.AccountNumber, op => op.MapFrom(mp => mp.AccountId))
                  .ForMember(m => m.Crnumber, op => op.MapFrom(mp => mp.Crnumber))
                  .ForMember(m => m.CrexpiredDate, op => op.MapFrom(mp => mp.CrexpiredDate))
                  .ForMember(m => m.UnifiedNumber, op => op.MapFrom(mp => mp.UnifiedNumber))
                  .ForMember(m => m.LicenseNumber, op => op.MapFrom(mp => mp.LicenseNo))
                  .ForMember(m => m.LicenseExpirateDate, op => op.MapFrom(mp => mp.LicenseExpiredDate))
                  .ForMember(m => m.Creditlimit, op => op.MapFrom(mp => mp.CreditLimit))
                  //.ForMember(m => m., op => op.MapFrom(mp => mp.BranchId))
                  //.ForMember(m => m., op => op.MapFrom(mp => mp.IsMainBranch))
                .ReverseMap();


                 CreateMap<ExClientsNoteDto2, ExClientsNoteDto>()
                .ForMember(m => m.NoteType, op => op.MapFrom(mp => getint(mp.NoteType)));

            CreateMap<ClientOrSuppliersDto2, ClientOrSuppliersDto>()
                .ForMember(m => m.CountryId, op => op.MapFrom(mp => getint(mp.countryId)))
                .ForMember(m => m.BirthCityId, op => op.MapFrom(mp => getint(mp.birthCityId)))
                .ForMember(m => m.BranchID, op => op.MapFrom(mp => getint(mp.branchID)))
                .ForMember(m => m.ClientTypeId, op => op.MapFrom(mp => getint(mp.clientTypeId)))
                .ForMember(m => m.IdsourceId, op => op.MapFrom(mp => (mp.idsourceId)))
                .ForMember(m => m.IdtypeId, op => op.MapFrom(mp => getint(mp.idtypeId)))
                .ForMember(m => m.IncomeSourceId, op => op.MapFrom(mp => getint(mp.incomeSourceId)))
                .ForMember(m => m.JobId, op => op.MapFrom(mp => getint(mp.jobId)))
                .ForMember(m => m.CurrencyId, op => op.MapFrom(mp => (mp.currencyId)))
                .ForMember(m => m.SuspiciousCount, op => op.MapFrom(mp => (mp.suspiciousCount)))
                .ForMember(m => m.Income, op => op.MapFrom(mp => (mp.income)))
                .ForMember(m => m.Capital, op => op.MapFrom(mp =>  mp.capital))
                .ForMember(m => m.SuspiciousCountLocal, op => op.MapFrom(mp => mp.suspiciousCountLocal));
            ;

            CreateMap<ClientOrSuppliersDto3, ClientOrSuppliersDto>()
         .ForMember(m => m.CountryId, op => op.MapFrom(mp => getint(mp.countryId)))
         .ForMember(m => m.BirthCityId, op => op.MapFrom(mp => (mp.birthCityId)))
         .ForMember(m => m.CurrencyId, op => op.MapFrom(mp => getint(mp.currencyId)))
         .ForMember(m => m.ClientTypeId, op => op.MapFrom(mp => (mp.clientTypeId)))
         .ForMember(m => m.wholesaleClientTyp, op => op.MapFrom(mp => getint(mp.wholesaleClientTyp)))
         .ForMember(m => m.IdtypeId, op => op.MapFrom(mp => (mp.idtypeId)))
         .ForMember(m => m.IncomeSourceId, op => op.MapFrom(mp => (mp.incomeSourceId)))
         .ForMember(m => m.JobId, op => op.MapFrom(mp => (mp.jobId)))
         .ForMember(m => m.CurrencyId, op => op.MapFrom(mp => (mp.currencyId)))
         //.ForMember(m => m.SuspiciousCount, op => op.MapFrom(mp => (mp.suspiciousCount)))
         .ForMember(m => m.Income, op => op.MapFrom(mp => (mp.income)))
         .ForMember(m => m.Capital, op => op.MapFrom(mp => mp.capital));



            CreateMap<ExFormingStatus, ExFormingStatusDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.FormingStatusId)).ReverseMap();
            CreateMap<ExInvoice, ExInvoiceDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.InvoiceId))
                .ForMember(m => m.IsPendingWorkflow, op => op.MapFrom(mp => mp.IsPendingWorkflow))
                .ForMember(m => m.NewPaymentMethods, op => op.MapFrom(mp => GetNewPaymentMethods(mp)));

            CreateMap<ExInvoiceDto, ExInvoice>()
            .ForMember(m => m.IsPendingWorkflow, op => op.MapFrom(mp => mp.IsPendingWorkflow))
            .ForMember(m => m.Paid, op => op.MapFrom(mp => GetTotalPaid(mp)))
            .ForMember(m => m.PaidCash, op => op.MapFrom(mp => GetTotalPaidCash(mp)))
            .ForMember(m => m.PaidCheck, op => op.MapFrom(mp => GetTotalPaidCheck(mp)))
            .ForMember(m => m.PaidUnderAccount, op => op.MapFrom(mp => GetTotalPaidUnderAccount(mp)))
            .ForMember(m => m.PaidCheckNo, op => op.MapFrom(mp => GetTotalPaidCheckNo(mp)))
            .ForMember(m => m.BankId, op => op.MapFrom(mp => GetBankId(mp)))
            ;


            CreateMap<ExWholeInvoice, ExWholeInvoiceDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.InvoiceId))
               .ForMember(m => m.IsPendingWorkflow, op => op.MapFrom(mp => mp.IsPendingWorkflow))
               .ForMember(m => m.NewWholePaymentMethods, op => op.MapFrom(mp => GetNewWholePaymentMethods(mp)));

            CreateMap<ExWholeInvoiceDto, ExWholeInvoice>()
            .ForMember(m => m.IsPendingWorkflow, op => op.MapFrom(mp => mp.IsPendingWorkflow))
            .ForMember(m => m.Paid, op => op.MapFrom(mp => GetTotalWholePaid(mp)))
            .ForMember(m => m.PaidCash, op => op.MapFrom(mp => GetTotalWholePaidCash(mp)))
            .ForMember(m => m.PaidCheck, op => op.MapFrom(mp => GetTotalWholePaidCheck(mp)))
            .ForMember(m => m.PaidUnderAccount, op => op.MapFrom(mp => GetTotalWholePaidUnderAccount(mp)))
            .ForMember(m => m.PaidCheckNo, op => op.MapFrom(mp => GetTotalPaidwholeCheckNo(mp)))
            .ForMember(m => m.BankId, op => op.MapFrom(mp => GetWholeBankId(mp)))
            ;



            CreateMap<ExInvoicesDetail, ExInvoicesDetailDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.InvoiceDetailId)).ReverseMap();
            CreateMap<ExInvoiceStatus, ExInvoiceStatusDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.StatusId)).ReverseMap();
            CreateMap<ExInvoicesType, ExInvoicesTypeDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.InvoiceTypeId)).ReverseMap();
            CreateMap<ExPaymentMethod, ExPaymentMethodDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.PaymentMethod)).ReverseMap();
            CreateMap<ExBranchTransfer, ExBranchTransferDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.VoucherId)).ReverseMap();
            CreateMap<ExBranchTransfersDetail, ExBranchTransfersDetailDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.VoucherDetailId)).ReverseMap();
            CreateMap<ExBranchTransferStatus, ExBranchTransferStatusDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.StatusId)).ReverseMap();
            CreateMap<ExBranchTransferType, ExBranchTransferTypeDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.TypeId)).ReverseMap();
            CreateMap<ExCurrenciesBvr, ExCurrenciesBvrDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.Id)).ReverseMap();
            CreateMap<ExInternalTransfer, ExInternalTransferDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.TransferId)).ReverseMap();
            CreateMap<ExInternalTransfersDetail, ExInternalTransfersDetailDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.TransferDetailId)).ReverseMap();
            //CreateMap<ExWholeInvoice, ExWholeInvoiceDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.InvoiceId))
            //    .ForMember(m => m.IsPendingWorkflow, op => op.MapFrom(mp => mp.IsPendingWorkflow))
            //    .ReverseMap();
            CreateMap<ExWholeInvoicesDetail, ExWholeInvoicesDetailDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.InvoiceDetailId)).ReverseMap();
            CreateMap<ExWholeInvoiceStatus, ExWholeInvoiceStatusDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.StatusId)).ReverseMap();
            CreateMap<ExWholePaymentMethod, ExWholePaymentMethodDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.PaymentMethod)).ReverseMap();
            CreateMap<Treasury, TreasuryDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.TreasuryId)).ReverseMap();
            CreateMap<ExTreasuryTransfere, ExTreasuryTransfereDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.TransferId))
                .ForMember(m => m.IsPendingWorkflow, op => op.MapFrom(mp => mp.IsPendingWorkflow))
                .ReverseMap();
            CreateMap<ExTreasuryTransfereDetail, ExTreasuryTransfereDetailDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.TransferDetailId)).ReverseMap();
            CreateMap<WFListOfApprovals, WFListOfApprovalsDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.ListOfApprovalId)).ReverseMap();
            CreateMap<WFRequest, WFRequestDto>()
                .ForMember(m => m.Id, op => op.MapFrom(mp => mp.RequestId))
                .ForMember(m => m.RequestDescription, op => op.MapFrom(mp => getRequestDescription (mp)))
                //.ForMember(m => m.RequestDescription, op => op.MapFrom(mp => getRequestDescription(mp))
                .ForMember(m => m.Username, op => op.MapFrom(mp => ExchangeEncrypt.Decryp(mp.SecUser.UserNameAr)))
                .ReverseMap();
            CreateMap<WFRequestDetails, WFRequestDetailsDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.RequestDetailId))
               // .ForMember(m => m.ActionTypeName, op => op.MapFrom(mp => getActionName(mp.ActionType)))
                .ReverseMap();
            CreateMap<WFRequestType, WFRequestTypeDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.RequestTypeId)).ReverseMap();
            CreateMap<RequestResult, WFRequestTypeDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.RequestTypeId)).ReverseMap();
            CreateMap<TrackingData, TrackingDataDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.TrackId)).ReverseMap();
            CreateMap<ShiftTracking, ShiftTrackingDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.ShiftTrackingID))
                .ForMember(m => m.TreasuryName, op => op.MapFrom(mp => mp.Treasury.TreasuryNameAr));
            CreateMap<ShiftTrackingDto, ShiftTracking>();
            CreateMap<ClientActivities, ClientActivitiesDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.ClientActivityID)).ReverseMap();
            CreateMap<TreasuryDealers, TreasuryDealersDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.TreasuryDealerId)).ReverseMap();


            CreateMap<AAccount, AAccountDto>()
                .ForMember(m => m.AccountName, op => op.MapFrom(mp => (mp.Parent == null ? "" : mp.Parent.AccountName + ">")   + mp.AccountName))
                .ForMember(m => m.Id, op => op.MapFrom(mp => mp.AccountId));
            CreateMap<AAccountDto, AAccount>()
                .ForMember(m => m.AccountId, op => op.MapFrom(mp => mp.Id));
            
            CreateMap<ACostCenter, ACostCenterDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.CostCenterId)).ReverseMap();
           
            CreateMap<AJv, AJvDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.Jvid)).ReverseMap();
            /////////////////////////////
            CreateMap<AJv, UserActionsInputResult>()
                .ForMember(m => m.Id, op => op.MapFrom(mp => mp.Jvid))
                .ForMember(m => m.ActionID, op => op.MapFrom(mp => GetActionType(mp)))
                ;


            CreateMap<AJvsDetail, AJvsDetailDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.JvdetailId)).ReverseMap();
                //.ForMember(m => m.CurrencyName, op => op.MapFrom(mp => mp.Currency.CurrencyNameAr))
            CreateMap<AJvstatus, AJvstatusDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.StatusId)).ReverseMap();
            CreateMap<AJvtype, AJvtypeDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.JvtypeId)).ReverseMap();
           
            CreateMap<ACashFlow, ACashFlowDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.VoucherId)).ReverseMap();
            CreateMap<ACashFlowStatus, ACashFlowStatusDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.StatusId)).ReverseMap();
            CreateMap<ACashFlowType, ACashFlowTypeDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.VoucherTypeId)).ReverseMap();
            
            
            CreateMap<AJvAccountSetting, AJvAccountSettingDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.AJvAccountSettingId)).ReverseMap();
           
            CreateMap<BankAccount, BankAccountDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.BankAccountId)).ReverseMap();
            CreateMap<BanksBvr, BanksBvrDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.BanksBvrId)).ReverseMap();
            CreateMap<BanksTransfere, BanksTransfereDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.BanksTransfereId)).ReverseMap();
            CreateMap<BanksTreasuryTransfere, BanksTreasuryTransfereDto >().ForMember(m => m.Id, op => op.MapFrom(mp => mp.BanksTreasuryTransfereId)).ReverseMap();
            CreateMap<ProveInOutCheck, ProveInOutCheckDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.ProveInOutCheckId)).ReverseMap();
            CreateMap<ClientSecurityFile, ClientSecurityFileDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.ClientSecId)).ReverseMap();
            
            CreateMap<ExClientSectors, ExClientSectorsDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.ClientSectorId)).ReverseMap();
            
            CreateMap<UserSetting, UserSettingDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.UserSettingID)).ReverseMap();
            CreateMap<Setting, SettingDto>().ForMember(m => m.Id, op => op.MapFrom(mp => mp.SettingID)).ReverseMap();

            //.ForMember(m => m.SuspiciousCountLocal, op => op.MapFrom(mp => mp.suspiciousCountLocal));





            //CreateMap<IdentityUserRole<string>, UserRoleDto>().ReverseMap();

            //CreateMap<DynamoRole, UserRoleDto>()
            //    .ForMember(m => m.RoleId, op => op.MapFrom(mp => mp.Id))
            //    .ForMember(m => m.RoleName, op => op.MapFrom(mp => mp.Name))
            //    .ReverseMap();

            //CreateMap<RoleDto, DynamoRole>()
            //    .ForMember(m => m.Id, op => op.Ignore())
            //    .ForMember(m => m.RolePermissions, op => op.Ignore())
            //    ;
            //CreateMap<DynamoRole, RoleDto>();

            //CreateMap<RolePermissionDto, RolePermission>();
            //CreateMap<RolePermission, RolePermissionDto>();



            //CreateMap<Permission, PermissionDto>().ReverseMap();
            //CreateMap<DynamoUser, SessionDto>()
            //    .ForMember(dest => dest.UserId, opt => opt.MapFrom(src => src.Id));

            //CreateMap<Privilage, PrivilageDto>();
            //CreateMap<PrivilageDto, Privilage>();

            //CreateMap<Screens, ScreensDto>();
            //CreateMap<ScreensDto, Screens>();

            //CreateMap<PrivilageType, PrivilageTypeDto>();
            //CreateMap<PrivilageTypeDto, PrivilageType>();

            //CreateMap<Banks, BanksDto>().ForMember(m => m.Name, op => op.MapFrom(mp => mp.NameAr)).ReverseMap();
            //CreateMap < Banks, BanksDto>().ForMember(m => m.Name, op => op.MapFrom(mp => mp.NameAr)).ReverseMap();
            //CreateMap <Countries , CountriesDto>().ForMember(m => m.Name, op => op.MapFrom(mp => mp.NameAr)).ReverseMap();
            //CreateMap <Currencies , CurrenciesDto>().ForMember(m => m.Name, op => op.MapFrom(mp => mp.NameAr)).ReverseMap();
            //CreateMap <IdentitySources , IdentitySourcesDto>().ForMember(m => m.Name, op => op.MapFrom(mp => mp.NameAr)).ReverseMap();
            //CreateMap <Jobs, JobsDto>().ForMember(m => m.Name, op => op.MapFrom(mp => mp.NameAr)).ReverseMap();
            //CreateMap <TransferPurposes , TransferPurposesDto>().ForMember(m => m.Name, op => op.MapFrom(mp => mp.NameAr)).ReverseMap();




        }
    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using Application.Core.DTOs.Account;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.WorkFlow;
using Azure.Core;
using Core.DTOs;
using Core.DTOs.FinReports;
using Core.Entities.Account;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;
using Core.Entities.TRN_WholeInvoices;
using Core.Other;
using Core.Repositories.Account;
using Core.Repositories.Bank;
using Core.Repositories.Base;
using Core.Repositories.Client;
using Core.Repositories.LookUps;
using Core.Repositories.TRN_Invoices;
using Core.Repositories.TRN_Transfers;
using Core.Repositories.Workflow;
using Core.UnitOfWork;
using Infrastructure.Data;
using Infrastructure.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace Infrastructure.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork
    {
        public void ExecuteRawSql(string sql)
        {
            context.Database.ExecuteSqlRaw(sql);
        }
        private readonly DBContext context;

        public IRepository<FinYears> FinYears { get; }
        public IRepository<FinYearsPeriods> FinYearsPeriods { get; }
        public IRepository<ActivationKeys> ActivationKeys { get; }
        public IRepository<ExClientSectors> ExClientSectors { get; }
        public IShiftTrackingRepository ShiftTracking { get; }
        public IClientActivitiesRepository ClientActivities { get; }
        public ITreasuryDealersRepository TreasuryDealers { get; }
        public IClientSecurityFileRepository ClientSecurityFile { get; }
        public IBankAccountRepository BankAccount { get; }
        public IBanksBvrRepository BanksBvr { get; }
        public IBanksTransfereRepository BanksTransfere { get; }
        public IBanksTreasuryTransfereRepository BanksTreasuryTransfere { get; }
        public IProveInOutCheckRepository ProveInOutCheck { get; }
        public IACashFlowRepository ACashFlow { get; }
        public IRepository<AJvAccountSetting> AJvAccountSetting { get; }
       
        public IRepository<ACashFlowStatus> ACashFlowStatus { get; }
        public IRepository<ACashFlowType> ACashFlowType { get; }
        public IAJvRepository AJv { get; }
        public IAJvsDetailRepository AJvsDetail { get; }
        public IAJvstatusRepository AJvstatus { get; }
        public IAJvtypeRepository AJvtype { get; }


        public IAAccountRepository AAccount { get; }
        public IACostCenterRepository ACostCenter { get; }
        public ITrackingDataRepository TrackingData { get; }
        public IWFListOfApprovalsRepository WFListOfApprovals { get; }
        public IWFRequestDetailsRepository WFRequestDetails { get; }
        public IWFRequestRepository WFRequest { get; }
        public IWFRequestTypeRepository WFRequestType { get; }

        public IExTreasuryTransfereRepository ExTreasuryTransfere { get; }
        public IExTreasuryTransfereDetailRepository ExTreasuryTransfereDetail { get; }
        public ITreasuryRepository Treasury { get; }
        public IExInvoiceRepository ExInvoice { get; }
        public IExInvoicesDetailRepository ExInvoicesDetail { get; }
        public IExWholeInvoiceRepository ExWholeInvoice { get; }
        public IExWholeInvoicesDetailRepository ExWholeInvoicesDetail { get; }
        public IExBranchTransferRepository ExBranchTransfer { get; }
        public IExBranchTransfersDetailRepository ExBranchTransfersDetail { get; }
        public IExInternalTransferRepository ExInternalTransfer { get; }
        public IExInternalTransfersDetailRepository ExInternalTransfersDetail { get; }
        public IExTaswyaRepository ExTaswya { get; }
        public IExTaswyaDetailRepository ExTaswyaDetail { get; }
        public IExCurrenciesBvrRepository ExCurrenciesBvr { get; }

        public IRepository<UserSetting> UserSetting { get; }
        public IRepository<Setting> Setting { get; }
        public IRepository<ExFormingStatus> ExFormingStatus { get; }
        public IRepository<ExInvoiceStatus> ExInvoiceStatus { get; }
        public IRepository<ExInvoicesType> ExInvoicesType { get; }
        public IRepository<ExPaymentMethod> ExPaymentMethod { get; }
        public IRepository<ExWholeInvoiceStatus> ExWholeInvoiceStatus { get; }
        public IRepository<ExWholePaymentMethod> ExWholePaymentMethod { get; }
        public IRepository<ExBranchTransferStatus> ExBranchTransferStatus { get; }
        public IRepository<ExBranchTransferType> ExBranchTransferType { get; }

        public IRepository<ExSupplier> ExSupplier { get; }
        public IRepository<ExSuppliersType> ExSuppliersType { get; }
        public IRepository<ExLocallyWanted> ExLocallyWanted { get; }
        public IRepository<IsilList> IsilList { get; }
        public IRepository<IsilXmlDatum> IsilXmlDatum { get; }
        public IRepository<ExClientsNote> ExClientsNote { get; }
        public IRepository<CurrencyBase> CurrencyBase { get; }
        public IRepository<ExAttachmentType> ExAttachmentType { get; }
        public IRepository<ExClientsAttachment> ExClientsAttachment { get; }
        public IRepository<ExClientsMembership> ExClientsMembership { get; }
        public IRepository<ExClientsRepresentative> ExClientsRepresentative { get; }
        public IRepository<ExClientsType> ExClientsType { get; }

       


        public IExClientRepository ExClient { get; }
        public IExBankRepository ExBank { get; }
        public IExCountryRepository ExCountry { get; }
        public ICurrencyRepository Currency { get; }
        public IIdsourceRepository ExIdsource { get; }
        public IExClientJobRepository ExClientJob { get; }
        public IExchangePurposeRepository ExExchangePurpose { get; }
        public IExIncomeSourceRepository ExIncomeSource { get; }
        public ISecUserRepository SecUser { get; }
        public IRepository<SecForm> SecForm { get; }
        public ISecFormsFunctionRepository SecFormsFunction { get; }
        public IRepository<SecFunction> SecFunction { get; }
        public IRepository<SecTransactionLog> SecTransactionLog { get; }
        public IRepository<SecUsersForm> SecUsersForm { get; }
        public IRepository<SecUsersFunction> SecUsersFunction { get; }
        public IExBranchRepository ExBranch { get; }
        public IRepository<SecPermissionType> SecPermissionType { get; }
        public IRepository<ExClientJobSeverity> ExClientJobSeverity { get; }
        public IRepository<SecPermissionTypeBranches> SecPermissionTypeBranches { get; }

        //IRepository<UserSetting> IUnitOfWork.UserSetting => throw new NotImplementedException();

        //IRepository<Setting> IUnitOfWork.Setting => throw new NotImplementedException();


        //public IPermissionRepository Permission { get; }
        //public IScreenRepository Screen { get; }
        //public IPrivilageRepository Privilage { get; }
        //public IPrivilageTypeRepository PrivilageType { get; }




        public UnitOfWork(DBContext context
            //, IPermissionRepository permission
            //, IScreenRepository screen
            // , IPrivilageRepository privilage
            // , IPrivilageTypeRepository privilageType
            , IExBankRepository banks
            , IExCountryRepository countries
            , ICurrencyRepository currency
            , IIdsourceRepository exIdsource
            , IExClientJobRepository exClientJob
            , IExchangePurposeRepository exExchangePurpose
            , IExIncomeSourceRepository exIncomeSource
            //sec
            , ISecUserRepository secUser
            , IRepository<SecForm> secForm
            , ISecFormsFunctionRepository secFormsFunction
            , IRepository<SecFunction> secFunction
            , IRepository<SecTransactionLog> secTransactionLog
            , IRepository<SecUsersForm> secUsersForm
            , IRepository<SecUsersFunction> secUsersFunction
            , IExBranchRepository exBranch
            , IRepository<SecPermissionType> secPermissionType
            , IRepository<ExClientJobSeverity> exClientJobSeverity
            , IRepository<SecPermissionTypeBranches> secPermissionTypeBranches
            , IExClientRepository exClient
            , IRepository<ExAttachmentType> exAttachmentType 
            , IRepository<CurrencyBase> currencyBase
            , IRepository<ExClientsNote> exClientsNote
            , IRepository<ExClientsAttachment> exClientsAttachment 
            , IRepository<ExClientsMembership> exClientsMembership 
            ,IRepository<ExClientsRepresentative> exClientsRepresentative 
            ,IRepository<ExClientsType> exClientsType
            , IRepository<ExLocallyWanted> exLocallyWanted
            , IRepository<IsilList> isilList
            , IRepository<IsilXmlDatum> isilXmlDatum
            , IRepository<ExSuppliersType> exSuppliersType
            , IRepository<ExSupplier> exSupplier
            , IRepository<ExFormingStatus> exFormingStatus 
            , IRepository<ExInvoiceStatus> exInvoiceStatus
            , IRepository<ExInvoicesType> exInvoicesType 
            , IRepository<ExPaymentMethod> exPaymentMethod 
            , IRepository<ExWholeInvoiceStatus> exWholeInvoiceStatus
            , IRepository<ExWholePaymentMethod> exWholePaymentMethod 
            , IRepository<ExBranchTransferStatus> exBranchTransferStatus
            , IRepository<ExBranchTransferType> exBranchTransferType

            , IExInvoiceRepository exInvoice
            , IExInvoicesDetailRepository exInvoicesDetail 
            , IExWholeInvoiceRepository exWholeInvoice
            , IExWholeInvoicesDetailRepository exWholeInvoicesDetail 
            , IExBranchTransferRepository exBranchTransfer
            , IExBranchTransfersDetailRepository exBranchTransfersDetail 
            , IExInternalTransferRepository exInternalTransfer 
            , IExInternalTransfersDetailRepository exInternalTransfersDetail 
            , IExCurrenciesBvrRepository  exCurrenciesBvr 
            , ITreasuryRepository treasury
            , IExTaswyaDetailRepository exTaswyaDetail
            , IExTaswyaRepository exTaswya
            ,IExTreasuryTransfereRepository exTreasuryTransfere 
            ,IExTreasuryTransfereDetailRepository exTreasuryTransfereDetail
            , IWFListOfApprovalsRepository wFListOfApprovals 
            , IWFRequestDetailsRepository wFRequestDetails 
            , IWFRequestRepository wFRequest 
            , IWFRequestTypeRepository wFRequestType 
            , ITrackingDataRepository trackingDataRepository
            ,IAAccountRepository aAccount 
            ,IACostCenterRepository aCostCenter

            , IAJvRepository aJv 
            , IAJvsDetailRepository aJvsDetail
            , IAJvstatusRepository aJvstatus 
            , IAJvtypeRepository aJvtype
            ,IACashFlowRepository aCashFlow 
            ,IRepository<ACashFlowStatus> aCashFlowStatus
            ,IRepository<ACashFlowType> aCashFlowType 
            , IRepository<AJvAccountSetting> aJvAccountSetting
            , IBankAccountRepository bankAccount 
            , IBanksBvrRepository banksBvr 
            , IBanksTransfereRepository banksTransfere 
            , IBanksTreasuryTransfereRepository banksTreasuryTransfere 
            , IProveInOutCheckRepository proveInOutCheck 
            , IClientSecurityFileRepository clientSecurityFile
            , IRepository<ExClientSectors> exClientSectors
            , IRepository<ActivationKeys> activationKeys
            , IRepository<UserSetting> userSetting 
            ,IRepository<Setting> setting 
            ,IRepository<FinYears> finYears
            , IRepository<FinYearsPeriods> finYearsPeriods
            , IShiftTrackingRepository shiftTracking 
            , IClientActivitiesRepository clientActivities 
            , ITreasuryDealersRepository treasuryDealers 

            )
        {
            this.context = context;
            //Permission = permission;
            //Screen= screen;
            //Privilage= privilage;
            //PrivilageType= privilageType;
            ExBank = banks;
            ExCountry = countries;
            Currency = currency;
            ExIdsource = exIdsource;
            ExClientJob = exClientJob;
            ExExchangePurpose = exExchangePurpose;
            ExIncomeSource = exIncomeSource;
            SecUser = secUser;
            SecForm = secForm;
            SecFormsFunction = secFormsFunction;
            SecFunction = secFunction;
            SecTransactionLog = secTransactionLog;
            SecUsersForm = secUsersForm;
            SecUsersFunction = secUsersFunction;
            ExBranch = exBranch;
            SecPermissionType = secPermissionType;
            ExClientJobSeverity = exClientJobSeverity;
            SecPermissionTypeBranches = secPermissionTypeBranches;  
            ExClient = exClient;
            ExAttachmentType = exAttachmentType;
            CurrencyBase = currencyBase;
            ExClientsNote = exClientsNote;
            ExClientsAttachment = exClientsAttachment;
            ExClientsMembership = exClientsMembership;
            ExClientsRepresentative = exClientsRepresentative;
            ExClientsType = exClientsType;
            ExLocallyWanted = exLocallyWanted;
            IsilList = isilList;
            IsilXmlDatum = isilXmlDatum;
            ExSuppliersType = exSuppliersType;
            ExSupplier = exSupplier;
            ExFormingStatus = exFormingStatus;
            ExInvoiceStatus = exInvoiceStatus;
            ExInvoicesType =exInvoicesType;
            ExPaymentMethod = exPaymentMethod;
            ExWholeInvoiceStatus = exWholeInvoiceStatus;
            ExWholePaymentMethod = exWholePaymentMethod;
            ExBranchTransferStatus = exBranchTransferStatus;
            ExBranchTransferType =exBranchTransferType;
            ExInvoice = exInvoice;
            ExInvoicesDetail = exInvoicesDetail;
            ExWholeInvoice = exWholeInvoice;
            ExWholeInvoicesDetail = exWholeInvoicesDetail;
            ExBranchTransfer = exBranchTransfer;
            ExBranchTransfersDetail = exBranchTransfersDetail;
            ExInternalTransfer = exInternalTransfer;
            ExInternalTransfersDetail = exInternalTransfersDetail;
            ExCurrenciesBvr = exCurrenciesBvr;
            Treasury = treasury;
            ExTaswyaDetail = exTaswyaDetail;
            ExTaswya = exTaswya;
            ExTreasuryTransfere = exTreasuryTransfere;
            ExTreasuryTransfereDetail = exTreasuryTransfereDetail;
            WFListOfApprovals = wFListOfApprovals;
            WFRequestDetails = wFRequestDetails;
            WFRequest = wFRequest;
            WFRequestType = wFRequestType;
            TrackingData = trackingDataRepository;
            AAccount = aAccount;
            ACostCenter = aCostCenter;
            AJv = aJv;
            AJvsDetail = aJvsDetail;
            AJvstatus = aJvstatus;
            AJvtype = aJvtype;
            ACashFlow = aCashFlow;
            ACashFlowStatus = aCashFlowStatus;
            ACashFlowType = aCashFlowType;
            AJvAccountSetting  = aJvAccountSetting;
            BankAccount = bankAccount;
            BanksBvr = banksBvr;
            BanksTransfere =  banksTransfere;
            BanksTreasuryTransfere = banksTreasuryTransfere;
            ProveInOutCheck = proveInOutCheck;
            ClientSecurityFile = clientSecurityFile;
            ExClientSectors = exClientSectors;
            ActivationKeys = activationKeys;
            UserSetting = userSetting;
            Setting  = setting;
            FinYears = finYears;
            FinYearsPeriods = finYearsPeriods;
            ShiftTracking = shiftTracking;
            ClientActivities = clientActivities;
            TreasuryDealers = treasuryDealers;
        }

        //public async Task fill_Privilage()
        //{
        //    using (var connection = context.Database.GetDbConnection())
        //    {
        //        // Open the connection if it's closed
        //        if (connection.State != ConnectionState.Open)
        //            await connection.OpenAsync();

  
        //            await context.Database.ExecuteSqlRawAsync("EXEC fill_Privilage ");
                
        //    }
      
        //}


        public async Task<int> CompleteAsync()
        {
            try
            {
                return await context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                RollbackTran();
                if(ex.InnerException != null)
                    throw new ExchangeException("خطا في حفظ البيانات");
                else
                    throw new ExchangeException("خطا في حفظ البيانات");
            }

        }

        public object GetRepositoryByName(string name)
        {
            var type = GetType();
            var info = type.GetProperty(name);
            if (info == null)
                throw new Exception(AppMessages.InternalError +  name + "." + type.FullName);

            return info.GetValue(this, null);
        }

        public async void BeginTran()
        {
            try
            {
                await context.Database.BeginTransactionAsync();
            }
            catch (Exception ex) 
            { 
            
            }
        }

        public async void CommitTran()
        {
            await context.Database.CommitTransactionAsync();
        }

        public async void RollbackTran()
        {
            var transaction = context.Database.CurrentTransaction;
            if (transaction != null)
                await context.Database.RollbackTransactionAsync();
        }


         public List<Exchange_CurrenciesBalanceOutput> Sp_Exchange_CurrenciesBalance(Exchange_CurrenciesBalanceInput input)
        {
            return context.Sp_Exchange_CurrenciesBalance(input);
        }

        public List<Exchange_MovementOutput> Sp_Exchange_Movement(Exchange_MovementInput input)
        {
            return context.Sp_Exchange_Movement(input);
        }

        public List<Exchange_WholeMovementOutput> Sp_Exchange_WholeMovement(Exchange_WholeMovementInput input)
        {
            return context.Sp_Exchange_WholeMovement(input);
        }

        public List<Exchange_CurrencyMovementOutput> Sp_Exchange_CurrencyMovement(Exchange_CurrencyMovementInput input)
        {
            return context.Sp_Exchange_CurrencyMovement(input);
        }

        public List<ProfitOutput> Sp_Exchange_Profit(ProfitInput input)
        {
            return context.Sp_Exchange_Profit(input);
        }

        public List<SalesBuysOutput> Sp_Exchange_SalesBuys(SalesBuysInput input)
        {
            return context.Sp_Exchange_SalesBuys(input);
        }
        public List<KashfHesabOutput> Sp_Exchange_KashfHesab(KashfHesabInput input)
        {
            return context.Sp_Exchange_KashfHesab(input);
        }

        public AssetBalanceOutPut Sp_Exchange_AssetBalance(AssetBalanceInput input)
        {
            return context.Sp_Exchange_AssetBalance(input);
        }

        public Kashf_TahlelyOutPut Sp_Exchange_Kashf_Tahlely(Kashf_TahlelyInput input)
        {
            return context.Sp_Exchange_Kashf_Tahlely(input);
        }

        public List< mezanOutPut> Sp_Exchange_mezan(mezanInput input)
        {
            return context.Sp_Exchange_mezan(input);
        }

        public List<Central_statmentOutPut> Sp_Exchange_Central_statment(Central_statmentInput input)
        {
            return context.Sp_Exchange_Central_statment(input);
        }

        public List<Income_StOutPut> Sp_Exchange_Income_St(Income_StInput input)
        {
            return context.Sp_Exchange_Income_St(input);
        }
        public List<DialyKoyodOutput> Sp_Exchange_DialyKoyod(DialyKoyodInput input)
        {
            return context.Sp_Exchange_DialyKoyod(input);
        }
        public List<TreasutyMonementOutput> Sp_Exchange_TreasutyMonement(TreasutyMonementInput input)
        {
            return context.Sp_Exchange_TreasutyMonement(input);
        }
        public List<RequestResult> Sp_Exchange_WF_GetInputRequest(int userid)
        {
            return context.Sp_Exchange_WF_GetInputRequest(userid);
        }

        public bool Sp_Exchange_after_add_CurrencyBase(int ID)
        {
            return context.Sp_Exchange_after_add_CurrencyBase(ID);
        }

        public bool Sp_Exchange_after_add_treasury(int TreasuryId)
        {
            return context.Sp_Exchange_after_add_treasury(TreasuryId);
           
        }

    }
}



using System.Collections.Generic;
using System.Threading.Tasks;
using Core.DTOs;
using Core.DTOs.FinReports;
using Core.Entities.Account;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.Taswya;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;
using Core.Entities.TRN_WholeInvoices;
using Core.Repositories.Account;
using Core.Repositories.Bank;
using Core.Repositories.Base;
using Core.Repositories.Client;
using Core.Repositories.LookUps;
using Core.Repositories.TRN_Invoices;
using Core.Repositories.TRN_Transfers;
using Core.Repositories.Workflow;
using Microsoft.EntityFrameworkCore;

namespace Core.UnitOfWork
{
    public interface IUnitOfWork
    {

       void ExecuteRawSql(string sql);
        public IClientSecurityFileRepository ClientSecurityFile { get; }
        public Kashf_TahlelyOutPut Sp_Exchange_Kashf_Tahlely(Kashf_TahlelyInput input);


        public List<mezanOutPut> Sp_Exchange_mezan(mezanInput input);


        public List<Central_statmentOutPut> Sp_Exchange_Central_statment(Central_statmentInput input);


        public List<Income_StOutPut> Sp_Exchange_Income_St(Income_StInput input);
        AssetBalanceOutPut Sp_Exchange_AssetBalance(AssetBalanceInput input);
        List<KashfHesabOutput> Sp_Exchange_KashfHesab(KashfHesabInput input);
        public List<TreasutyMonementOutput> Sp_Exchange_TreasutyMonement(TreasutyMonementInput input);
        public IRepository<FinYears> FinYears { get; }
        public IRepository<FinYearsPeriods> FinYearsPeriods { get; }
        public IRepository<ActivationKeys> ActivationKeys { get; }
        public IRepository<ExClientSectors> ExClientSectors { get; }
        public IShiftTrackingRepository ShiftTracking { get; }
        public IClientActivitiesRepository ClientActivities { get; }
        public ITreasuryDealersRepository TreasuryDealers { get; }
        public IBankAccountRepository BankAccount { get; }
        public IBanksBvrRepository BanksBvr { get; }
        public IBanksTransfereRepository BanksTransfere { get; }
        public IBanksTreasuryTransfereRepository BanksTreasuryTransfere { get; }
        public IProveInOutCheckRepository ProveInOutCheck { get; }
        List<DialyKoyodOutput> Sp_Exchange_DialyKoyod(DialyKoyodInput input);
        List<SalesBuysOutput> Sp_Exchange_SalesBuys(SalesBuysInput input);
        List<ProfitOutput> Sp_Exchange_Profit(ProfitInput input);
        bool Sp_Exchange_after_add_CurrencyBase(int ID);
        bool Sp_Exchange_after_add_treasury(int TreasuryId);
        IACashFlowRepository ACashFlow { get; }
        public IRepository<AJvAccountSetting> AJvAccountSetting { get; }
        IRepository<ACashFlowStatus> ACashFlowStatus { get; }
        IRepository<ACashFlowType> ACashFlowType { get; }
        IAJvRepository AJv { get; }
        IAJvsDetailRepository AJvsDetail { get; }
        IAJvstatusRepository AJvstatus { get; }
        IAJvtypeRepository AJvtype { get; }
        IAAccountRepository AAccount { get; }
        IACostCenterRepository ACostCenter { get; }
        ITrackingDataRepository TrackingData { get; }
        IWFListOfApprovalsRepository WFListOfApprovals { get; }
        IWFRequestDetailsRepository WFRequestDetails { get; }
        IWFRequestRepository WFRequest { get; }
        IWFRequestTypeRepository WFRequestType { get; }

        IExTreasuryTransfereRepository ExTreasuryTransfere { get; }
        IExTreasuryTransfereDetailRepository ExTreasuryTransfereDetail { get; }
        IExTaswyaRepository ExTaswya { get; }
         IExTaswyaDetailRepository ExTaswyaDetail { get; }
        ITreasuryRepository Treasury { get; }
        IExInvoiceRepository ExInvoice { get; }
        IExInvoicesDetailRepository ExInvoicesDetail { get; }
        IExWholeInvoiceRepository ExWholeInvoice { get; }
        IExWholeInvoicesDetailRepository ExWholeInvoicesDetail { get; }
        IExBranchTransferRepository ExBranchTransfer { get; }
        IExBranchTransfersDetailRepository ExBranchTransfersDetail { get; }
        IExInternalTransferRepository ExInternalTransfer { get; }
        IExInternalTransfersDetailRepository ExInternalTransfersDetail { get; }
        IExCurrenciesBvrRepository ExCurrenciesBvr { get; }

        IRepository<UserSetting> UserSetting { get; }
        IRepository<Setting> Setting { get; }
        IRepository<ExFormingStatus> ExFormingStatus { get; }
       IRepository<ExInvoiceStatus> ExInvoiceStatus { get; }
       IRepository<ExInvoicesType> ExInvoicesType { get; }
       IRepository<ExPaymentMethod> ExPaymentMethod { get; }
       IRepository<ExWholeInvoiceStatus> ExWholeInvoiceStatus { get; }
       IRepository<ExWholePaymentMethod> ExWholePaymentMethod { get; }
       IRepository<ExBranchTransferStatus> ExBranchTransferStatus { get; }
       IRepository<ExBranchTransferType> ExBranchTransferType { get; }

        IRepository<ExSupplier> ExSupplier { get; }
        IRepository<ExSuppliersType> ExSuppliersType { get; }
        IRepository<ExLocallyWanted> ExLocallyWanted { get; }
        IRepository<IsilList> IsilList { get; }
        IRepository<IsilXmlDatum> IsilXmlDatum { get; }
        IRepository<ExClientsNote> ExClientsNote { get; }
        IRepository<CurrencyBase> CurrencyBase { get; }
        IRepository<ExAttachmentType> ExAttachmentType { get; }
        IRepository<ExClientsAttachment> ExClientsAttachment { get; }
        IRepository<ExClientsMembership> ExClientsMembership { get; }
        IRepository<ExClientsRepresentative> ExClientsRepresentative { get; }
        IRepository<ExClientsType> ExClientsType { get; }

        IExClientRepository ExClient { get; }
        IExBankRepository ExBank { get; }
        IExchangePurposeRepository ExExchangePurpose { get; }
        IExIncomeSourceRepository ExIncomeSource { get; }
        IExClientJobRepository ExClientJob { get; }
        IIdsourceRepository ExIdsource { get; }
        ICurrencyRepository Currency { get; }
        IExCountryRepository ExCountry { get; }
        ISecUserRepository SecUser { get; }

        IRepository<SecForm> SecForm { get; }
        ISecFormsFunctionRepository SecFormsFunction { get; }
        IRepository<SecFunction> SecFunction { get; }
        IRepository<SecTransactionLog> SecTransactionLog { get; }
        IRepository<SecUsersForm> SecUsersForm { get; }
        IRepository<SecUsersFunction> SecUsersFunction { get; }

        IExBranchRepository ExBranch { get; }
        IRepository<SecPermissionTypeBranches> SecPermissionTypeBranches { get; }
        IRepository<SecPermissionType> SecPermissionType { get; }
        IRepository<ExClientJobSeverity> ExClientJobSeverity { get; }

        List<Exchange_CurrenciesBalanceOutput> Sp_Exchange_CurrenciesBalance(Exchange_CurrenciesBalanceInput input);
        List<Exchange_MovementOutput> Sp_Exchange_Movement(Exchange_MovementInput input);
        List<Exchange_WholeMovementOutput> Sp_Exchange_WholeMovement(Exchange_WholeMovementInput input);
        List<Exchange_CurrencyMovementOutput> Sp_Exchange_CurrencyMovement(Exchange_CurrencyMovementInput input);
        List<RequestResult> Sp_Exchange_WF_GetInputRequest(int userid);
        Task<int> CompleteAsync();

        void BeginTran();

        void CommitTran();

        void RollbackTran();

        object GetRepositoryByName(string name);
    }
}

using Core;
using Core.Entities.Account;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
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
using Core.UnitOfWork;
using Infrastructure.Data;
using Infrastructure.Repositories;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System.Text.Json;

namespace Infrastructure
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddInfrastructureDI(this IServiceCollection services, AppSettings settings)
        {
            services.AddDbContext<DBContext>(
                m => m.UseSqlServer(settings.ConnectionStrings.Db,x=>x.UseNetTopologySuite()));

            //services.AddDbContextFactory<DBContext>(
            //    m => m.UseSqlServer(settings.ConnectionStrings.Db, x => x.UseNetTopologySuite()));

            services.Configure<IdentityOptions>(option => {
                option.Password.RequiredLength = 6;
                option.Password.RequireUppercase = true;
                option.Password.RequireLowercase = true;
                option.Password.RequireDigit = true;
                option.Password.RequireNonAlphanumeric = true;
                option.User.RequireUniqueEmail = false;
            }
            );


            services.AddScoped<IUnitOfWork, UnitOfWork.UnitOfWork>();
            //services.AddScoped<DynamoUserManager>();
            //services.AddScoped<DynamoSession>();
            services.AddScoped(typeof(IPasswordHasher<>), typeof(PasswordHasher<>));
            //services.AddScoped<RoleConfiguration>();
            //services.AddScoped<UserConfiguration>();
            //services.AddScoped<UserRolesConfiguration>();
            //services.AddScoped<DynamoUserMapping>();
            //services.AddScoped<DynamoRoleMapping>();
            //services.AddScoped<IdentityUserRoleMapping>();

            services.AddScoped(typeof(IRepository<>), typeof(BaseRepository<>));
            //services.AddScoped(typeof(IPermissionRepository), typeof(PermissionRepository));
            //services.AddScoped(typeof(IRolePermissionRepository<RolePermission>), typeof(RolePermissionRepository));
            //services.AddScoped(typeof(IUserRoleRepository<IdentityUserRole<string>>), typeof(UserRoleRepository));

            //services.AddScoped(typeof(IPrivilageRepository), typeof(PrivilageRepository));
            //services.AddScoped(typeof(IPrivilageTypeRepository), typeof(PrivilageTypeRepository));
            //services.AddScoped(typeof(IScreenRepository), typeof(ScreenRepository));


            services.AddScoped(typeof(IExIncomeSourceRepository), typeof(ExIncomeSourceRepository));
            services.AddScoped(typeof(IExBankRepository), typeof(ExBankRepository));
            services.AddScoped(typeof(IExCountryRepository), typeof(ExCountryRepository));
            services.AddScoped(typeof(ICurrencyRepository), typeof(CurrencyRepository));
            services.AddScoped(typeof(Core.Repositories.LookUps.IIdsourceRepository), typeof(Repositories.ExIdsourceRepository));
            services.AddScoped(typeof(IExClientJobRepository), typeof(ExClientJobRepository));
            services.AddScoped(typeof(Core.Repositories.LookUps.IExchangePurposeRepository), typeof(Repositories.ExExchangePurposeRepository));
            services.AddScoped(typeof(ISecUserRepository), typeof(SecUserRepository));
            services.AddScoped(typeof(IRepository<SecForm>), typeof(BaseRepository<SecForm>));
            services.AddScoped(typeof(ISecFormsFunctionRepository), typeof(SecFormsFunctionRepository));
            services.AddScoped(typeof(IRepository<SecFunction>), typeof(BaseRepository<SecFunction>));
            services.AddScoped(typeof(IRepository<SecTransactionLog>), typeof(BaseRepository<SecTransactionLog>));
            services.AddScoped(typeof(IRepository<SecUsersForm>), typeof(BaseRepository<SecUsersForm>));
            services.AddScoped(typeof(IRepository<SecUsersFunction>), typeof(BaseRepository<SecUsersFunction>));
            services.AddScoped(typeof(IRepository<SecPermissionTypeBranches>), typeof(BaseRepository<SecPermissionTypeBranches>));
            services.AddScoped(typeof(IRepository<ExClientJobSeverity>), typeof(BaseRepository<ExClientJobSeverity>));
            services.AddScoped(typeof(IRepository<SecPermissionType>), typeof(BaseRepository<SecPermissionType>));
            services.AddScoped(typeof(IRepository<ExBranch>), typeof(BaseRepository<ExBranch>));
            services.AddScoped(typeof(IExClientRepository), typeof(ExClientRepository));
            
            services.AddScoped(typeof(IRepository<ExAttachmentType>), typeof(BaseRepository<ExAttachmentType>));
            services.AddScoped(typeof(IRepository<ExClientsAttachment>), typeof(BaseRepository<ExClientsAttachment>));
            services.AddScoped(typeof(IRepository<ExClientsMembership>), typeof(BaseRepository<ExClientsMembership>));
            services.AddScoped(typeof(IRepository<ExClientsRepresentative>), typeof(BaseRepository<ExClientsRepresentative>));
            services.AddScoped(typeof(IRepository<ExClientsType>), typeof(BaseRepository<ExClientsType>));
            services.AddScoped(typeof(IRepository<CurrencyBase>), typeof(BaseRepository<CurrencyBase>));
            services.AddScoped(typeof(IRepository<ExClientsNote>), typeof(BaseRepository<ExClientsNote>));
            services.AddScoped(typeof(IRepository<ExLocallyWanted>), typeof(BaseRepository<ExLocallyWanted>));
            services.AddScoped(typeof(IRepository<IsilList>), typeof(BaseRepository<IsilList>));
            services.AddScoped(typeof(IRepository<IsilXmlDatum>), typeof(BaseRepository<IsilXmlDatum>));
            services.AddScoped(typeof(IRepository<ExSuppliersType>), typeof(BaseRepository<ExSuppliersType>));

            services.AddScoped(typeof(IRepository<ExFormingStatus>), typeof(BaseRepository<ExFormingStatus>));
            services.AddScoped(typeof(IRepository<ExInvoiceStatus>), typeof(BaseRepository<ExInvoiceStatus>));
            services.AddScoped(typeof(IRepository<ExInvoicesType>), typeof(BaseRepository<ExInvoicesType>));
            services.AddScoped(typeof(IRepository<ExPaymentMethod>), typeof(BaseRepository<ExPaymentMethod>));
            services.AddScoped(typeof(IRepository<ExWholeInvoiceStatus>), typeof(BaseRepository<ExWholeInvoiceStatus>));
            services.AddScoped(typeof(IRepository<ExWholePaymentMethod>), typeof(BaseRepository<ExWholePaymentMethod>));
            services.AddScoped(typeof(IRepository<ExBranchTransferStatus>), typeof(BaseRepository<ExBranchTransferStatus>));
            services.AddScoped(typeof(IRepository<ExBranchTransferType>), typeof(BaseRepository<ExBranchTransferType>));
            services.AddScoped(typeof(IRepository<ExClientSectors>), typeof(BaseRepository<ExClientSectors>));
          
            
            
            services.AddScoped(typeof(IExInvoiceRepository), typeof(ExInvoiceRepository));
            services.AddScoped(typeof(IExInvoicesDetailRepository), typeof(ExInvoicesDetailRepository));
            services.AddScoped(typeof(IExWholeInvoiceRepository), typeof(ExWholeInvoiceRepository));
            services.AddScoped(typeof(IExWholeInvoicesDetailRepository), typeof(ExWholeInvoicesDetailRepository));
            services.AddScoped(typeof(IExBranchTransferRepository), typeof(ExBranchTransferRepository));
            services.AddScoped(typeof(IExBranchTransfersDetailRepository), typeof(ExBranchTransfersDetailRepository));
            services.AddScoped(typeof(IExInternalTransferRepository), typeof(ExInternalTransferRepository));
            services.AddScoped(typeof(IExInternalTransfersDetailRepository), typeof(ExInternalTransfersDetailRepository));
            services.AddScoped(typeof(IExCurrenciesBvrRepository), typeof(ExCurrenciesBvrRepository));
            services.AddScoped(typeof(ITreasuryRepository), typeof(TreasuryRepository));
            services.AddScoped(typeof(IExTaswyaRepository), typeof(ExTaswyaRepository));
            services.AddScoped(typeof(IExTaswyaDetailRepository), typeof(ExTaswyaDetailRepository));
            services.AddScoped(typeof(IExTreasuryTransfereRepository), typeof(ExTreasuryTransfereRepository));
            services.AddScoped(typeof(IExTreasuryTransfereDetailRepository), typeof(ExTreasuryTransfereDetailRepository));
            services.AddScoped(typeof(IWFListOfApprovalsRepository), typeof(WFListOfApprovalsRepository));
            services.AddScoped(typeof(IWFRequestRepository), typeof(WFRequestRepository));
            services.AddScoped(typeof(IWFRequestDetailsRepository), typeof(WFRequestDetailsRepository));
            services.AddScoped(typeof(IWFRequestTypeRepository), typeof(WFRequestTypeRepository));
            services.AddScoped(typeof(ITrackingDataRepository), typeof(TrackingDataRepository));
            services.AddScoped(typeof(IAAccountRepository), typeof(AAccountRepository));
            services.AddScoped(typeof(IACostCenterRepository), typeof(ACostCenterRepository));
           
            services.AddScoped(typeof(IAJvRepository), typeof(AJvRepository));
            services.AddScoped(typeof(IAJvsDetailRepository), typeof(AJvsDetailRepository));
            services.AddScoped(typeof(IAJvstatusRepository), typeof(AJvstatusRepository));
            services.AddScoped(typeof(IAJvtypeRepository), typeof(AJvtypeRepository));
            services.AddScoped(typeof(IExBranchRepository), typeof(ExBranchRepository));
           
            services.AddScoped(typeof(IACashFlowRepository), typeof(ACashFlowRepository));
            services.AddScoped(typeof(IRepository<ACashFlowStatus>), typeof(BaseRepository<ACashFlowStatus>));
            services.AddScoped(typeof(IRepository<ACashFlowType>), typeof(BaseRepository<ACashFlowType>));
            services.AddScoped(typeof(IRepository<AJvAccountSetting>), typeof(BaseRepository<AJvAccountSetting>));
            services.AddScoped(typeof(IRepository<ActivationKeys>), typeof(BaseRepository<ActivationKeys>));
            services.AddScoped(typeof(IRepository<FinYears>), typeof(BaseRepository<FinYears>));
            services.AddScoped(typeof(IRepository<FinYearsPeriods>), typeof(BaseRepository<FinYearsPeriods>));

            services.AddScoped(typeof(IBankAccountRepository), typeof(BankAccountRepository));
            services.AddScoped(typeof(IBanksBvrRepository), typeof(BanksBvrRepository));
            services.AddScoped(typeof(IBanksTransfereRepository), typeof(BanksTransfereRepository));
            services.AddScoped(typeof(IBanksTreasuryTransfereRepository), typeof(BanksTreasuryTransfereRepository));
            services.AddScoped(typeof(IProveInOutCheckRepository), typeof(ProveInOutCheckRepository));
            services.AddScoped(typeof(IClientSecurityFileRepository), typeof(ClientSecurityFileRepository));
            services.AddScoped(typeof(IShiftTrackingRepository), typeof(ShiftTrackingRepository));
            services.AddScoped(typeof(IClientActivitiesRepository), typeof(ClientActivitiesRepository));
            services.AddScoped(typeof(ITreasuryDealersRepository), typeof(TreasuryDealersRepository));


            return services;
        }
    }
}

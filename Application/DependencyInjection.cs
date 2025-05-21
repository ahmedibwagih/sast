using Application.Core.DTOs.Account;
using Application.Core.DTOs.Clients;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.Sec;
using Application.Core.Services;
using Application.Core.Services.Account;
using Application.Core.Services.Client;
using Application.Core.Services.LookUps;
using Application.Core.Services.WorkFlow;
using Application.Mapper;
using Application.Services;
using Application.Services.Account;
using Application.Services.Bank;
using Application.Services.LookUps;
using Core;
using Core.Entities.Account;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Repositories.Client;
using Infrastructure.Repositories;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace Application
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddApplicationDI(this IServiceCollection services, AppSettings config)
        {
            services.AddSingleton(config);
            //services.AddScoped<IAuthenticateService, AuthenticateService>();
            services.AddScoped(typeof(IService<,,,,>), typeof(BaseService<,,,,>));
            //services.AddScoped<IUserService, UserService>();


            //LookUps
            services.AddScoped<IExIncomeSourceService, ExIncomeSourceService>();
            services.AddScoped< IBanksService, BanksService>();
            services.AddScoped< IFinYearsPeriodsService, FinYearsPeriodsService>();
            services.AddScoped< IFinYearsService, FinYearsService>();
            services.AddScoped< ICountriesService, CountriesService>();
            services.AddScoped< ICurrenciesMainService, CurrenciesService>();
            services.AddScoped< IIdentitySourcesService, IdentitySourcesService>();
            services.AddScoped< IJobsService, JobsService>();
            services.AddScoped < ITransferPurposesService, TransferPurposesService>();

            //Sec
            services.AddScoped(typeof(ISecurityService), typeof(SecurityService));
            services.AddScoped(typeof(IService<SecForm, SecFormDto, SecFormDto, SecFormDto, SecFormDto>), typeof(BaseService<SecForm, SecFormDto, SecFormDto, SecFormDto, SecFormDto>));
            services.AddScoped(typeof(IService<SecFormsFunction, SecFormsFunctionDto, SecFormsFunctionDto, SecFormsFunctionDto, SecFormsFunctionDto>), typeof(BaseService<SecFormsFunction, SecFormsFunctionDto, SecFormsFunctionDto, SecFormsFunctionDto, SecFormsFunctionDto>));
            services.AddScoped(typeof(IService<SecFunction, SecFunctionDto, SecFunctionDto, SecFunctionDto, SecFunctionDto>), typeof(BaseService<SecFunction, SecFunctionDto, SecFunctionDto, SecFunctionDto, SecFunctionDto>));
            services.AddScoped(typeof(IService<SecTransactionLog, SecTransactionLogDto, SecTransactionLogDto, SecTransactionLogDto, SecTransactionLogDto>), typeof(BaseService<SecTransactionLog, SecTransactionLogDto, SecTransactionLogDto, SecTransactionLogDto, SecTransactionLogDto>));
            services.AddScoped(typeof(IService<SecUsersForm, SecUsersFormDto, SecUsersFormDto, SecUsersFormDto, SecUsersFormDto>), typeof(BaseService<SecUsersForm, SecUsersFormDto, SecUsersFormDto, SecUsersFormDto, SecUsersFormDto>));
            services.AddScoped(typeof(IService<SecUsersFunction, SecUsersFunctionDto, SecUsersFunctionDto, SecUsersFunctionDto, SecUsersFunctionDto>), typeof(BaseService<SecUsersFunction, SecUsersFunctionDto, SecUsersFunctionDto, SecUsersFunctionDto, SecUsersFunctionDto>));
            services.AddScoped(typeof(IExClientSectorsService), typeof(ExClientSectorsService));


            services.AddScoped<IExClientService, ExClientService>();
            services.AddScoped<IExSupplierService, ExSupplierService>();
            services.AddScoped(typeof(IService<ExAttachmentType, ExAttachmentTypeDto, ExAttachmentTypeDto, ExAttachmentTypeDto, ExAttachmentTypeDto>), typeof(BaseService<ExAttachmentType, ExAttachmentTypeDto, ExAttachmentTypeDto, ExAttachmentTypeDto, ExAttachmentTypeDto>));
            services.AddScoped(typeof(IService<ExClientsAttachment, ExClientsAttachmentDto, ExClientsAttachmentDto, ExClientsAttachmentDto, ExClientsAttachmentDto>), typeof(BaseService<ExClientsAttachment, ExClientsAttachmentDto, ExClientsAttachmentDto, ExClientsAttachmentDto, ExClientsAttachmentDto>));
            services.AddScoped(typeof(IService<ExClientsMembership, ExClientsMembershipDto, ExClientsMembershipDto, ExClientsMembershipDto, ExClientsMembershipDto>), typeof(BaseService<ExClientsMembership, ExClientsMembershipDto, ExClientsMembershipDto, ExClientsMembershipDto, ExClientsMembershipDto>));
            services.AddScoped(typeof(IService<ExClientsRepresentative, ExClientsRepresentativeDto, ExClientsRepresentativeDto, ExClientsRepresentativeDto, ExClientsRepresentativeDto>), typeof(BaseService<ExClientsRepresentative, ExClientsRepresentativeDto, ExClientsRepresentativeDto, ExClientsRepresentativeDto, ExClientsRepresentativeDto>));
            services.AddScoped(typeof(IService<ExClientsType, ExClientsTypeDto, ExClientsTypeDto, ExClientsTypeDto, ExClientsTypeDto>), typeof(BaseService<ExClientsType, ExClientsTypeDto, ExClientsTypeDto, ExClientsTypeDto, ExClientsTypeDto>));
           // services.AddScoped(typeof(IService<CurrencyBase, CurrencyBaseDto, CurrencyBaseDto, CurrencyBaseDto, CurrencyBaseDto>), typeof(BaseService<CurrencyBase, CurrencyBaseDto, CurrencyBaseDto, CurrencyBaseDto, CurrencyBaseDto>));
            services.AddScoped(typeof(IService<ExClientsNote, ExClientsNoteDto, ExClientsNoteDto, ExClientsNoteDto, ExClientsNoteDto>), typeof(BaseService<ExClientsNote, ExClientsNoteDto, ExClientsNoteDto, ExClientsNoteDto, ExClientsNoteDto>));
           
            services.AddScoped<ICurrencyBaseService, CurrencyBaseService>();
            services.AddScoped<ILocallyWantedService, LocallyWantedService>();
            services.AddScoped<IExternalWantedService, ExternalWantedService>();
            services.AddScoped<IExInvoiceService, ExInvoiceService>();
            services.AddScoped<IExWholeInvoiceService, ExWholeInvoiceService>();
            services.AddScoped<IExInternalTransferService, ExInternalTransferService>();
            services.AddScoped<IProcService, ProcService>();
            services.AddScoped<ITreasuryService, TreasuryService>();
            services.AddScoped<IExTaswyaService, ExTaswyaService>();
            services.AddScoped<ITreasuryTransfereService, TreasuryTransfereService>();
            services.AddScoped<IWorkFlowService, WorkFlowService>();
            services.AddScoped<ITrackingDataService, TrackingDataService>();
            services.AddScoped<IAccountService, AccountService>();
            services.AddScoped(typeof(IService<ACostCenter, ACostCenterDto, ACostCenterDto, ACostCenterDto, ACostCenterDto>), typeof(BaseService<ACostCenter, ACostCenterDto, ACostCenterDto, ACostCenterDto, ACostCenterDto>));
            services.AddScoped<IJvsService, JvsService>();
            services.AddScoped<IACashFlowService, ACashFlowService>();


            services.AddScoped(typeof(IService<AJvsDetail, AJvsDetailDto, AJvsDetailDto, AJvsDetailDto, AJvsDetailDto>), typeof(BaseService<AJvsDetail, AJvsDetailDto, AJvsDetailDto, AJvsDetailDto, AJvsDetailDto>));
            services.AddScoped(typeof(IService<AJvstatus, AJvstatusDto, AJvstatusDto, AJvstatusDto, AJvstatusDto>), typeof(BaseService<AJvstatus, AJvstatusDto, AJvstatusDto, AJvstatusDto, AJvstatusDto>));
            services.AddScoped(typeof(IService<AJvtype, AJvtypeDto, AJvtypeDto, AJvtypeDto, AJvtypeDto>), typeof(BaseService<AJvtype, AJvtypeDto, AJvtypeDto, AJvtypeDto, AJvtypeDto>));
           
            services.AddScoped(typeof(IService<ACashFlowStatus, ACashFlowStatusDto, ACashFlowStatusDto, ACashFlowStatusDto, ACashFlowStatusDto>), typeof(BaseService<ACashFlowStatus, ACashFlowStatusDto, ACashFlowStatusDto, ACashFlowStatusDto, ACashFlowStatusDto>));
            services.AddScoped(typeof(IService<ACashFlowType, ACashFlowTypeDto, ACashFlowTypeDto, ACashFlowTypeDto, ACashFlowTypeDto>), typeof(BaseService<ACashFlowType, ACashFlowTypeDto, ACashFlowTypeDto, ACashFlowTypeDto, ACashFlowTypeDto>));
            services.AddScoped(typeof(IService<AJvAccountSetting, AJvAccountSettingDto, AJvAccountSettingDto, AJvAccountSettingDto, AJvAccountSettingDto>), typeof(BaseService<AJvAccountSetting, AJvAccountSettingDto, AJvAccountSettingDto, AJvAccountSettingDto, AJvAccountSettingDto>));
            services.AddScoped(typeof(IService<ExClientSectors, ExClientSectorsDto, ExClientSectorsDto, ExClientSectorsDto, ExClientSectorsDto>), typeof(BaseService<ExClientSectors, ExClientSectorsDto, ExClientSectorsDto, ExClientSectorsDto, ExClientSectorsDto>));
            // services.AddScoped(typeof(MapperObject), typeof(MapperObject));

            services.AddScoped<IBankAccountService, BankAccountService>();
            services.AddScoped<IBanksBvrService, BanksBvrService>();
            services.AddScoped<IBanksTransfereService, BanksTransfereService>();
            services.AddScoped<IBanksTreasuryTransfereService, BanksTreasuryTransfereService>();
            services.AddScoped<IProveInOutCheckService, ProveInOutCheckService>();
            services.AddScoped<IShiftTrackingService, ShiftTrackingService>();
            services.AddScoped<IClientActivitiesService, ClientActivitiesService>();
            services.AddScoped<ITreasuryDealersService, TreasuryDealersService>();
            return services;
        }
    }
}

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
using Core.Entities.LookUps;
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
using static Google.Apis.Requests.BatchRequest;

namespace Application.Services.Account
{
    public class AccountService : BaseService<AAccount, AAccountDto, AAccountDto, AAccountDto, AAccountDto>, IAccountService
    {
        IService<ACostCenter, ACostCenterDto, ACostCenterDto, ACostCenterDto, ACostCenterDto> ACostCenterService;
        public AccountService(IUnitOfWork unitOfWork, IService<ACostCenter, ACostCenterDto, ACostCenterDto, ACostCenterDto, ACostCenterDto> aCostCenterService) : base(unitOfWork)
        {
            ACostCenterService = aCostCenterService;
        }




    }
}

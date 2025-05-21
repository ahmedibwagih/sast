using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;

using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Application.Core.DTOs.Clients;
using Application.Core.DTOs.LookUps;
using Application.Core.Services;
using Application.Core.Services.Client;
using Application.Core.Services.LookUps;
using Core;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.others;
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
    public class LocallyWantedService : BaseService<ExLocallyWanted, ExLocallyWantedDto, ExLocallyWantedDto, ExLocallyWantedDto, ExLocallyWantedDto>, ILocallyWantedService
    {
        //  private readonly DynamoSession session;

        public LocallyWantedService(IUnitOfWork unitOfWork
       ) : base(unitOfWork)
        {

            //this.session = session;
        }



 


    }
}

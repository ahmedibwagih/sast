using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;

using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

using Application.Core.DTOs.LookUps;
using Application.Core.Services;
using Application.Core.Services.LookUps;
using Core;
using Core.DTOs;
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
    public class BanksService : BaseService<ExBank, ExBankDto, ExBankDto, ExBankDto, ExBankDto>, IBanksService
    {
      //  private readonly DynamoSession session;

        public BanksService(IUnitOfWork unitOfWork
       ) : base(unitOfWork)
        {
            
            //this.session = session;
        }

        public override async Task<ExBankDto> GetById(long id)
        {
          // var xx = this.UnitOfWork.Sp_Exchange_CurrenciesBalance(new Exchange_CurrenciesBalanceInput() { branchId = 1, date = DateTime.Now, Type = 1, Userid = 2244 });
            var response = await base.GetById(id);
            return response;
        }

        public override async Task<ExBankDto> Create(ExBankDto input)
        {


            try
            {
                input.AccountId = null;
                var entity = Mapper.MapperObject.Mapper.Map<ExBank>(input);

                var cheh_dup =await UnitOfWork.ExBank.GetAsync("BankAccountNameEn == \"" + input.BankAccountNameEn + "\" || BankAccountNameAr == \"" + input.BankAccountNameAr + "\" ");

                if (cheh_dup.Count > 0)
                {
                    throw new System.Exception("this bank name exists");
                }
                var x = 0;
                try
                { x = (await UnitOfWork.ExBank.GetAllAsync_withDeleted()).Max(a => a.BankId); }
                catch { }

                entity.BankId = x + 1;
             
                if (entity is null)
                {
                    throw new System.Exception(AppMessages.InternalError);
                }

                await OnCreating(entity, input);


                UnitOfWork.BeginTran();

                var newEntity = await Repository.AddAsync(entity);

                await UnitOfWork.CompleteAsync();

                await OnCreated(newEntity, input);

                UnitOfWork.CommitTran();

                var response = Mapper.MapperObject.Mapper.Map<ExBankDto>(newEntity);
                return response;
            }
            catch (System.Exception ex)
            {

                throw;
            }
            return null;
        }

      


    }
}

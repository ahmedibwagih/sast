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
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.Sec;
using Core.Other;
using Core.UnitOfWork;
using Infrastructure.Migrations;
using Infrastructure.UnitOfWork;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using static System.Runtime.InteropServices.JavaScript.JSType;
using static Google.Apis.Requests.BatchRequest;

namespace Application.Services.LookUps
{
    public class ExSupplierService : BaseService<ExSupplier, ClientOrSuppliersDto, ClientOrSuppliersDto, ClientOrSuppliersDto, ClientOrSuppliersDto>, IExSupplierService
    {

        public ExSupplierService(IUnitOfWork unitOfWork) : base(unitOfWork)
        {

        }

        //public override async Task<ClientOrSuppliersDto> GetById(long id)
        //{
        //    var response = filterDelails( await base.GetById(id));
        //    return response;
        //}




        public override async Task<ClientOrSuppliersDto> Create(ClientOrSuppliersDto input)
        {


            try
            {
               
                var entity = Mapper.MapperObject.Mapper.Map<ExSupplier>(input);

                //  entity.ClientId = (await UnitOfWork.ExSupplier.GetAllAsync()).Max(a => a.ClientId) + 1;
                entity.SupplierId = 0;
                if (entity is null)
                {
                    throw new System.Exception(AppMessages.InternalError);
                }

                await OnCreating(entity, input);


                UnitOfWork.BeginTran();

                var newEntity = await Repository.AddAsync(entity);

                await UnitOfWork.CompleteAsync();

                newEntity.SupplierCode = int.Parse( newEntity.SupplierId.ToString());
                await OnCreated(newEntity, input);

                await UnitOfWork.CompleteAsync();

                UnitOfWork.CommitTran();

                var response = Mapper.MapperObject.Mapper.Map<ClientOrSuppliersDto>(newEntity);
                return response;
            }
            catch (System.Exception ex)
            {

                throw;
            }
            return null;
        }


        public  async Task<ClientOrSuppliersDto> Create2(ClientOrSuppliersDto3 data)
        {

            var input = Mapper.MapperObject.Mapper.Map<ClientOrSuppliersDto>(data);
          
            input.AccountNumber = null;
            try
            {

                var entity = Mapper.MapperObject.Mapper.Map<ExSupplier>(input);
                entity.SupplierTypeId = 2;
                //  entity.ClientId = (await UnitOfWork.ExSupplier.GetAllAsync()).Max(a => a.ClientId) + 1;
                entity.SupplierId = 0;
                if (entity is null)
                {
                    throw new System.Exception(AppMessages.InternalError);
                }

                await OnCreating(entity, input);


                UnitOfWork.BeginTran();

                var newEntity = await Repository.AddAsync(entity);

                await UnitOfWork.CompleteAsync();

                newEntity.SupplierCode = int.Parse(newEntity.SupplierId.ToString());
                await OnCreated(newEntity, input);

                await UnitOfWork.CompleteAsync();

                UnitOfWork.CommitTran();

                var response = Mapper.MapperObject.Mapper.Map<ClientOrSuppliersDto>(newEntity);
                return response;
            }
            catch (System.Exception ex)
            {

                throw;
            }
            return null;
        }




        public async Task<List<ExSuppliersTypeDto>> GetSuppliersType()
        {
            try
            {
                var ExAttachmentType = await UnitOfWork.ExSuppliersType.GetAllAsync();
                var entityDto = Mapper.MapperObject.Mapper.Map<List<ExSuppliersTypeDto>>(ExAttachmentType);
                return entityDto;
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }

        


        public override async Task<PagingResultDto<ClientOrSuppliersDto>> GetAllPaging(PagingInputDto PagingInputDto)
        {
            var result = await Repository.GetAllPagingAsync(PagingInputDto);

            var list = Mapper.MapperObject.Mapper.Map<List<ClientOrSuppliersDto>>(result.Item1);

            var response = new PagingResultDto<ClientOrSuppliersDto>
            {
                Result =  list,
                Total = result.Item2
            };

            return response;
        }

        public override async Task<IList<ClientOrSuppliersDto>> GetAll()
        {
            var list = await Repository.GetAllAsync();
            var result =  Mapper.MapperObject.Mapper.Map<List<ClientOrSuppliersDto>>(list);

            return  result;
        }

        public override async Task<List<ClientOrSuppliersDto>> GetByCond(string cond)
        {
            var entity = await Repository.GetAsync(cond);

            var response = Mapper.MapperObject.Mapper.Map<List<ClientOrSuppliersDto>>(entity);

            return response;
        }


    }
}

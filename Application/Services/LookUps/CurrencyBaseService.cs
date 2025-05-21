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
    public class CurrencyBaseService : BaseService<CurrencyBase, CurrencyBaseDto, CurrencyBaseDto, CurrencyBaseDto, CurrencyBaseDto>, ICurrencyBaseService
    {
      //  private readonly DynamoSession session;

        public CurrencyBaseService(IUnitOfWork unitOfWork
       ) : base(unitOfWork)
        {
            
            //this.session = session;
        }

        public override async Task Delete(long id)
        {
          throw new Exception("لا يمكن الحذف");
        }

        public override async Task DeleteTrn(long id)
        {
            throw new Exception("لا يمكن الحذف");
        }
        public override async Task<CurrencyBaseDto> Create(CurrencyBaseDto input)
        {


            try
            {
                var curr_count = (await UnitOfWork.CurrencyBase.GetAsync("CurrencyCode = " + input.CurrencyCode)).ToList().Count();
                if (curr_count > 0)
                {
                    throw new System.Exception("كود العمله موجود من قبل");
                }
                var entity = Mapper.MapperObject.Mapper.Map<CurrencyBase>(input);
                if (entity is null)
                {
                    throw new System.Exception(AppMessages.InternalError);
                }

                await OnCreating(entity, input);


                UnitOfWork.BeginTran();

                var newEntity = await Repository.AddAsync(entity);

                await UnitOfWork.CompleteAsync();
                newEntity.CurrencyCode= int.Parse( newEntity.Id.ToString());
                await OnCreated(newEntity, input);

                await UnitOfWork.CompleteAsync();

                UnitOfWork.CommitTran();

                try
                {
                    if (typeof(CurrencyBaseDto) == typeof(TreasuryDto))
                    {
                        var entitydto = Mapper.MapperObject.Mapper.Map<CurrencyBaseDto>(newEntity);
                        UnitOfWork.Sp_Exchange_after_add_treasury(int.Parse(entitydto.Id.ToString()));
                    }
                    else
                    if (typeof(CurrencyBaseDto) == typeof(CurrencyBaseDto))
                    {
                        var entitydto = Mapper.MapperObject.Mapper.Map<CurrencyBaseDto>(newEntity);
                        UnitOfWork.Sp_Exchange_after_add_CurrencyBase(int.Parse(entitydto.Id.ToString()));
                    }
                }
                catch { }



                var response = Mapper.MapperObject.Mapper.Map<CurrencyBaseDto>(newEntity);
                return response;
            }
            catch (System.Exception ex)
            {

                throw new System.Exception(AppMessages.InternalError + " :" + ex.Message.ToString());
            }

        }

        public override async Task<PagingResultDto<CurrencyBaseDto>> GetAllPaging(PagingInputDto pagingInputDto)
        {
            var result = await Repository.GetAllPagingAsync(pagingInputDto);

            var list = Mapper.MapperObject.Mapper.Map<IList<CurrencyBaseDto>>(result.Item1);

            foreach (var item in list)
            {
                if(item.CountryId !=null && item.CountryId !=0)
                item.CountryName=(await this.UnitOfWork.ExCountry.GetByIdLightAsync(long.Parse( item.CountryId.ToString()))).CountryNameAr.ToString();
            }

            var response = new PagingResultDto<CurrencyBaseDto>
            {
                Result = list,
                Total = result.Item2
            };

            return response;
        }


    }
}

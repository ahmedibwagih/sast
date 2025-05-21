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
using NetTopologySuite.Index.HPRtree;
using static Google.Apis.Requests.BatchRequest;

namespace Application.Services.LookUps
{
    public class TreasuryService : BaseService<Treasury, TreasuryDto, TreasuryDto, TreasuryDto, TreasuryDto>, ITreasuryService
    {
      //  private readonly DynamoSession session;

        public TreasuryService(IUnitOfWork unitOfWork
       ) : base(unitOfWork)
        {
            
            //this.session = session;
        }


        //public override async Task<PagingResultDto<TreasuryDto>> GetAllPaging(PagingInputDto pagingInputDto)
        //{
        //    var result = await Repository.GetAllPagingAsync(pagingInputDto);

        //    var list = Mapper.MapperObject.Mapper.Map<IList<TreasuryDto>>(result.Item1);

        //    foreach (var item in list)
        //    {
        //        item.TreasuryDealers = item.TreasuryDealers.Where(a => a.IsDeleted != true).ToList();
        //    }
        //    var response = new PagingResultDto<TreasuryDto>
        //    {
        //        Result = list,
        //        Total = result.Item2
        //    };

         

        //    return response;
        //}
        public override async Task<TreasuryDto> GetById(long id)
        {
            var entity = await Repository.GetByIdAsync(id);

            var response = Mapper.MapperObject.Mapper.Map<TreasuryDto>(entity);
            response.TreasuryDealers = response.TreasuryDealers.Where(a => a.IsDeleted != true).ToList();
            return response;
        }


        public override async Task<TreasuryDto> Create(TreasuryDto input)
        {
            foreach (var item in input.TreasuryDealers)
            {
                if (item.IsDeleted  == null)
                    item.IsDeleted = false;
            }

                try
            {

                if ((input.TreasuryDealers == null || input.TreasuryDealers.Count() == 0) && input.DealerS.Count() > 0)
                {
                    input.TreasuryDealers = new List<TreasuryDealersDto>();
                    foreach (var item in input.DealerS)
                    {
                        input.TreasuryDealers.Add(new TreasuryDealersDto() { Date = DateTime.Now, Desc = "", IsDeleted = false, Id = 0, TreasuryDealerId = 0, TreasuryId = input.TreasuryId, UserId = item });
                    }
             //   this.UnitOfWork.TreasuryDealers.GetAsync("TreasuryDealerId == " + input)
                }
                var entity = Mapper.MapperObject.Mapper.Map<Treasury>(input);
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

                try
                {
                    if (typeof(TreasuryDto) == typeof(TreasuryDto))
                    {
                        var entitydto = Mapper.MapperObject.Mapper.Map<TreasuryDto>(newEntity);
                        UnitOfWork.Sp_Exchange_after_add_treasury(int.Parse(entitydto.Id.ToString()));
                    }
                    else
                    if (typeof(TreasuryDto) == typeof(CurrencyBaseDto))
                    {
                        var entitydto = Mapper.MapperObject.Mapper.Map<TreasuryDto>(newEntity);
                        UnitOfWork.Sp_Exchange_after_add_CurrencyBase(int.Parse(entitydto.Id.ToString()));
                    }
                }
                catch { }



                var response = Mapper.MapperObject.Mapper.Map<TreasuryDto>(newEntity);
                return response;
            }
            catch (System.Exception ex)
            {

                throw new System.Exception(AppMessages.InternalError + " :" + ex.Message.ToString());
            }

        }


    
        public override async Task<TreasuryDto> Update(TreasuryDto input)
        {

            try
            {
                if ((input.TreasuryDealers == null || input.TreasuryDealers.Count() == 0) && input.DealerS.Count() > 0)
                {
                    input.TreasuryDealers = new List<TreasuryDealersDto>();
                    foreach (var item in input.DealerS)
                    {
                        var ItemData = await this.UnitOfWork.TreasuryDealers.GetAsync("UserId == " + item + " && TreasuryId == " + input.TreasuryId);
                        if (ItemData.Count>0)
                        {
                            input.TreasuryDealers.Add(Mapper.MapperObject.Mapper.Map<TreasuryDealersDto>(ItemData[0]));
                        }
                        else
                            input.TreasuryDealers.Add(new TreasuryDealersDto() { Date = DateTime.Now, Desc = "", IsDeleted = false, Id = 0, TreasuryDealerId = 0, TreasuryId = input.TreasuryId, UserId = item });
                    }
                    //deleted
                    var AllDataItemsDto = Mapper.MapperObject.Mapper.Map<List<TreasuryDealersDto>>(await this.UnitOfWork.TreasuryDealers.GetAsync("TreasuryId == " + input.TreasuryId));
                    foreach (var item in AllDataItemsDto)
                    {
                        if (input.TreasuryDealers.Where(a => a.TreasuryDealerId == item.TreasuryDealerId).Count() == 0)
                        { 
                            item.IsDeleted = true;
                            input.TreasuryDealers.Add(item);
                        }

                    }
                    //   this.UnitOfWork.TreasuryDealers.GetAsync("TreasuryDealerId == " + input)
                }

                var entity = await Repository.GetByIdLightAsync(input.Id);

                if (entity == null)
                    throw new System.Exception(AppMessages.RecordNotExisted);

                UnitOfWork.BeginTran();
                await TrackingUpdate(entity, input);



                input = await BeforeUpdate(entity, input);

                Mapper.MapperObject.Mapper.Map(input, entity, typeof(TreasuryDto), typeof(Treasury));

                await OnUpdating(entity, input);

                await UnitOfWork.CompleteAsync();

                await OnUpdated(entity, input);

                UnitOfWork.CommitTran();


                var result = await Repository.GetByIdAsync(input.Id);

                var response = Mapper.MapperObject.Mapper.Map<TreasuryDto>(result);


                return response;
            }
            catch (System.Exception ex)
            {
                UnitOfWork.RollbackTran();

                throw new System.Exception(AppMessages.InternalError + " :" + ex.Message.ToString());

            }
        }

    }
}

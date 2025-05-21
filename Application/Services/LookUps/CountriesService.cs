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
    public class CountriesService : BaseService<ExCountry, ExCountryDto, ExCountryDto, ExCountryDto, ExCountryDto>, ICountriesService
    {
       // private readonly DynamoSession session;

        public CountriesService(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
            
            //this.session = session;
        }

        public override async Task<ExCountryDto> GetById(long id)
        {
            var response = await base.GetById(id);
            return response;
        }

        public override async Task<ExCountryDto> Create(ExCountryDto input)
        {


            try
            {
  
                var cheh_dup = await UnitOfWork.ExCountry.GetAsync("CountryNameEn == \"" + input.CountryNameEn + "\" || CountryNameAr == \"" + input.CountryNameAr + "\" ");

                if (cheh_dup.Count > 0)
                {
                    throw new System.Exception("this Country name exists");
                }

                var entity = Mapper.MapperObject.Mapper.Map<ExCountry>(input);


                var x = 0;
                try
                { x = (await UnitOfWork.ExCountry.GetAllAsync_withDeleted()).Max(a => a.CountryId); }
                catch { }

                entity.CountryId = x + 1;



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

                var response = Mapper.MapperObject.Mapper.Map<ExCountryDto>(newEntity);
                return response;
            }
            catch (System.Exception ex)
            {

                throw;
            }
            return null;
        }



        //protected async override Task<bool> OnCreated(Countries entity, CountriesDto dto)
        //{
        //    await this.attachmentService.Save(entity.Id, AttachmentTypeEnum.Countries, dto.Attachments, true);

        //    return await base.OnCreated(entity, dto);
        //}

        //protected async override Task<bool> OnUpdated(Countries entity, CountriesDto dto)
        //{
        //    await this.attachmentService.Save(entity.Id, AttachmentTypeEnum.Countries, dto.Attachments, false);

        //    return await base.OnUpdated(entity, dto);
        //}

        //public virtual async Task<PagingResultDto<CountriesDto>> GetActiveCountriessPaging(ActiveCountriesPagingInputDto pagingInputDto)
        //{
        //    var result = await Repository.GetAllPagingAsync(new PagingInputDto());

        //    var list = Mapper.MapperObject.Mapper.Map<IList<CountriesInfoDto>>(result.Item1);

        //    var response = new PagingResultDto<CountriesInfoDto>
        //    {
        //        Result = list,
        //        Total = result.Item2
        //    };

        //    foreach (var item in response.Result)
        //    {
        //        item.Attachments = await attachmentService.GetAttachments(item.Id, AttachmentTypeEnum.Countries);
        //    }

        //    return response;
        //}


    }
}

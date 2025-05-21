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
    public class IdentitySourcesService : BaseService<ExIdsource, ExIdsourceDto, ExIdsourceDto, ExIdsourceDto, ExIdsourceDto>, IIdentitySourcesService
    {

        public IdentitySourcesService(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }

        public override async Task<ExIdsourceDto> GetById(long id)
        {
            var response = await base.GetById(id);
            return response;
        }



        public virtual async Task<IList<ExIdsourceDto>> GetByCountryid(int Countryid)
        {
            var list = (await Repository.GetAllAsync()).Where(a => a.CountryId == Countryid);
          
            var result = Mapper.MapperObject.Mapper.Map<IList<ExIdsourceDto>>(list);

            return result;
        }



        public override async Task<ExIdsourceDto> Create(ExIdsourceDto input)
        {


            try
            {
                var cheh_dup = await UnitOfWork.ExIdsource.GetAsync("IdsourceNameEn == \"" + input.IdsourceNameEn + "\" || IdsourceNameAr == \"" + input.IdsourceNameAr + "\" ");

                if (cheh_dup.Count > 0)
                {
                    throw new System.Exception("this ID source name exists");
                }


                var entity = Mapper.MapperObject.Mapper.Map<ExIdsource>(input);

                var x = 0;
                try
                { x = (await UnitOfWork.ExIdsource.GetAllAsync_withDeleted()).Max(a => a.IdsourceId); }
                catch { }
                entity.IdsourceId =x+ 1;

                if (entity is null)
                {
                    throw new System.Exception(AppMessages.InternalError);
                }

                await OnCreating(entity, input);


                UnitOfWork.BeginTran();
              

                var newEntity = await UnitOfWork.ExIdsource.AddAsync(entity);

                await UnitOfWork.CompleteAsync();

                await OnCreated(newEntity, input);

                UnitOfWork.CommitTran();

                var response = Mapper.MapperObject.Mapper.Map<ExIdsourceDto>(newEntity);
                return response;
            }
            catch (System.Exception ex)
            {

                throw;
            }
            return null;
        }


        public async Task<string> GetCountryName(int countryId)
        {
            try
            {
                var entity = await UnitOfWork.ExCountry.GetByIdAsync(countryId);
                return entity.CountryNameAr;
            }
            catch { }
            return "";
        }

        //protected async override Task<bool> OnCreated(IdentitySources entity, IdentitySourcesDto dto)
        //{
        //    await this.attachmentService.Save(entity.Id, AttachmentTypeEnum.IdentitySources, dto.Attachments, true);

        //    return await base.OnCreated(entity, dto);
        //}

        //protected async override Task<bool> OnUpdated(IdentitySources entity, IdentitySourcesDto dto)
        //{
        //    await this.attachmentService.Save(entity.Id, AttachmentTypeEnum.IdentitySources, dto.Attachments, false);

        //    return await base.OnUpdated(entity, dto);
        //}

        //public virtual async Task<PagingResultDto<IdentitySourcesDto>> GetActiveIdentitySourcessPaging(ActiveIdentitySourcesPagingInputDto pagingInputDto)
        //{
        //    var result = await Repository.GetAllPagingAsync(new PagingInputDto());

        //    var list = Mapper.MapperObject.Mapper.Map<IList<IdentitySourcesInfoDto>>(result.Item1);

        //    var response = new PagingResultDto<IdentitySourcesInfoDto>
        //    {
        //        Result = list,
        //        Total = result.Item2
        //    };

        //    foreach (var item in response.Result)
        //    {
        //        item.Attachments = await attachmentService.GetAttachments(item.Id, AttachmentTypeEnum.IdentitySources);
        //    }

        //    return response;
        //}


    }
}

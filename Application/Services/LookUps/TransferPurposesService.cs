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
    public class TransferPurposesService : BaseService<ExExchangePurpose, ExExchangePurposeDto, ExExchangePurposeDto, ExExchangePurposeDto, ExExchangePurposeDto>, ITransferPurposesService
    {
     
        public TransferPurposesService(IUnitOfWork unitOfWork) : base(unitOfWork)
        {

        }

        public override async Task<ExExchangePurposeDto> GetById(long id)
        {
            var response = await base.GetById(id);
            return response;
        }


        public override async Task<ExExchangePurposeDto> Create(ExExchangePurposeDto input)
        {


            try
            {

                var cheh_dup = await UnitOfWork.ExExchangePurpose.GetAsync("ExchangePurposeNameEn == \"" + input.ExchangePurposeNameEn + "\" || ExchangePurposeNameAr == \"" + input.ExchangePurposeNameAr + "\" ");

                if (cheh_dup.Count > 0)
                {
                    throw new System.Exception("this  Exchange Purpose name exists");
                }

                var entity = Mapper.MapperObject.Mapper.Map<ExExchangePurpose>(input);

                var x = 0;
                try
                { x = (await UnitOfWork.ExExchangePurpose.GetAllAsync_withDeleted()).Max(a => a.ExchangePurposeId); }
                catch { }
                entity.ExchangePurposeId = x + 1;

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

                var response = Mapper.MapperObject.Mapper.Map<ExExchangePurposeDto>(newEntity);
                return response;
            }
            catch (System.Exception ex)
            {

                throw;
            }
            return null;
        }



        //protected async override Task<bool> OnCreated(TransferPurposes entity, TransferPurposesDto dto)
        //{
        //    await this.attachmentService.Save(entity.Id, AttachmentTypeEnum.TransferPurposes, dto.Attachments, true);

        //    return await base.OnCreated(entity, dto);
        //}

        //protected async override Task<bool> OnUpdated(TransferPurposes entity, TransferPurposesDto dto)
        //{
        //    await this.attachmentService.Save(entity.Id, AttachmentTypeEnum.TransferPurposes, dto.Attachments, false);

        //    return await base.OnUpdated(entity, dto);
        //}

        //public virtual async Task<PagingResultDto<TransferPurposesDto>> GetActiveTransferPurposessPaging(ActiveTransferPurposesPagingInputDto pagingInputDto)
        //{
        //    var result = await Repository.GetAllPagingAsync(new PagingInputDto());

        //    var list = Mapper.MapperObject.Mapper.Map<IList<TransferPurposesInfoDto>>(result.Item1);

        //    var response = new PagingResultDto<TransferPurposesInfoDto>
        //    {
        //        Result = list,
        //        Total = result.Item2
        //    };

        //    foreach (var item in response.Result)
        //    {
        //        item.Attachments = await attachmentService.GetAttachments(item.Id, AttachmentTypeEnum.TransferPurposes);
        //    }

        //    return response;
        //}


    }
}

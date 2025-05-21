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
using Core.Entities.Sec;
using Core.Other;
using Core.UnitOfWork;
using Infrastructure.Migrations;
using Infrastructure.UnitOfWork;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using static Google.Apis.Requests.BatchRequest;

namespace Application.Services.LookUps
{
    public class JobsService : BaseService<ExClientJob, ExClientJobDto, ExClientJobDto, ExClientJobDto, ExClientJobDto>, IJobsService
    {
        IService<ExClientJobSeverity, ExClientJobSeverityDto, ExClientJobSeverityDto, ExClientJobSeverityDto, ExClientJobSeverityDto> JobSeverityservice;
        public JobsService(IUnitOfWork unitOfWork, IService<ExClientJobSeverity, ExClientJobSeverityDto, ExClientJobSeverityDto, ExClientJobSeverityDto, ExClientJobSeverityDto> jobSeverityservice) : base(unitOfWork)
        {
            JobSeverityservice = jobSeverityservice;
        }

        public override async Task<ExClientJobDto> GetById(long id)
        {
            var response = await base.GetById(id);
            return response;
        }



        public override async Task<ExClientJobDto> Create(ExClientJobDto input)
        {


            try
            {
                var cheh_dup = await UnitOfWork.ExClientJob.GetAsync("JobName == \"" + input.JobName + "\" || JobNameEn == \"" + input.JobNameEn + "\" ");

                if (cheh_dup.Count > 0)
                {
                    throw new System.Exception("this  Job name exists");
                }
                var entity = Mapper.MapperObject.Mapper.Map<ExClientJob>(input);


                var x = 0;
                try
                { x = (await UnitOfWork.ExClientJob.GetAllAsync_withDeleted()).Max(a => a.JobId); }
                catch { }
                entity.JobId =  x+ 1;
                entity.JobCode = entity.JobId.ToString();
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

                var response = Mapper.MapperObject.Mapper.Map<ExClientJobDto>(newEntity);
                return response;
            }
            catch (System.Exception ex)
            {

                throw;
            }
            return null;
        }



        public  async Task<List<ExClientJobSeverityDto>> GetJobSeverity()
        {
            try
            {
                var JobSeverity = await JobSeverityservice.GetAll();
                var entityDto = Mapper.MapperObject.Mapper.Map<List<ExClientJobSeverityDto>>(JobSeverity);
                return entityDto;
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }

       

        //public async Task<bool> fill_Privilage()
        //  {

        //      this.UnitOfWork.Privilage.fill_Privilage();
        //      return true;
        //  }

        //protected async override Task<bool> OnUpdated(Jobs entity, JobsDto dto)
        //{
        //    await this.attachmentService.Save(entity.Id, AttachmentTypeEnum.Jobs, dto.Attachments, false);

        //    return await base.OnUpdated(entity, dto);
        //}

        //public virtual async Task<PagingResultDto<JobsDto>> GetActiveJobssPaging(ActiveJobsPagingInputDto pagingInputDto)
        //{
        //    var result = await Repository.GetAllPagingAsync(new PagingInputDto());

        //    var list = Mapper.MapperObject.Mapper.Map<IList<JobsInfoDto>>(result.Item1);

        //    var response = new PagingResultDto<JobsInfoDto>
        //    {
        //        Result = list,
        //        Total = result.Item2
        //    };

        //    foreach (var item in response.Result)
        //    {
        //        item.Attachments = await attachmentService.GetAttachments(item.Id, AttachmentTypeEnum.Jobs);
        //    }

        //    return response;
        //}


    }
}

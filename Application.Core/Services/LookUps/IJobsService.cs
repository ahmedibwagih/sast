using Application.Core.DTOs.LookUps;

using Core.DTOs;
using Core.Entities.LookUps;

namespace Application.Core.Services.LookUps
{
    public interface IJobsService :IService<ExClientJob, ExClientJobDto, ExClientJobDto, ExClientJobDto, ExClientJobDto>
    {
        //Task<bool> fill_Privilage();
        Task<List<ExClientJobSeverityDto>> GetJobSeverity();
    }
}

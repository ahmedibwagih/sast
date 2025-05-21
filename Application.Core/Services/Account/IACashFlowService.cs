using Application.Core.DTOs.Account;
using Application.Core.DTOs.Clients;
using Application.Core.DTOs.LookUps;

using Core.DTOs;
using Core.Entities.Account;
using Core.Entities.Clients;
using Core.Entities.LookUps;

namespace Application.Core.Services.Account
{
    public interface IACashFlowService : IService<ACashFlow, ACashFlowDto, ACashFlowDto, ACashFlowDto, ACashFlowDto>
    {
        Task<int> GetNextTrnNo(int brn);
    }
}

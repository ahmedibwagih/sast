using Application.Core.DTOs.Banks;
using Application.Core.DTOs.Clients;
using Application.Core.DTOs.LookUps;

using Core.DTOs;
using Core.Entities.banks;
using Core.Entities.Clients;
using Core.Entities.LookUps;

namespace Application.Core.Services.Client
{
    public interface IProveInOutCheckService : IService<ProveInOutCheck, ProveInOutCheckDto, ProveInOutCheckDto, ProveInOutCheckDto, ProveInOutCheckDto>
    {

    }
}

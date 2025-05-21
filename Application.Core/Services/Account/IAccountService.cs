using Application.Core.DTOs.Account;
using Application.Core.DTOs.Clients;
using Application.Core.DTOs.LookUps;

using Core.DTOs;
using Core.Entities.Account;
using Core.Entities.Clients;
using Core.Entities.LookUps;

namespace Application.Core.Services.Account
{
    public interface IAccountService : IService<AAccount, AAccountDto, AAccountDto, AAccountDto, AAccountDto>
    {

    }
}

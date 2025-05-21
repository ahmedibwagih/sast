using Application.Core.DTOs.LookUps;

using Core.DTOs;
using Core.Entities.LookUps;

namespace Application.Core.Services.LookUps
{
    public interface IIdentitySourcesService :IService<ExIdsource, ExIdsourceDto, ExIdsourceDto, ExIdsourceDto, ExIdsourceDto>
    {
        Task<IList<ExIdsourceDto>> GetByCountryid(int Countryid);
    }
}

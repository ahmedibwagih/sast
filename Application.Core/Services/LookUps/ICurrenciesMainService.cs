using Application.Core.DTOs.LookUps;

using Core.DTOs;
using Core.Entities.LookUps;

namespace Application.Core.Services.LookUps
{
    public interface ICurrenciesMainService :IService<Currency, CurrencyDto, CurrencyDto, CurrencyDto, CurrencyDto>
    {
        Task<bool> SetDefaultCurrency(long id);
        Task<CurrencyDto> GetDefaultCurrency();
        Task<IList<CurrencyDto>> GetByBranchid(int branchId);
    }
}

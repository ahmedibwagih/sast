using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;

using Core.DTOs;
using Core.DTOs.FinReports;
using Core.Entities.LookUps;
using Core.Other;

namespace Application.Core.Services.LookUps
{
    public interface IProcService : IService<ExBank, ExBankDto, ExBankDto, ExBankDto, ExBankDto>
    {
        Task<ExchangeResponse<List<Exchange_CurrenciesBalanceOutput>>> Sp_Exchange_CurrenciesBalance(Exchange_CurrenciesBalanceInput input);
        Task<ExchangeResponse<List<Exchange_MovementOutput>>> Sp_Exchange_Movement(Exchange_MovementInput input);
        Task<ExchangeResponse<List<Exchange_WholeMovementOutput>>> Sp_Exchange_WholeMovement(Exchange_WholeMovementInput input);
        Task<ExchangeResponse<List<Exchange_CurrencyMovementOutput>>> Sp_Exchange_CurrencyMovement(Exchange_CurrencyMovementInput input);
        Task<ExchangeResponse<List<ProfitOutput>>> Sp_Exchange_Profit(ProfitInput input);
        Task<ExchangeResponse<List<SalesBuysOutput>>> Sp_Exchange_SalesBuys(SalesBuysInput input);
        Task<ExchangeResponse<List<DialyKoyodOutput>>> Sp_Exchange_DialyKoyod(DialyKoyodInput input);
        Task<ExchangeResponse<List<TreasutyMonementOutput>>> Sp_Exchange_TreasutyMonement(TreasutyMonementInput input);
        Task<ExchangeResponse<List<KashfHesabOutput>>> Sp_Exchange_KashfHesab(KashfHesabInput input);
        Task<ExchangeResponse<AssetBalanceOutPut>> Sp_Exchange_AssetBalance(AssetBalanceInput input);
     Task<ExchangeResponse<List<Central_statmentOutPut>>> Sp_Exchange_Central_statment(Central_statmentInput input);

       Task<ExchangeResponse<List<Income_StOutPut>>> Sp_Exchange_Income_St(Income_StInput input);

        Task<ExchangeResponse<List<mezanOutPut>>> Sp_Exchange_mezan(mezanInput input);

       Task<ExchangeResponse<Kashf_TahlelyOutPut>> Sp_Exchange_Kashf_Tahlely(Kashf_TahlelyInput input);

        Task<ExchangeResponse<List<Income_StOutPut_compare>>> Sp_Exchange_Income_St_compare(Income_StInput_compare input);
        Task<ExchangeResponse<List<Central_statmentOutPut_compare>>> Sp_Exchange_Central_statment_compare(Central_statmentInput_compare input);

    }
}

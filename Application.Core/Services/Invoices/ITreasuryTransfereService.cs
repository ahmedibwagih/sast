using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.Taswya;
using Application.Core.DTOs.TreasuryTransfere;
using Application.Core.DTOs.TRN_Invoices;
using Application.Core.DTOs.TRN_Transfers;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.Taswya;
using Core.Entities.TreasuryTransfere;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;

namespace Application.Core.Services.LookUps
{
    public interface ITreasuryTransfereService : IService<ExTreasuryTransfere, ExTreasuryTransfereDto, ExTreasuryTransfereDto, ExTreasuryTransfereDto, ExTreasuryTransfereDto>
    {

        Task<int> GetNextTransferNo(int brn);
        Task<ExchangeResponse<List<ExBranchTransferTypeDto>>> GetTransferType();
         Task<ExchangeResponse<ExTreasuryTransfereDetailDto>> AddExTreasuryTransfereDetail(ExTreasuryTransfereDetailDto input);
        Task<bool> CreateCurrencyBvr(ExTreasuryTransfere entity);
    }
}

using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.TRN_Invoices;
using Application.Core.DTOs.TRN_Transfers;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;

namespace Application.Core.Services.LookUps
{
    public interface IExInternalTransferService : IService<ExInternalTransfer, ExInternalTransferDto, ExInternalTransferDto, ExInternalTransferDto, ExInternalTransferDto>
    {

        Task<int> GetNextTransferNo();
        Task<ExchangeResponse<List<ExBranchTransferTypeDto>>> GetTransferType();
         Task<ExchangeResponse<ExInternalTransfersDetailDto>> AddExInternalTransfersDetail(ExInternalTransfersDetailDto input);
    }
}

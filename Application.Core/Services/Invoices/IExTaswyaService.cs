using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.Taswya;
using Application.Core.DTOs.TRN_Invoices;
using Application.Core.DTOs.TRN_Transfers;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.Taswya;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;

namespace Application.Core.Services.LookUps
{
    public interface IExTaswyaService : IService<ExTaswya, ExTaswyaDto, ExTaswyaDto, ExTaswyaDto, ExTaswyaDto>
    {

        Task<int> GetNextTransferNo(int brn);
        Task<ExchangeResponse<List<ExBranchTransferTypeDto>>> GetTransferType();
         Task<ExchangeResponse<ExTaswyaDetailDto>> AddExTaswyaDetail(ExTaswyaDetailDto input);
    }
}

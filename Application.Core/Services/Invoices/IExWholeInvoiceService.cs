using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.TRN_WholeInvoices;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.TreasuryTransfere;
using Core.Entities.TRN_WholeInvoices;

namespace Application.Core.Services.LookUps
{
    public interface IExWholeInvoiceService : IService<ExWholeInvoice, ExWholeInvoiceDto, ExWholeInvoiceDto, ExWholeInvoiceDto, ExWholeInvoiceDto>
    {
        Task<ExchangeResponse<List<ExWholeInvoiceStatusDto>>> GetWholeInvoiceStatus();
        Task<ExchangeResponse<List<ExWholePaymentMethodDto>>> GetWholePaymentMethod();
        Task<int> GetNextInvoiceNo(int brn);
        Task<bool> CreateCurrencyBvr(ExWholeInvoice entity);
    }
}

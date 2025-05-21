using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.TRN_Invoices;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.TRN_Invoices;

namespace Application.Core.Services.LookUps
{
    public interface IExInvoiceService : IService<ExInvoice, ExInvoiceDto, ExInvoiceDto, ExInvoiceDto, ExInvoiceDto>
    {
        Task<ExchangeResponse<List<ExFormingStatusDto>>> GetInvoiceFormingStatus();
        Task<ExchangeResponse<List<ExPaymentMethodDto>>> GetInvoicePaymentMethod();
        Task<ExchangeResponse<List<ExInvoicesTypeDto>>> GetInvoiceType();
        Task<ExchangeResponse<List<ExInvoiceStatusDto>>> GetInvoiceStatus();
        Task<int> GetNextInvoiceNo(int brn);
        Task<bool> CreateCurrencyBvr(ExInvoice entity);
    }
}

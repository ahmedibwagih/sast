using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.Sec;
using Application.Core.DTOs.WorkFlow;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.Sec;
using Core.Entities.TRN_WholeInvoices;

namespace Application.Core.Services.LookUps
{
    public interface ITrackingDataService : IService<TrackingData, TrackingDataDto, TrackingDataDto, TrackingDataDto, TrackingDataDto>
    {


        Task<ExchangeResponse<List<CurrencyChangesDto>>> GetCurrencyChanges(DateTime from, DateTime to, int userid);
        }
}

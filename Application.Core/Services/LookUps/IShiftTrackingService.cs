using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;

using Core.DTOs;
using Core.Entities.LookUps;

namespace Application.Core.Services.LookUps
{
    public interface IShiftTrackingService : IService<ShiftTracking, ShiftTrackingDto, ShiftTrackingDto, ShiftTrackingDto, ShiftTrackingDto>
    {
        Task<ExchangeResponse<result1Dto>> GetLastTreasuryUser(int treasuryId);
        Task<ExchangeResponse<List<result2Dto>>> GetTreasuryBalances(int treasuryId);
        Task<ExchangeResponse<List<ShiftTrackingDto>>> SaveShiftTracking(ShiftTrackingSaveInput input);
        Task<ExchangeResponse<List<ShiftTrackingDto>>> GetAllShiftTracking(GetAllShiftTrackingInput input);
    }
}

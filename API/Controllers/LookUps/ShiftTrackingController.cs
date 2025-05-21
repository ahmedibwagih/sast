using System.Threading.Tasks;
using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;

using Application.Core.Services;
using Application.Core.Services.LookUps;
using Application.Services;
using Application.Services.LookUps;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Other;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers.LookUps
{
    [Route("api/[controller]")]
    [ApiController]
    public class ShiftTrackingController : ControllerBase
    {

        private readonly IShiftTrackingService service;

        public ShiftTrackingController(IShiftTrackingService service)
        {
            this.service = service;
        }

       // [Authorize]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<PagingResultDto<ShiftTrackingDto>> GetAll([FromQuery] PagingInputDto pagingInputDto)
        {
            return await service.GetAllPaging(pagingInputDto);
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ShiftTrackingDto> Get(long id)
        {
            return await service.GetById(id);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ActionResult<ShiftTrackingDto>> Create([FromBody] ShiftTrackingDto input)
        {
            return await service.Create(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task Update([FromBody] ShiftTrackingDto input)
        {
            await service.Update(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task Delete(long id)
        {
            await service.Delete(id);
        }


        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<result1Dto>> GetLastTreasuryUser(int treasuryId)
        {
            return await service.GetLastTreasuryUser(treasuryId);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<result2Dto>>> GetTreasuryBalances(int treasuryId)
        {
            return await service.GetTreasuryBalances(treasuryId);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<ShiftTrackingDto>>> SaveShiftTracking(ShiftTrackingSaveInput input)
        {
            return await service.SaveShiftTracking(input);
        }

    }
}

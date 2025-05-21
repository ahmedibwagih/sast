using System.Threading.Tasks;

using Application.Core.DTOs.LookUps;

using Application.Core.Services;
using Application.Core.Services.LookUps;
using Application.Services;
using Application.Services.LookUps;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Other;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers.LookUps
{
    [Route("api/[controller]")]
    [ApiController]
    public class TransferPurposes : ControllerBase
    {
        
        private readonly ITransferPurposesService service;

        public TransferPurposes(ITransferPurposesService service)
        {
            this.service = service;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<PagingResultDto<ExExchangePurposeDto>> GetAll([FromQuery] PagingInputDto pagingInputDto)
        {
            return await service.GetAllPaging(pagingInputDto);
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExExchangePurposeDto> Get(long id)
        {
            return await service.GetById(id);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ActionResult<ExExchangePurposeDto>> Create([FromBody] ExExchangePurposeDto input)
        {
            return await service.Create(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task Update([FromBody] ExExchangePurposeDto input)
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

    }
}

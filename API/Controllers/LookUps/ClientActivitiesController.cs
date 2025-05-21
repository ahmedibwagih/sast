using System.Threading.Tasks;

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
    public class ClientActivitiesController : ControllerBase
    {

        private readonly IClientActivitiesService service;

        public ClientActivitiesController(IClientActivitiesService service)
        {
            this.service = service;
        }

       // [Authorize]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<PagingResultDto<ClientActivitiesDto>> GetAll([FromQuery] PagingInputDto pagingInputDto)
        {
            return await service.GetAllPaging(pagingInputDto);
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ClientActivitiesDto> Get(long id)
        {
            return await service.GetById(id);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ActionResult<ClientActivitiesDto>> Create([FromBody] ClientActivitiesDto input)
        {
            return await service.Create(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task Update([FromBody] ClientActivitiesDto input)
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

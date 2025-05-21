using System.Threading.Tasks;
using Application.Core.DTOs.Clients;
using Application.Core.DTOs.LookUps;

using Application.Core.Services;
using Application.Core.Services.Client;
using Application.Core.Services.LookUps;
using Application.Services;
using Application.Services.LookUps;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Other;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers.Client
{
    [Route("api/[controller]")]
    [ApiController]
    public class SuppliersController : ControllerBase
    {

        private readonly IExSupplierService service;

        public SuppliersController(IExSupplierService service)
        {
            this.service = service;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<PagingResultDto<ClientOrSuppliersDto>> GetAll([FromQuery] PagingInputDto pagingInputDto)
        {
            if (pagingInputDto.Filter != null)
                pagingInputDto.Filter = pagingInputDto.Filter.Trim();
            return await service.GetAllPaging(pagingInputDto);
        }






        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ClientOrSuppliersDto> Get(long id)
        {
            return await service.GetById(id);
        }






        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<List<ExSuppliersTypeDto>> GetSuppliersType()
        {
            return await service.GetSuppliersType();
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ActionResult<ClientOrSuppliersDto>> Create([FromBody] ClientOrSuppliersDto input)
        {
            var result = await service.Create(input);
           // await service.fill_Privilage();
            return result;
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ClientOrSuppliersDto> Update([FromBody] ClientOrSuppliersDto input)
        {
           return await service.Update(input);
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

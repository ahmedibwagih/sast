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
    public class ClientController : ControllerBase
    {

        private readonly IExClientService service;

        public ClientController(IExClientService service)
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
        public async Task<ClientSecDto> CheckSecurityFile([FromQuery] string name)
        {
            return await service.CheckSecurityFile(name);
        }


        //[HttpGet]
        //[ProducesResponseType(StatusCodes.Status200OK)]
        //[Route("[action]")]
        //public async Task<List<ExClientJobSeverityDto>> GetJobSeverity()
        //{
        //    return await service.GetJobSeverity();
        //}


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
        public async Task<List<ExAttachmentTypeDto>> GetExAttachmentType()
        {
            return await service.GetExAttachmentType();
        }


        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<List<ExClientsTypeDto>> GetExClientsType()
        {
            return await service.GetExClientsType();
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

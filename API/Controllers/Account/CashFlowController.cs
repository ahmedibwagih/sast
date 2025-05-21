using System.Threading.Tasks;
using Application.Core.DTOs;
using Application.Core.DTOs.Account;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.TRN_Invoices;
using Application.Core.Services;
using Application.Core.Services.Account;
using Application.Core.Services.LookUps;
using Application.Services;
using Application.Services.LookUps;
using Core.DTOs;
using Core.Entities.Account;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Other;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers.LookUps
{
    [Route("api/[controller]")]
    [ApiController]
    public class CashFlowController : ControllerBase
    {

        private readonly IACashFlowService Service;
        IService<ACashFlowStatus, ACashFlowStatusDto, ACashFlowStatusDto, ACashFlowStatusDto, ACashFlowStatusDto> ACashFlowStatuservice;
        IService<ACashFlowType, ACashFlowTypeDto, ACashFlowTypeDto, ACashFlowTypeDto, ACashFlowTypeDto> ACashFlowTypeService;

        public CashFlowController(IACashFlowService service,
            IService<ACashFlowStatus, ACashFlowStatusDto, ACashFlowStatusDto, ACashFlowStatusDto, ACashFlowStatusDto> aCashFlowStatuservice,
            IService<ACashFlowType, ACashFlowTypeDto, ACashFlowTypeDto, ACashFlowTypeDto, ACashFlowTypeDto> aCashFlowTypeService
            )
        {
            this.Service = service;
         
            ACashFlowStatuservice = aCashFlowStatuservice;
            ACashFlowTypeService = aCashFlowTypeService;
        }





        // [Authorize]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<IList<ACashFlowStatusDto>>> GetACashFlowStatus()
        {
            return await ACashFlowStatuservice.GetAll_ExResponse();
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<IList<ACashFlowTypeDto>>> GetACashFlowType()
        {
            return await ACashFlowTypeService.GetAll_ExResponse();
        }



        // [Authorize]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<PagingResultDto<ACashFlowDto>>> GetAll([FromQuery] PagingInputDto pagingInputDto)
        {
            return await Service.GetAllPaging_ExResponse(pagingInputDto);
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<ACashFlowDto>> Get(long id)
        {
            return await Service.GetById_ExResponse(id);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<ACashFlowDto>> Create([FromBody] ACashFlowDto input)
        {
            return await Service.Create_ExResponse(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<ACashFlowDto>> Update([FromBody] ACashFlowDto input)
        {
          return  await Service.Update_ExResponse(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task Delete(long id)
        {
            await Service.DeleteTrn(id);
        }      
        
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<int> GetNextTrnNo(int brn)
        {
          return  await Service.GetNextTrnNo(brn);
        }

    }
}

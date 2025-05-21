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
using Core.Entities.LookUps;
using Core.Other;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers.LookUps
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountTreeController : ControllerBase
    {

        private readonly IAccountService service;

        public AccountTreeController(IAccountService service)
        {
            this.service = service;
        }

   



        // [Authorize]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<PagingResultDto<AAccountDto>>> GetAll([FromQuery] PagingInputDto pagingInputDto)
        {
            return await service.GetAllPaging_ExResponse(pagingInputDto);
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<AAccountDto>> Get(long id)
        {
            return await service.GetById_ExResponse(id);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<AAccountDto>> Create([FromBody] AAccountDto input)
        {
            return await service.Create_ExResponse(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<AAccountDto>> Update([FromBody] AAccountDto input)
        {
            if (input.AccountName.Contains(@">"))
                input.AccountName = input.AccountName.Split('>')[1];
          return  await service.Update_ExResponse(input);
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

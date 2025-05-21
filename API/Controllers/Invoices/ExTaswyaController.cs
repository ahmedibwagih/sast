using System.Threading.Tasks;
using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.Taswya;
using Application.Core.DTOs.TRN_Invoices;
using Application.Core.DTOs.TRN_Transfers;
using Application.Core.Services;
using Application.Core.Services.LookUps;
using Application.Services;
using Application.Services.LookUps;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.Taswya;
using Core.Other;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers.LookUps
{
    [Route("api/[controller]")]
    [ApiController]
    public class ExTaswyaController : ControllerBase
    {

        private readonly IExTaswyaService service;
        private readonly IService<ExTaswyaDetail, ExTaswyaDetailDto, ExTaswyaDetailDto, ExTaswyaDetailDto, ExTaswyaDetailDto> ExTaswyaDetailService;

        public ExTaswyaController(IExTaswyaService service, IService<ExTaswyaDetail, ExTaswyaDetailDto, ExTaswyaDetailDto, ExTaswyaDetailDto, ExTaswyaDetailDto> exTaswyaDetailService)
        {
            this.service = service;
            this.ExTaswyaDetailService = exTaswyaDetailService;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<int> GetNextNo(int branchCode)
        {
            return await service.GetNextTransferNo( branchCode);
        }
       

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<ExTaswyaDetailDto>> AddExTaswyaDetail(ExTaswyaDetailDto input)
        {
            return await service.AddExTaswyaDetail(input);
        }


        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<ExBranchTransferTypeDto>>> GetTransferType()
        {
            return await service.GetTransferType();
        }

        // [Authorize]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<PagingResultDto<ExTaswyaDto>>> GetAll([FromQuery] PagingInputDto pagingInputDto)
        {
            return await service.GetAllPaging_ExResponse(pagingInputDto);
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<ExTaswyaDto>> Get(long id)
        {
            return await service.GetById_ExResponse(id);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<ExTaswyaDto>> Create([FromBody] ExTaswyaDto input)
        {input.IsPendingWorkflow = false;
            input.UserId = int.Parse(User.Claims.FirstOrDefault(c => c.Type == "UserId").Value.ToString());
            return await service.Create_ExResponse(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<ExTaswyaDto>> Update([FromBody] ExTaswyaDto input)
        {
          return  await service.Update_ExResponse(input);
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
        public async Task DeleteDetails(long id)
        {
            await ExTaswyaDetailService.DeleteTrn(id);
        }

    }
}

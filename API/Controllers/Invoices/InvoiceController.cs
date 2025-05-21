using System.Threading.Tasks;
using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.TRN_Invoices;
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
    public class InvoiceController : ControllerBase
    {

        private readonly IExInvoiceService service;

        public InvoiceController(IExInvoiceService service)
        {
            this.service = service;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<int> GetNextInvoiceNo(int branchCode)
        {
            return await service.GetNextInvoiceNo(branchCode);
        }


        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<ExInvoiceStatusDto>>> GetInvoiceStatus()
        {
            return await service.GetInvoiceStatus();
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<ExInvoicesTypeDto>>> GetInvoiceType()
        {
            return await service.GetInvoiceType();
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<ExPaymentMethodDto>>> GetInvoicePaymentMethod()
        {
            return await service.GetInvoicePaymentMethod();
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<ExFormingStatusDto>>> GetInvoiceFormingStatus()
        {
            return await service.GetInvoiceFormingStatus();
        }


        // [Authorize]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<PagingResultDto<ExInvoiceDto>>> GetAll([FromQuery] PagingInputDto pagingInputDto)
        {
            return await service.GetAllPaging_ExResponse(pagingInputDto);
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<ExInvoiceDto>> Get(long id)
        {
            return await service.GetById_ExResponse(id);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<ExInvoiceDto>> Create([FromBody] ExInvoiceDto input)
        {
            //input.IsPendingWorkflow = false;
           //input.InvoiceDate = DateTime.Now;
           //input.InvoiceTime = DateTime.Now;

            input.UserId= int.Parse(User.Claims.FirstOrDefault(c => c.Type == "UserId").Value.ToString());
            return await service.Create_ExResponse(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<ExInvoiceDto>> Update([FromBody] ExInvoiceDto input)
        {
            //input.InvoiceDate = DateTime.Now;
            //input.InvoiceTime = DateTime.Now;
            return  await service.Update_ExResponse(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task Delete(long id)
        {
            await service.DeleteTrn(id);
        }

    }
}

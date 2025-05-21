using System.Threading.Tasks;
using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.TRN_Invoices;
using Application.Core.DTOs.TRN_WholeInvoices;
using Application.Core.Services;
using Application.Core.Services.LookUps;
using Application.Services;
using Application.Services.LookUps;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.TRN_WholeInvoices;
using Core.Other;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers.LookUps
{
    [Route("api/[controller]")]
    [ApiController]
    public class ExWholeInvoiceController : ControllerBase
    {

        private readonly IExWholeInvoiceService service;

        public ExWholeInvoiceController(IExWholeInvoiceService service)
        {
            this.service = service;
        }
        
           

            [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<ExWholePaymentMethodDto>>> GetWholePaymentMethod()
        {
            return await service.GetWholePaymentMethod();
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
        public async Task<ExchangeResponse<List<ExWholeInvoiceStatusDto>>> GetWholeInvoiceStatus()
        {
            return await service.GetWholeInvoiceStatus();
        }




        // [Authorize]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<PagingResultDto<ExWholeInvoiceDto>>> GetAll([FromQuery] PagingInputDto pagingInputDto)
        {
            return await service.GetAllPaging_ExResponse(pagingInputDto);
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<ExWholeInvoiceDto>> Get(long id)
        {
            return await service.GetById_ExResponse(id);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<ExWholeInvoiceDto>> Create([FromBody] ExWholeInvoiceDto input)
        {
            //input.InvoiceDate = DateTime.Now;
            //input.InvoiceTime = DateTime.Now;
            // input.IsPendingWorkflow = false;
            input.UserId = int.Parse(User.Claims.FirstOrDefault(c => c.Type == "UserId").Value.ToString());
            return await service.Create_ExResponse(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<ExWholeInvoiceDto>> Update([FromBody] ExWholeInvoiceDto input)
        {
            //input.InvoiceDate = DateTime.Now;
            //input.InvoiceTime = DateTime.Now;
            return await service.Update_ExResponse(input);
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

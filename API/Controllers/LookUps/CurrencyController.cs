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
    public class CurrencyController : ControllerBase
    {

        private readonly ICurrenciesMainService service;

        public CurrencyController(ICurrenciesMainService service)
        {
            this.service = service;
        }

        //[HttpPost]
        //[ProducesResponseType(StatusCodes.Status200OK)]
        //[Route("[action]")]
        //public async Task<PagingResultDto<CurrencyDto>> GetByBranchid(int branchId)
        //{
        //    PagingInputDto pagingInputDto = new PagingInputDto() {OrderType="asc",OrderByField= "CurrencyCode",HiddenFilter = "BranchID == " + branchId.ToString() };
        //    var result = await service.GetAllPaging(pagingInputDto);
        //    result.Result = result.Result.Where(a=>a.BranchID == branchId).ToList();
        //    return result;
        //    // return await service.GetByBranchid(branchId);
        //}


        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<IList<CurrencyDto>> GetByBranchid(int branchId)
        {
            return await service.GetByBranchid(branchId);
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<PagingResultDto<CurrencyDto>> GetAll([FromQuery] PagingInputDto pagingInputDto)
        {
            return await service.GetAllPaging(pagingInputDto);
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<CurrencyDto> Get(long id)
        {
            return await service.GetById(id);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ActionResult<CurrencyDto>> Create([FromBody] CurrencyDto input)
        {
            return await service.Create(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task Update([FromBody] CurrencyDto input)
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
        public async Task<bool> SetDefaultCurrency( long id)
        {
           return await service.SetDefaultCurrency(id);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<CurrencyDto> GetDefaultCurrency()
        {
            return await service.GetDefaultCurrency();
        }   
        
    

        

    }
}

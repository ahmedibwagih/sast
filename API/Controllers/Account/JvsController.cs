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
using Core.Entities.others;
using Core.Other;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers.LookUps
{
    [Route("api/[controller]")]
    [ApiController]
    public class JvsController : ControllerBase
    {

        private readonly IJvsService Jvsservice;
        IService<AJvstatus, AJvstatusDto, AJvstatusDto, AJvstatusDto, AJvstatusDto> AJvstatuservice;
        IService<AJvtype, AJvtypeDto, AJvtypeDto, AJvtypeDto, AJvtypeDto> AJvtypeService;

        public JvsController(IJvsService service,
            IService<AJvstatus, AJvstatusDto, AJvstatusDto, AJvstatusDto, AJvstatusDto> aJvstatuservice,
            IService<AJvtype, AJvtypeDto, AJvtypeDto, AJvtypeDto, AJvtypeDto> aJvtypeService
            )
        {
            this.Jvsservice = service;
         
            AJvstatuservice = aJvstatuservice;
            AJvtypeService = aJvtypeService;
        }





        // [Authorize]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<IList<AJvstatusDto>>> GetAJvstatus()
        {
            return await AJvstatuservice.GetAll_ExResponse();
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<IList<AJvtypeDto>>> GetAJvType()
        {
            return await AJvtypeService.GetAll_ExResponse();
        }



        // [Authorize]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<PagingResultDto<AJvDto>>> GetAll([FromQuery] PagingInputDto pagingInputDto)
        {
            return await Jvsservice.GetAllPaging_ExResponse(pagingInputDto);
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<AJvDto>> Get(long id)
        {
            return await Jvsservice.GetById_ExResponse(id);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<AJvDto>> Create([FromBody] AJvDto input)
        {
            input.UserId = int.Parse(User.Claims.FirstOrDefault(c => c.Type == "UserId").Value.ToString());
            return await Jvsservice.Create_ExResponse(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<AJvDto>> Update([FromBody] AJvDto input)
        {
          return  await Jvsservice.Update_ExResponse(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task Delete(long id)
        {
            await Jvsservice.Delete(id);
        }      
        
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<int> GetNextTrnNo(int brn)
        {
          return  await Jvsservice.GetNextTrnNo(brn);
        }


        //traans JVT
        //عرض ااقيود الغير مرحله
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<PagingResultDto<AJvDto>>> GetAllUnMovedJvt(int branchid ,DateTime from ,DateTime to , int jVTypeId)
        {
            return await Jvsservice.GetAllPaging_ExResponse(new PagingInputDto());
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<PagingResultDto<AJvDto>>> MoveJvt(List<AJvDto> AJVList)
        {
            return await Jvsservice.GetAllPaging_ExResponse(new PagingInputDto());
        }
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<List<AJvAccountSettingDto>> GetStaticAccount()
        {
            return await Jvsservice.GetStaticAccount();
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<bool> UpdateStaticAccount(String AccountName, int accountId)
        {
            return await Jvsservice.UpdateStaticAccount(AccountName, accountId);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<bool> UpdateSupplierAccount(string type, int entityid, int accountId)
        {
            return await Jvsservice.UpdateSupplierAccount( entityid, accountId);
        }


        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<bool> UpdatebankAccount( int entityid, int accountId)
        {
            return await Jvsservice.UpdatebankAccount(entityid, accountId);
        }

       [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<bool> UpdatebankAccount_forbankaccount(int entityid, int accountId)
        {
            return await Jvsservice.UpdatebankAccount_forbankaccount(entityid, accountId);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<bool> UpdateTreasuryAccount(int entityid, int accountId)
        {
            return await Jvsservice.UpdateTreasuryAccount(entityid, accountId);
        }


        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<UserActionsInputResult>>> GetUserActions(UserActionsInputDto input)
        {
            // return new ExchangeResponse<IList<UserActionsInputResult>>() {Error_Desc="",Notes="",Result= null,Status=ResponseEnum.Ok  } ;
            return await Jvsservice.GetUserActions(input);
        }


    }
}

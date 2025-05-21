using System.Threading.Tasks;
using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;

using Application.Core.Services;
using Application.Core.Services.LookUps;
using Application.Services;
using Application.Services.LookUps;
using Core.DTOs;
using Core.DTOs.FinReports;
using Core.Entities.LookUps;
using Core.Other;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers.LookUps
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReportsController : ControllerBase
    {

        private readonly IProcService Service;
        private readonly ITrackingDataService TrackService;
        private readonly IShiftTrackingService ShiftTracking;

        public ReportsController(IProcService service, ITrackingDataService trackService, IShiftTrackingService shiftTracking)
        {
            this.Service = service;
            this.TrackService = trackService;
            ShiftTracking = shiftTracking;
        }

        // [Authorize]
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<CurrencyChangesDto>>> Get_CurrencyChanges(DateTime from ,DateTime to)
        {
          int  CurrentUserId = int.Parse(User.Claims.FirstOrDefault(c => c.Type == "UserId").Value.ToString());
            return await this.TrackService.GetCurrencyChanges(from, to, CurrentUserId);
           // List < CurrencyChangesDto >  nn = new List < CurrencyChangesDto >();
           // nn.Add(new CurrencyChangesDto() {BuyPriceAfter=0,BuyPriceBefore=0,date=DateTime.Now,SalePriceAfter=0,SalePriceBefore=1,userid=2244 });
           //  ExchangeResponse<List<CurrencyChangesDto>> hh = new ExchangeResponse<List<CurrencyChangesDto>>();
           //hh.Result = nn;
           // hh.Status = ResponseEnum.Ok;
           // return hh ;
        }




        // [Authorize]
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<Exchange_CurrenciesBalanceOutput>>> Sp_Exchange_CurrenciesBalance(Exchange_CurrenciesBalanceInput input)
        {
            return await Service.Sp_Exchange_CurrenciesBalance(input);
        }

        // [Authorize]
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<Exchange_MovementOutput>>> Sp_Exchange_Movement(Exchange_MovementInput input)
        {
            return await Service.Sp_Exchange_Movement(input);
        }        
        
        // [Authorize]
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<Exchange_WholeMovementOutput>>> Sp_Exchange_WholeMovement(Exchange_WholeMovementInput input)
        {
            return await Service.Sp_Exchange_WholeMovement(input);
        }        
        
        // [Authorize]
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<Exchange_CurrencyMovementOutput>>> Sp_Exchange_CurrencyMovement(Exchange_CurrencyMovementInput input)
        {
            return await Service.Sp_Exchange_CurrencyMovement(input);
        }


        ////////////////////////
        ///

        // [Authorize]
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<AssetBalanceOutPut>> AssetBalance(AssetBalanceInput input)
        {
            return await Service.Sp_Exchange_AssetBalance(input);
        }

        // [Authorize]
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<DialyKoyodOutput>>> DialyKoyod(DialyKoyodInput input)
        {
            return await Service.Sp_Exchange_DialyKoyod(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<KashfHesabOutput>>> KashfHesab(KashfHesabInput input)
        {
            return await Service.Sp_Exchange_KashfHesab(input);
        }


        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<ProfitOutput>>> Profit(ProfitInput input)
        {
            return await Service.Sp_Exchange_Profit(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<SalesBuysOutput>>> SalesBuys(SalesBuysInput input)
        {
            return await Service.Sp_Exchange_SalesBuys(input);
        }


        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<TreasutyMonementOutput>>> TreasutyMonement(TreasutyMonementInput input)
        {
            return await Service.Sp_Exchange_TreasutyMonement(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<Central_statmentOutPut>>> Central_statment(Central_statmentInput input)
        {
            return await Service.Sp_Exchange_Central_statment(input);
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<Income_StOutPut>>> Income_St(Income_StInput input)
        {
            return await Service.Sp_Exchange_Income_St(input);
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<mezanOutPut>>> mezan(mezanInput input)
        {
            return await Service.Sp_Exchange_mezan(input);
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<Kashf_TahlelyOutPut>> Kashf_Tahlely(Kashf_TahlelyInput input)
        {
            return await Service.Sp_Exchange_Kashf_Tahlely(input);
        }



        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<Income_StOutPut_compare>>> Sp_Exchange_Income_St_compare(Income_StInput_compare input)
        {
            return await Service.Sp_Exchange_Income_St_compare(input);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<Central_statmentOutPut_compare>>> Sp_Exchange_Central_statment_compare(Central_statmentInput_compare input)
        {
            return await Service.Sp_Exchange_Central_statment_compare(input);
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<ShiftTrackingDto>>> GetAllShiftTracking(GetAllShiftTrackingInput input) {
            return await ShiftTracking.GetAllShiftTracking(input);
        }

    }
}

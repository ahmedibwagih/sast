using System.Security.Claims;
using System.Threading.Tasks;
using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.Sec;
using Application.Core.Services;
using Application.Core.Services.LookUps;
using Application.Services;
using Application.Services.LookUps;
using Core;
using Core.DTOs;
using Core.Entities.Sec;
using Core.Other;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SettingController : ControllerBase
    {
        private readonly AppSettings AppSettings;


        public SettingController(AppSettings appSettings)
        {
            this.AppSettings =appSettings;
 
        }


        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public  string GetAttachementUrlPath()
        {
            return  AppSettings.Attachment?.UrlPath;
        }



    }
}

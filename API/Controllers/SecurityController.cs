using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.Sec;
using Application.Core.DTOs.WorkFlow;
using Application.Core.Services;
using Application.Core.Services.Client;
using Application.Core.Services.LookUps;
using Application.Services;
using Application.Services.LookUps;
using Core;
using Core.DTOs;
using Core.Entities.Sec;
using Core.Other;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SecurityController : ControllerBase
    {
        private readonly ISecurityService SecUserService;

        // private readonly IHttpContextAccessor _httpContextAccessor;
         

        public SecurityController(ISecurityService secUserService//, IHttpContextAccessor httpContextAccessor
                                                             )
        {
            this.SecUserService = secUserService;
    
            //_httpContextAccessor = httpContextAccessor;
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<bool> SetSeeNotifcation(int userid)
        {
            return await SecUserService.SetSeeNotifcation(userid);
        }


        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<RequestResult>>> GetNotifcationRequest(int userid)
        {
            return await SecUserService.GetNotifcationRequest(userid);
        }


        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<SecUserDto>> CreateUser([FromBody] SecUserCreateDto input)
        {
            var CurrentUserId = int.Parse(User.Claims.FirstOrDefault(c => c.Type == "UserId").Value.ToString());
            return await SecUserService.CreateNewUser(input, CurrentUserId);
        }


        [HttpPost]
        [Route("[action]")]
        public Task<ExchangeResponse<string>> Login(SecUserLoginDto input)
        {
            input.Password = HttpUtility.UrlEncode(input.Password);
            var token = SecUserService.GenerateJwtTokenAsync(input);
            return  token;
        }


        [HttpPost]
        [Route("[action]")]
        public Task<ExchangeResponse<string>> ChangePassword(int userId, string newPassword, string oldPassword)
        {
            var result = SecUserService.ChangePassword(userId, oldPassword, newPassword);
            return result;
        }

        [HttpPost]
        [Route("[action]")]
        public Task<ExchangeResponse<string>> UpdateImageProfile(string imagePath, int userId)
        {
            var result = SecUserService.UpdateImageProfile(userId, imagePath);
            return result;
        }

        //[HttpPost]
        //[Route("[action]")]
        //public Task<ExchangeResponse<List<SecUserDto>>> GetUsers()
        //{
        //    var result = SecUserService.GetUsers();
        //    return result;
        //}


        // [Authorize]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<PagingResultDto<SecUserDto>> GetUsers([FromQuery] PagingInputDto pagingInputDto)
        {
            return await SecUserService.GetUserAllPaging(pagingInputDto);
        }
      


        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task UpdateUser([FromBody] SecUserDto input)
        {
            await SecUserService.Update(input);
        }





        [HttpPost]
        [Route("[action]")]
        public Task<ExchangeResponse<List<ExBranchDto>>> GetBranches()
        {
            var CurrentUserId = 0;
            try
            {
                CurrentUserId = int.Parse(User.Claims.FirstOrDefault(c => c.Type == "UserId").Value.ToString());
            }
            catch (Exception ex) { }
            var result = SecUserService.GetBranches(CurrentUserId);
            return   result ;
        }
        
        [HttpPost]
        [Route("[action]")]
        public Task<ExchangeResponse<List<SecPermissionTypeDto>>> GetPermissionType()
        {
            var result = SecUserService.GetPermissionType();
            return   result ;
        }
       
           [HttpPost]
        [Route("[action]")]
        public Task<SecPermissionTypeDto> GetPermissionTypeById(int PermissionTypeId)
        {
            var result =  SecUserService.GetPermissionTypeById(PermissionTypeId);
            return   result ;
        }

        [HttpPost]
        [Route("[action]")]
        public async Task<ExchangeResponse<SecPermissionTypeDto>> CreatePermissionType(SecPermissionTypeDto input)
        {
         return  await SecUserService.CreatePermissionType(input);

        }

        [HttpPost]
        [Route("[action]")]
        public async Task<SecPermissionTypeDto> UpdatePermissionType(SecPermissionTypeDto input)
        {
            return await SecUserService.UpdatePermissionType(input);

        }




        //[HttpPost]
        //[Route("[action]")]
        //public Task<ExchangeResponse<List<SecPermissionTypeDto>>> updatePermissionType()
        //{
        //    var result = SecUserService.GetPermissionType();
        //    return result;
        //}




        [HttpPost]
        [Route("[action]")]
        public Task<ExchangeResponse<List<SecFormDto>>> GetUserForms()
        {
            var CurrentUserId = User.Claims.FirstOrDefault(c => c.Type == "UserId").Value;
            var result = SecUserService.GetUserForms(int.Parse( CurrentUserId.ToString()));
            return result;
        }


        [HttpPost]
        [Route("[action]")]
        public Task<ExchangeResponse<List<SecFormsFunctionDto>>> GetUserFunctions( int formId)
        {
            var CurrentUserId = User.Claims.FirstOrDefault(c => c.Type == "UserId").Value;
            var result = SecUserService.GetUserFunctions(int.Parse(CurrentUserId.ToString()), formId);
            return result;
        }

        [HttpPost]
        [Route("[action]")]
        public Task<ExchangeResponse<List<SecFormDto>>> GetAllForms(int permissionTypeId)
        {
            //var CurrentUserId = User.Claims.FirstOrDefault(c => c.Type == "UserId").Value;
            var result = SecUserService.GetAllForms(permissionTypeId);
            return result;
        }


        [HttpPost]
        [Route("[action]")]
        public Task<ExchangeResponse<List<SecFormsFunctionDto>>> GetAllFunctions(int formId, int permissionTypeId)
        {
            var result = SecUserService.GetAllFunctions( formId, permissionTypeId);
            return result;
        }

     

        [HttpPost]
        [Route("[action]")]
        public Task<ExchangeResponse<SecUserDto>> GetCurrentUserData()
        {
            var CurrentUserId = User.Claims.FirstOrDefault(c => c.Type == "UserId").Value;

            var result = SecUserService.GetUserData(int.Parse(CurrentUserId.ToString()));

           // _httpContextAccessor.HttpContext.Session.SetString("CurrentUser", JsonConvert.SerializeObject(result.Result.Result));
            return result;
        }


        [HttpPost]
        [Route("[action]")]
        public Task<ExchangeResponse<SecUsersFormDto>> AllowpermissionTypeForm(int permissionTypeId, int formId, bool isChecked)
        {
            var result = SecUserService.AllowpermissionTypeForm(permissionTypeId, formId, isChecked);
            return result;
        }

        [HttpPost]
        [Route("[action]")]
        public Task<ExchangeResponse<SecUsersFunctionDto>> AllowpermissionTypeFunction(int permissionTypeId, int formFunctionID, bool isChecked, string FunText)
        {
            var result = SecUserService.AllowpermissionTypeFunction(permissionTypeId, formFunctionID, isChecked,  FunText);
            return result;
        }



        [HttpPost]
        [Route("[action]")]
        public Task<ExchangeResponse<List<ExBranchDto>>> GetpermissionTypeBranches(int permissionTypeId)
        {
            var result = SecUserService.GetpermissionTypeBranches(permissionTypeId);
            return result;
        }

        [HttpPost]
        [Route("[action]")]
        public Task<ExchangeResponse<SecPermissionTypeBranchesDto>> AllowpermissionTypeBranche(int permissionTypeId, int branhId, bool isChecked)
        {
            var result = SecUserService.AllowpermissionTypeBranche(permissionTypeId,  branhId,  isChecked);
            return result;
        }




        [HttpPost]
        [Route("[action]")]
        public Task<ExchangeResponse<ActivationKeysDto>> CreateActivationKey(ActivationKeysDto input)
        {
            var result = SecUserService.CreateActivationKey(input);
            return result;
        }      
        
        [HttpPost]
        [Route("[action]")]
        public Task<ExchangeResponse<ActivationKeysData>> GetActivationData()
        {
            var result = SecUserService.GetActivationData();
            return result;
        }




    }
}

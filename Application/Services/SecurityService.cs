using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IdentityModel.Tokens.Jwt;
using System.IO;
using System.Linq;

using System.Net.Http;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Web;
using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.Sec;
using Application.Core.DTOs.WorkFlow;
using Application.Core.Services;
using Application.Core.Services.LookUps;
using Application.Mapper;
using Azure;
using Core;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.Workflow;
using Core.Other;
using Core.UnitOfWork;



using Infrastructure.UnitOfWork;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Org.BouncyCastle.Asn1.Ocsp;
using Org.BouncyCastle.Asn1.X509;
using static System.Runtime.InteropServices.JavaScript.JSType;
using static Google.Apis.Requests.BatchRequest;

namespace Application.Services.LookUps
{
    public class SecurityService : BaseService<SecUser, SecUserDto, SecUserCreateDto, SecUserDto, SecUserDto>, ISecurityService
    {

        IService<WFRequest, WFRequestDto, WFRequestDto, WFRequestDto, WFRequestDto> WorkFlowService;
        private readonly AppSettings AppSettings;
        public SecurityService(IUnitOfWork unitOfWork, IService<WFRequest, WFRequestDto, WFRequestDto, WFRequestDto, WFRequestDto> workFlowService
       , AppSettings appSettings) : base(unitOfWork)
        {
            this.AppSettings = appSettings;
            this.WorkFlowService = workFlowService;
        }

        //public override async Task<ExBankDto> GetById(long id)
        //{
        //    var response = await base.GetById(id);
        //    return response;
        //}

        //User Creation validation
        protected async  Task<bool> ValidUser(SecUser entity, SecUserCreateDto dto)
        {
            if ((await UnitOfWork.SecUser.GetAsync("UserCode == \"" + dto.UserCode + "\"")).ToList().Count() > 0)
                throw new ExchangeException(" the User Code exists ");

            if ((await UnitOfWork.SecUser.GetAsync("LoginName == \"" + dto.LoginName + "\"")).ToList().Count() > 0)
                throw new ExchangeException(" the Login Name  exists ");



            if ((await UnitOfWork.SecUser.GetAsync("UserId == \"" + entity.UserId + "\"")).ToList().Count() > 0)
                throw new ExchangeException(" the User Id  exists ");


            return true;
        }

        protected async Task<string> GetUserId(string LoginName)
        {

            try
            {
                var user = (await UnitOfWork.SecUser.GetAsync("LoginName == \"" + ExchangeEncrypt.Encryp( LoginName )+ "\"")).FirstOrDefault();
                return user.UserId.ToString();
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }


        }


        public async Task<bool> SetSeeNotifcation(int userid)
        {
            var user = (await UnitOfWork.SecUser.GetByIdAsync(userid));
            user.LastNotifcationDate = DateTime.Now;
           await this.UnitOfWork.CompleteAsync();
            return true;
        }

        public async Task<ExchangeResponse<List<RequestResult>>> GetNotifcationRequest(int userid)
        {
            try
            {
                var user = (await UnitOfWork.SecUser.GetByIdAsync(userid));
            DateTime? lastNotifcationDate = user.LastNotifcationDate;
            var recieved = UnitOfWork.Sp_Exchange_WF_GetInputRequest(userid);
            if (lastNotifcationDate != null)
                recieved = recieved.Where(a=>a.RegisterDate > lastNotifcationDate).ToList() ;

            
            return new ExchangeResponse<List<RequestResult>> { Status = ResponseEnum.Ok, Result = recieved };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }


        public async Task<ExchangeResponse<SecUserDto>> GetUserData(int userid)
        {

            try
            {
                var user = (await UnitOfWork.SecUser.GetByIdAsync(userid));
                var userDto = Mapper.MapperObject.Mapper.Map<SecUserDto>(user);
                List<Setting> allSetting = await UnitOfWork.Setting.GetAllAsync();
                List<SettingDto> allSettingDto = Mapper.MapperObject.Mapper.Map<List<SettingDto>>(allSetting);

                foreach (SettingDto item in allSettingDto)
                {
                    if (userDto.UserSettings.Where(a => a.SettingID == item.SettingID).Count() == 0)
                    {
                        userDto.UserSettings.Add(new UserSettingDto() {UserId= userDto.UserId,SettingID= item.SettingID,Value = item.DefaultValue,Id=0,UserSettingID=0 });
                    }
                }

                foreach (UserSettingDto item in userDto.UserSettings)
                {
                    item.SettingName = allSettingDto.Where(a => a.SettingID == item.SettingID).FirstOrDefault().SettingName;
                }
                return new ExchangeResponse<SecUserDto> { Status = ResponseEnum.Ok, Result = userDto };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }


        }

        public  async Task<ExchangeResponse<SecUserDto>> CreateNewUser(SecUserCreateDto input,int userid)
        {


            try
            {
                var x = (await this.UnitOfWork.ActivationKeys.GetAllAsync()).OrderByDescending(a => a.ActivationKeyId).ToList();
                if (x.Count() <= 0)
                    throw new ExchangeException("You have exceeded the required users numbers");

                string[] activeData = Decrypt(x.FirstOrDefault().key, "!@#$%^&*()").Split('|');
                int maxusers = int.Parse(activeData[4]);
                if (maxusers < (await this.UnitOfWork.SecUser.GetAllAsync()).Count())
                    throw new ExchangeException("You have exceeded the required users numbers");

                input.Password = HttpUtility.UrlEncode(input.Password);
                var entity = Mapper.MapperObject.Mapper.Map<SecUser>(input);
                //if (entity is null)
                //{
                //    throw new System.Exception("error in user data");
                //}
                entity.UserId = (await UnitOfWork.SecUser.GetAllAsync()).Max(a => a.UserId) + 1;

                if (entity.BranchId == 0)
                    entity.BranchId = null;
              //  await ValidUser(entity, input);


                UnitOfWork.BeginTran();

                var newEntity = await Repository.AddAsync(entity);

                await UnitOfWork.CompleteAsync();

                await OnCreated(newEntity, input);

           
                        await WorkFlowService.LightCreate(new Core.DTOs.WorkFlow.WFRequestDto()
                        {
                            BranchID = (int)newEntity.BranchId,
                            EntityId = newEntity.UserId.ToString(),
                            IsCompleted = false,
                            RegisterDate = DateTime.Now
                        ,
                            RequestTypeId = 4,
                            UserId = userid,
                            Username = "fulladmin"
                        });

                await UnitOfWork.CompleteAsync();
                UnitOfWork.CommitTran();

                var response = Mapper.MapperObject.Mapper.Map<SecUserDto>(newEntity);
                return new ExchangeResponse<SecUserDto> { Status = ResponseEnum.Ok, Result = response }; 
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException("User login exsits before");
            }
        }


        public  async Task<PagingResultDto<SecUserDto>> GetUserAllPaging(PagingInputDto pagingInputDto)
        {
            var result = await UnitOfWork.SecUser.GetAllPagingAsync(pagingInputDto);
            var list = Mapper.MapperObject.Mapper.Map<IList<SecUserDto>>(result.Item1);
            if (pagingInputDto.Filter != null)
            {
                pagingInputDto.Filter = pagingInputDto.Filter.Trim();
                list = list.Where(a => a.UserId.ToString().Contains(pagingInputDto.Filter) 
                || a.PermissionTypeName.Contains(pagingInputDto.Filter)
                || a.UserCode.Contains(pagingInputDto.Filter)
                || a.UserNameAr.Contains(pagingInputDto.Filter)
                || a.UserNameEn.Contains(pagingInputDto.Filter)
                ).ToList();
            }
            var response = new PagingResultDto<SecUserDto>
            {
                Result = list,
                Total = result.Item2
            };

            return response;
        }

        //string plaintext = item["CustId"].ToString() + "|" + item["AppId"].ToString() + "|" + item["From"].ToString() + "|" + item["To"].ToString() + "|" + item["MaxUsers"].ToString() + "|" + item["MaxAccountingentries"].ToString();
        //item["ActivationKey"] = Encrypt(plaintext, "!@#$%^&*()");
        public async Task<ExchangeResponse<string>> GenerateJwtTokenAsync(SecUserLoginDto input)
        {
            string[] WorkSheetData= new string[0] ;
            string[] MacAddressesData = new string[0];
            DataTable Dt_WorkSheetData = new DataTable();
            Dt_WorkSheetData.Namespace = "WorkSheetData";
            Dt_WorkSheetData.TableName = "WorkSheetData";
            Dt_WorkSheetData.Columns.Add("day");
            Dt_WorkSheetData.Columns.Add("from");
            Dt_WorkSheetData.Columns.Add("to");
            Dt_WorkSheetData.Columns.Add("isoff");
            //Check activation key
            var x = (await this.UnitOfWork.ActivationKeys.GetAllAsync()).OrderByDescending(a => a.ActivationKeyId).ToList();
            if (x.Count() <= 0)
                return new ExchangeResponse<string> { Status = ResponseEnum.Fail, Notes = "please enter the activation key" };
            try
            {
                string[] activeData = Decrypt(x.FirstOrDefault().key, "!@#$%^&*()").Split('|');
                DateTime from = new DateTime(1990,1,1) + new TimeSpan(  int.Parse(activeData[2]),0,0,0);
                DateTime to = new DateTime(1990, 1, 1) + new TimeSpan(int.Parse(activeData[3]), 0, 0, 0);
                int maxusers = int.Parse(activeData[4]);
                int appid = int.Parse(activeData[1]);
                int custid = int.Parse(activeData[0]);

                if (activeData.Length > 6)
                {
                    WorkSheetData = activeData[6].ToString().Split('&');
                    foreach (string item in WorkSheetData)
                    {
                        string[] rowdata = item.Split('*');
                        if (rowdata.Length > 1)
                        {
                            Dt_WorkSheetData.Rows.Add(rowdata[0], rowdata[1], rowdata[2], rowdata[3]);
                        }
                    }
                
                }
                if (activeData.Length > 7)
                    MacAddressesData = activeData[7].ToString().Split('&');

                if (AppSettings.CustId != custid || AppSettings.ApplicationId != appid)
                    return new ExchangeResponse<string> { Status = ResponseEnum.Fail, Notes = "Wrong ActivationKey" };

                //if (DateTime.Now > to || DateTime.Now < from)
                //    return new ExchangeResponse<string> { Status = ResponseEnum.Fail, Notes = "activation key expired" };
            }
            catch (Exception ex)
            {
                return new ExchangeResponse<string> { Status = ResponseEnum.Fail, Notes = "please enter the activation key" ,Error_Desc= ex.Message.ToString() };
            }

            //check worksheet
            if (Dt_WorkSheetData.Rows.Count > 0)
            {
                string dayName = DateTime.Now.ToString("dddd", CultureInfo.InvariantCulture);
                DataRow current = Dt_WorkSheetData.Select("day = '" + dayName + "'")[0];

                TimeSpan startTime = TimeSpan.Parse(current["from"].ToString());
                TimeSpan endTime = TimeSpan.Parse(current["to"].ToString());
                TimeSpan currentTime = DateTime.Now.TimeOfDay;

                if (!(currentTime >= startTime && currentTime <= endTime))
                {
                    return new ExchangeResponse<string> { Status = ResponseEnum.Fail, Notes = "You cannot login to the application in this time", Error_Desc = "You can not login to the application in this time" };
                }
            }

            ////check MacAddressesData
            //if (MacAddressesData.Length > 0)
            //{
            //    if (!MacAddressesData.Contains(input.MACaddress))
            //    {
            //        return new ExchangeResponse<string> { Status = ResponseEnum.Fail, Notes = "Your Mac addresse not listed  ", Error_Desc = "Your Mac addresse not listed " };
            //    }
            //}

            string cond = "LoginName == \"" + ExchangeEncrypt.Encryp(input.LoginName) + "\"" + " && Password == \"" + ExchangeEncrypt.Encryp(input.Password) + "\"";
            if ((await UnitOfWork.SecUser.GetAsync(cond)).Where(a=>a.Enabled == true).ToList().Count() <= 0)
            {
                input.Password = HttpUtility.UrlDecode(input.Password);
                cond = "LoginName == \"" + ExchangeEncrypt.Encryp(input.LoginName) + "\"" + " && Password == \"" + ExchangeEncrypt.Encryp(input.Password) + "\"";
                if ((await UnitOfWork.SecUser.GetAsync(cond)).ToList().Where(a => a.Enabled == true).Count() <= 0)
                    return new ExchangeResponse<string> { Status = ResponseEnum.Fail, Notes = "invalid user name and password" };
            }
            

            string secretKey = "";
            string issuer = "";
            string audience = "";

            
            var claims = new[]
            {
             new Claim("LoginName", input.LoginName.ToString()),
              new Claim("UserId",(await GetUserId( input.LoginName.ToString()))),
             new Claim(JwtRegisteredClaimNames.Aud, audience)
            };

            var token = new JwtSecurityToken(
                issuer: issuer,
                audience: audience,
                claims: claims,
                expires: DateTime.UtcNow.AddHours(1),
                signingCredentials: null
            );


             return new ExchangeResponse<string> { Status = ResponseEnum.Ok, Result =new JwtSecurityTokenHandler().WriteToken(token)  }; 
        }

        public async Task<ExchangeResponse<List<ExBranchDto>>> GetBranches(int currentUserId)
        {
            //List<ExBranchDto>
            try
            {
                if (currentUserId == 0)
                {
                    var branches1 = (await UnitOfWork.ExBranch.GetAllAsync()).ToList();
                    var branchesDto1 = Mapper.MapperObject.Mapper.Map<List<ExBranchDto>>(branches1);
                    return new ExchangeResponse<List<ExBranchDto>> { Status = ResponseEnum.Ok, Result = branchesDto1 };
                }
                else
                {
                    var Cuser = await UnitOfWork.SecUser.GetByIdLightAsync(currentUserId);
                    var branchesuser = (await UnitOfWork.SecPermissionTypeBranches.GetAsync("PermissionTypeId = " + Cuser.PermissionTypeId.ToString())).Where(a=>a.Selected ==true);
                    var branches = (await UnitOfWork.ExBranch.GetAllAsync()).ToList();
                    var branchesDto = Mapper.MapperObject.Mapper.Map<List<ExBranchDto>>(branches);
                    foreach (var item in branchesDto)
                    {
                        if (branchesuser.Where(a => a.BranchId == item.BranchId).Count() <= 0)
                            item.BranchId = -1;

                    }
                    branchesDto = branchesDto.Where(a => a.BranchId != -1).ToList();
                    return new ExchangeResponse<List<ExBranchDto>> { Status = ResponseEnum.Ok, Result = branchesDto };
                }
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
          
        }


        public async Task<ExchangeResponse<List<SecPermissionTypeDto>>> GetPermissionType()
        {

            //List<ExBranchDto>
            try
            {
                var SecPermissionType = (await UnitOfWork.SecPermissionType.GetAllAsync()).ToList();
                var SecPermissionTypeDto = Mapper.MapperObject.Mapper.Map<List<SecPermissionTypeDto>>(SecPermissionType);
                return new ExchangeResponse<List<SecPermissionTypeDto>> { Status = ResponseEnum.Ok, Result = SecPermissionTypeDto };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }

        }


        public virtual async Task<SecPermissionTypeDto> GetPermissionTypeById(int PermissionTypeId)
        {
            var entity = await UnitOfWork.SecPermissionType.GetByIdAsync(PermissionTypeId);

            var response = Mapper.MapperObject.Mapper.Map<SecPermissionTypeDto>(entity);

            return response;
        }



        public async Task<ExchangeResponse<SecPermissionTypeDto>> CreatePermissionType(SecPermissionTypeDto input)
        {


            try
            {
                var entity = Mapper.MapperObject.Mapper.Map<SecPermissionType>(input);
                if (entity is null)
                {
                    throw new System.Exception(AppMessages.InternalError);
                }
                entity.PermissionTypeId = (await UnitOfWork.SecPermissionType.GetAllAsync()).Max(a => a.PermissionTypeId) + 1;


                UnitOfWork.BeginTran();

                var newEntity = await UnitOfWork.SecPermissionType.AddAsync(entity);

                await UnitOfWork.CompleteAsync();

               

                UnitOfWork.CommitTran();

                var response = Mapper.MapperObject.Mapper.Map<SecPermissionTypeDto>(newEntity);
                return new ExchangeResponse<SecPermissionTypeDto> { Status = ResponseEnum.Ok, Result = response };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }

        public virtual async Task<SecPermissionTypeDto> UpdatePermissionType(SecPermissionTypeDto input)
        {
            var entity = await UnitOfWork.SecPermissionType.GetByIdAsync(input.Id);

            if (entity == null)
                throw new System.Exception(AppMessages.RecordNotExisted);

            UnitOfWork.BeginTran();

            Mapper.MapperObject.Mapper.Map(input, entity, typeof(SecPermissionTypeDto), typeof(SecPermissionType));
            await UnitOfWork.CompleteAsync();
            UnitOfWork.CommitTran();

            var response = Mapper.MapperObject.Mapper.Map<SecPermissionTypeDto>(entity);

            return response;
        }

        public virtual async Task<ExchangeResponse<string>> UpdateImageProfile(int currentUserId, string imagePath)
        {
            try
            {
              
                string cond =  " UserID == " + currentUserId.ToString();
                if ((await UnitOfWork.SecUser.GetAsync(cond)).ToList().Count() <= 0)
                    return new ExchangeResponse<string> { Status = ResponseEnum.Fail, Result = "invalid user id and password" };// ;

                var user = (await UnitOfWork.SecUser.GetByIdAsync(currentUserId));
                user.ImagePath = imagePath;
                return new ExchangeResponse<string> { Status = ResponseEnum.Ok, Result = (await UnitOfWork.CompleteAsync()).ToString() };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }
        public async Task<ExchangeResponse<List<SecUserDto>>> GetUsers()
        {
            //List<ExBranchDto>
            try
            {
                var users = (await UnitOfWork.SecUser.GetAllAsync()).ToList();
                var usersDto = Mapper.MapperObject.Mapper.Map<List<SecUserDto>>(users);
                return new ExchangeResponse<List<SecUserDto>> { Status = ResponseEnum.Ok, Result = usersDto };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }

        }


        public async Task<ExchangeResponse<List<SecUserDto>>> GetUsersForWorkFlow(int RequestTypeId)
        {
            //List<ExBranchDto>
            try
            {
                var users = (await UnitOfWork.SecUser.GetAllAsync()).ToList();
                var usersDto = Mapper.MapperObject.Mapper.Map<List<SecUserDto>>(users);
                if (RequestTypeId == 5 || RequestTypeId == 6)
                {
                    usersDto.Add(new SecUserDto() { UserNameAr = "مسئول الخزينه من", UserNameEn = "", UserId = 9999990 });
                    usersDto.Add(new SecUserDto() { UserNameAr = "مسئول الخزينه الي", UserNameEn = "", UserId = 9999991 });
                    usersDto.Add(new SecUserDto() { UserNameAr = "مدير الفرع من", UserNameEn = "", UserId = 9999992 });
                    usersDto.Add(new SecUserDto() { UserNameAr = "مدير الفرع الي", UserNameEn = "", UserId = 9999993 });
                }
                return new ExchangeResponse<List<SecUserDto>> { Status = ResponseEnum.Ok, Result = usersDto };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }

        }


        public async Task<ExchangeResponse<string>> ChangePassword(int userid,string oldPassword,string newPassword)
        {
            try
            {
                oldPassword = HttpUtility.UrlEncode(oldPassword);
                newPassword = HttpUtility.UrlEncode(newPassword);
                string cond = "Password == \"" + ExchangeEncrypt.Encryp(oldPassword) + "\"" + " && UserID == " + userid.ToString();
                if ((await UnitOfWork.SecUser.GetAsync(cond)).ToList().Count() <= 0)
                    return new ExchangeResponse<string> { Status = ResponseEnum.Fail, Result = "invalid user id and password" } ;// ;

                var user = (await UnitOfWork.SecUser.GetByIdAsync(userid));
                user.Password = ExchangeEncrypt.Encryp(newPassword);
                return   new ExchangeResponse<string> { Status = ResponseEnum.Ok, Result = (await UnitOfWork.CompleteAsync()).ToString() }; 
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }

        public async Task<ExchangeResponse<List<SecFormDto>>> GetUserForms(int userId)
        {
            try
            {
                string permissionTypeId = (await this.GetUserData(userId)).Result.PermissionTypeId.ToString();

                var AllForms =( await UnitOfWork.SecForm.GetAllAsync()).ToList();
                var userForms = (await UnitOfWork.SecUsersForm.GetAsync("permissionTypeId == " + permissionTypeId.ToString())).Where(a => a.Selected == true).ToList();
                List<SecFormDto> FilteredForm = new List<SecFormDto>();
                foreach (var Form in AllForms)
                {

                    if (userForms.Where(a => a.FormId == Form.FormId).ToList().Count() > 0)
                    {
                        var FormDto = Mapper.MapperObject.Mapper.Map<SecFormDto>(Form);
                        FilteredForm.Add(FormDto);
                    }
                }

                return new ExchangeResponse<List<SecFormDto>> { Status = ResponseEnum.Ok, Result = FilteredForm };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }

        }

        public async Task<ExchangeResponse<List<SecFormDto>>> GetAllForms(int permissionTypeId)
        {
            try
            {
                var permissionTypeForm = (await UnitOfWork.SecUsersForm.GetAsync("permissionTypeId == " + permissionTypeId.ToString())).Where(a => a.Selected == true).ToList();

                var AllForms = (await UnitOfWork.SecForm.GetAllAsync()).ToList();
                var FormsDto = Mapper.MapperObject.Mapper.Map<List<SecFormDto>>(AllForms);

                foreach (var Form in FormsDto)
                { 
                if (permissionTypeForm.Where(a=>a.FormId == Form.FormId).Count() >0)
                        Form.Checked= true;
                }

                return new ExchangeResponse<List<SecFormDto>> { Status = ResponseEnum.Ok, Result = FormsDto };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }

        }

        public async Task<ExchangeResponse<List<SecFormsFunctionDto>>> GetAllFunctions(int formId, int permissionTypeId)
        {
            try
            {
                var permissionTypeFunctions = (await UnitOfWork.SecUsersFunction.GetAsync("permissionTypeId == " + permissionTypeId.ToString())).Where(a => a.Selected == true).ToList();

                var AllFormFunctions = (await UnitOfWork.SecFormsFunction.GetAsync("FormID == " + formId.ToString())).ToList();
                var FormFunctionsDto = Mapper.MapperObject.Mapper.Map<List<SecFormsFunctionDto>>(AllFormFunctions);

                foreach (var f in FormFunctionsDto)
                {
                    if (permissionTypeFunctions.Where(a => a.FormFunctionId == f.FormFunctionId).Count() > 0)
                    {
                        f.Checked = true;
                        f.TextValue = permissionTypeFunctions.Where(a => a.FormFunctionId == f.FormFunctionId).FirstOrDefault().FunValue;
                    }
                }

                return new ExchangeResponse<List<SecFormsFunctionDto>> { Status = ResponseEnum.Ok, Result = FormFunctionsDto };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }

        }

        public async Task<ExchangeResponse<List<SecFormsFunctionDto>>> GetUserFunctions(int userId,int formId)
        {
            try
            {
                string permissionTypeId = (await this.GetUserData(userId)).Result.PermissionTypeId.ToString();

                var AllFormFunctions = (await UnitOfWork.SecFormsFunction.GetAsync("FormID == " + formId.ToString())).ToList();
                var userFunctions = (await UnitOfWork.SecUsersFunction.GetAsync("permissionTypeId == " + permissionTypeId.ToString())).Where(a=>a.Selected == true).ToList();
                List<SecFormsFunctionDto> FilteredFormsFunction = new List<SecFormsFunctionDto>();
                foreach (var FormFunction in AllFormFunctions)
                {

                    if (userFunctions.Where(a => a.FormFunctionId == FormFunction.FormFunctionId).ToList().Count() > 0)
                    {
                        var FormFunctionDto = Mapper.MapperObject.Mapper.Map<SecFormsFunctionDto>(FormFunction);
                        FormFunctionDto.TextValue = userFunctions.Where(a => a.FormFunctionId == FormFunction.FormFunctionId).ToList().FirstOrDefault().FunValue;
                        FilteredFormsFunction.Add(FormFunctionDto);
                    }
                }

                return new ExchangeResponse<List<SecFormsFunctionDto>> { Status = ResponseEnum.Ok, Result = FilteredFormsFunction };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }

        }


        public async Task<ExchangeResponse<SecUsersFormDto>> AllowpermissionTypeForm(int permissionTypeId, int formId,bool isChecked)
        {
            try
            {
                //if (isChecked)
                //{
                    var checkExsists = (await UnitOfWork.SecUsersForm.GetAsync("FormID == " + formId.ToString() + "&& permissionTypeId == " + permissionTypeId.ToString())).ToList();

                    if (checkExsists.Count() > 0)
                    {
                        var item =  await UnitOfWork.SecUsersForm.GetByIdAsync(checkExsists.FirstOrDefault().Id);
                        item.Selected= isChecked;
                        await UnitOfWork.CompleteAsync();
                        var entityDto = Mapper.MapperObject.Mapper.Map<SecUsersFormDto>(item);
                        return new ExchangeResponse<SecUsersFormDto> { Status = ResponseEnum.Ok, Result = entityDto };
                    }
                    else
                    {
                        int Id = (await UnitOfWork.SecUsersForm.GetAllAsync()).Max(a => a.Id) + 1;
                        SecUsersForm secUsersForm = new SecUsersForm { Id = Id, FormId = formId, PermissionTypeId = permissionTypeId ,Selected= isChecked };

                        var insertedSecUsersForm = await UnitOfWork.SecUsersForm.AddAsync(secUsersForm);
                        await UnitOfWork.CompleteAsync();
                        var entityDto = Mapper.MapperObject.Mapper.Map<SecUsersFormDto>(insertedSecUsersForm);
                        return new ExchangeResponse<SecUsersFormDto> { Status = ResponseEnum.Ok, Result = entityDto };
                    }
                //}
                //else
                //{
                //    var checkExsists = (await UnitOfWork.SecUsersForm.GetAsync("FormID == " + formId.ToString() + "&& permissionTypeId == " + permissionTypeId.ToString())).ToList();

                //    if (checkExsists.Count() > 0)
                //    {
                //        var item = await UnitOfWork.SecUsersForm.GetByIdAsync(checkExsists.FirstOrDefault().Id);
                //        item.Selected = false;
                //        await UnitOfWork.CompleteAsync();
                //         return new ExchangeResponse<SecUsersFormDto> { Status = ResponseEnum.Ok, Result = null };
                //        //UnitOfWork.SecUsersForm.Delete(checkExsists.FirstOrDefault());
                //        //await UnitOfWork.CompleteAsync();
                //    }
                   
                //}
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }


        public async Task<ExchangeResponse<SecUsersFunctionDto>> AllowpermissionTypeFunction(int permissionTypeId, int formFunctionID, bool isChecked,string FunText)
        {
            try
            {
                //if (isChecked)
                //{
                    var checkExsists = (await UnitOfWork.SecUsersFunction.GetAsync("FormFunctionID == " + formFunctionID.ToString() + "&& permissionTypeId == " + permissionTypeId.ToString())).ToList();

                    if (checkExsists.Count() > 0)
                    {
                    var item = await UnitOfWork.SecUsersFunction.GetByIdAsync(checkExsists.FirstOrDefault().Id);
                    item.Selected = isChecked;

                    if (item.Selected == false)
                        item.FunValue = "0";
                    else
                        item.FunValue = FunText;

                    await UnitOfWork.CompleteAsync();

                    var entityDto = Mapper.MapperObject.Mapper.Map<SecUsersFunctionDto>(item);
                        return new ExchangeResponse<SecUsersFunctionDto> { Status = ResponseEnum.Ok, Result = entityDto };
                    }
                    else
                    {
                        int Id = (await UnitOfWork.SecUsersFunction.GetAllAsync()).Max(a => a.Id) + 1;
                        SecUsersFunction secUsersFunction = new SecUsersFunction { Id = Id, FormFunctionId = formFunctionID, PermissionTypeId = permissionTypeId,Selected= isChecked };

                        var insertedSecUsersForm = await UnitOfWork.SecUsersFunction.AddAsync(secUsersFunction);
                        await UnitOfWork.CompleteAsync();
                        var entityDto = Mapper.MapperObject.Mapper.Map<SecUsersFunctionDto>(insertedSecUsersForm);
                        return new ExchangeResponse<SecUsersFunctionDto> { Status = ResponseEnum.Ok, Result = entityDto };
                    }
                //}
                //else
                //{
                //    var checkExsists = (await UnitOfWork.SecUsersFunction.GetAsync("FormFunctionID == " + formFunctionID.ToString() + "&& permissionTypeId == " + permissionTypeId.ToString())).ToList();

                //    if (checkExsists.Count() > 0)
                //    {
                //        UnitOfWork.SecUsersFunction.Delete(checkExsists.FirstOrDefault());
                //        await UnitOfWork.CompleteAsync();
                //    }
                //    return new ExchangeResponse<SecUsersFunctionDto> { Status = ResponseEnum.Ok, Result = null };
                //}
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }


        public async Task<ExchangeResponse<SecPermissionTypeBranchesDto>> AllowpermissionTypeBranche(int permissionTypeId, int branhId, bool isChecked)
        {
            try
            {
                var checkExsists = (await UnitOfWork.SecPermissionTypeBranches.GetAsync("BranchId == " + branhId.ToString() + "&& permissionTypeId == " + permissionTypeId.ToString())).ToList();

                if (checkExsists.Count() > 0)
                {
                    var item = await UnitOfWork.SecPermissionTypeBranches.GetByIdAsync(checkExsists.FirstOrDefault().ID);
                    item.Selected = isChecked;
                    await UnitOfWork.CompleteAsync();

                    var entityDto = Mapper.MapperObject.Mapper.Map<SecPermissionTypeBranchesDto>(item);
                    return new ExchangeResponse<SecPermissionTypeBranchesDto> { Status = ResponseEnum.Ok, Result = entityDto };
                }
                else
                {
                  //  int Id = 1;
                  // var xx = (await UnitOfWork.SecPermissionTypeBranches.GetAllAsync()).Count();
                  //if (xx > 0)
                  //       Id= (await UnitOfWork.SecPermissionTypeBranches.GetAllAsync()).Max(a => a.ID) + 1;
                    SecPermissionTypeBranches SecPermissionTypeBranches = new SecPermissionTypeBranches {  BranchId = branhId, PermissionTypeId = permissionTypeId, Selected = isChecked };

                    var insertedSecPermissionTypeBranches = await UnitOfWork.SecPermissionTypeBranches.AddAsync(SecPermissionTypeBranches);
                    await UnitOfWork.CompleteAsync();
                    var entityDto = Mapper.MapperObject.Mapper.Map<SecPermissionTypeBranchesDto>(insertedSecPermissionTypeBranches);
                    return new ExchangeResponse<SecPermissionTypeBranchesDto> { Status = ResponseEnum.Ok, Result = entityDto };
                }
               
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }


        public async Task<ExchangeResponse<List<ExBranchDto>>> GetpermissionTypeBranches(int permissionTypeId)
        {
            try
            {
                var permissionTypBranches = (await UnitOfWork.SecPermissionTypeBranches.GetAsync("permissionTypeId == " + permissionTypeId.ToString())).Where(a => a.Selected == true).ToList();

                var AllBrnches = (await UnitOfWork.ExBranch.GetAllAsync()).ToList();
                var BranchesDto = Mapper.MapperObject.Mapper.Map<List<ExBranchDto>>(AllBrnches);

                foreach (var Branch in BranchesDto)
                {
                    if (permissionTypBranches.Where(a => a.BranchId == Branch.BranchId).Count() > 0)
                        Branch.Checked = true;
                }

                return new ExchangeResponse<List<ExBranchDto>> { Status = ResponseEnum.Ok, Result = BranchesDto };
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }

        }



        public  async Task<ExchangeResponse<ActivationKeysDto>> CreateActivationKey(ActivationKeysDto input)
        {


            try
            {
                var entity = Mapper.MapperObject.Mapper.Map<ActivationKeys>(input);
                if (entity is null)
                {
                    throw new System.Exception(AppMessages.InternalError);
                }



                UnitOfWork.BeginTran();

                var newEntity = await this.UnitOfWork.ActivationKeys.AddAsync(entity);

                await UnitOfWork.CompleteAsync();
                UnitOfWork.CommitTran();

                var response = Mapper.MapperObject.Mapper.Map<ActivationKeysDto>(newEntity);
                return   new ExchangeResponse<ActivationKeysDto> { Status = ResponseEnum.Ok, Result = response,Notes= "Activation key added successfully" }; ;
            }
            catch (System.Exception ex)
            {

                throw new System.Exception(AppMessages.InternalError + " :" + ex.Message.ToString());
            }

        }

   

        public static string Decrypt(string encryptedText, string password)
        {
            return encryptedText;
        }



        public async Task<ExchangeResponse<ActivationKeysData>> GetActivationData()
        {
            try
            {

                var key = (await this.UnitOfWork.ActivationKeys.GetAllAsync()).OrderByDescending(a => a.ActivationKeyId).ToList().FirstOrDefault().key;
                string[] activeData = Decrypt(key, "!@#$%^&*()").Split('|');
                DateTime from = new DateTime(1990, 1, 1) + new TimeSpan(int.Parse(activeData[2]), 0, 0, 0);
                DateTime to = new DateTime(1990, 1, 1) + new TimeSpan(int.Parse(activeData[3]), 0, 0, 0);
                int maxusers = int.Parse(activeData[4]);
                int appid = int.Parse(activeData[1]);
                int custid = int.Parse(activeData[0]);

                ActivationKeysData result = new ActivationKeysData() {From= from  ,To= to ,MaxUsers= maxusers,appid= appid,custid= custid };
                return new ExchangeResponse<ActivationKeysData> { Status = ResponseEnum.Ok, Result = result, Notes = "" }; ;
            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<ActivationKeysData> { Status = ResponseEnum.Fail, Result = null, Notes = "No Activation key" ,Error_Desc=ex.Message.ToString()}; 
            }

        }



    }
}

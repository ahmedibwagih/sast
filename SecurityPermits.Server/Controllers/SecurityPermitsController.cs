using AutoMapper;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using SecurityPermits.Server.Models;
using SecurityPermits.Server.Services;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json.Linq;
using Microsoft.Extensions.Logging;
using Castle.Core.Logging;
using System.Security.Principal;
using System.Collections.Generic;
using System.DirectoryServices.AccountManagement;
using System.Net.Mail;
using System.Net;
using Castle.Components.DictionaryAdapter.Xml;


namespace SecurityPermits.Server.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SecurityPermitsController : ControllerBase
    {
        private readonly SecurityPermitsContext _dbContext;
        private readonly ILogger<SecurityPermitsController> _logger;
        private readonly IScBankUserService _scBankUserService;
        private readonly IMapper _mapper;
        private readonly IConfiguration _configuration;
        private readonly IHttpContextAccessor _httpContextAccessor;
        public SecurityPermitsController(IHttpContextAccessor httpContextAccessor,IConfiguration configuration, ILogger<SecurityPermitsController> logger, SecurityPermitsContext dbContext, IMapper mapper, IScBankUserService scBankUserService)
        {
            _logger = logger;
            _dbContext = dbContext;
            _mapper = mapper;
            _scBankUserService = scBankUserService;
            _configuration = configuration;
            _httpContextAccessor = httpContextAccessor;
        }


        [HttpPost]
        [Route("[action]")]
        public IActionResult Login(int userNumber, string passWord)
        {
            UserDto input = new UserDto() {passWord= passWord, userNumber= userNumber };
            if (_scBankUserService.ValidUser(input) == false)
                return Unauthorized();

            var token = _scBankUserService.GenerateJwtToken(input);

            return Ok(new { token });
        }


        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public  async Task<ActionResult<LoginResultDto>> loginDomain()
        {
            try
            {
                WindowsIdentity windowsIdentity = HttpContext.User.Identity as WindowsIdentity;

                _logger.LogInformation("Begin loginDomain");
                _logger.LogInformation("windowsIdentity name : " + HttpContext.User.Identity.Name );
                string num = "";
                if (HttpContext.User.Identity == null || HttpContext.User.Identity.Name  ==null|| HttpContext.User.Identity.Name.Trim() == "") {
                     HttpContext context = _httpContextAccessor.HttpContext;
                     var user = context.User;
                    _logger.LogInformation("windowsIdentity name2 : " + user.Identity.Name);
                    num = _scBankUserService.GetdomainUserNumber(_httpContextAccessor, _logger);
                }
                else
                    num = _scBankUserService.GetdomainUserNumber(windowsIdentity, _logger);
                

                int usernumber = int.Parse(num);
                string username = this.GetEmployesNamestr(usernumber);
                var userinput = new UserDto() { userNumber = usernumber, passWord = "DOMAIN" };
                //var token = _scBankUserService.GenerateJwtToken(userinput);
                var token = "DefaultToken";
                return Ok(new LoginResultDto() {Token= token,UserNumber= usernumber.ToString(),UserName= username } );
                _logger.LogInformation("End loginDomain");
            }
            catch(Exception ex)
            {
                _logger.LogError("In loginDomain:" + ex);
                return BadRequest();
            }           
        }



        //[Authorize]
        //[AllowAnonymous]
        [HttpPost]
        [Route("[action]")]
        public async Task<ActionResult<Boolean>> ChangeDeviceStatus(long PermitsDevicesID, int newDeviceStatus, int userid,string notes)
        {
            try
            {
                var PermitsDevice = _dbContext.PermitsDevices.Find(PermitsDevicesID);
                if (PermitsDevice == null)
                    return BadRequest("No Record Found");
                PermitsDevice.EmpNumberReturn = userid;
                PermitsDevice.DeviceStatus = newDeviceStatus;
                PermitsDevice.ReturnDeviceNote = notes;
                _dbContext.SaveChanges();
                return Ok(true);
            }
            catch (Exception ex)
            {
                _logger.LogError("In ChangeDeviceStatus:" + ex.Message);
                return BadRequest();
            }
        }



        private void SendEmail(string toEmail,string subject,string body)
        {
            //toEmail = "ahmed.wagih@scbank.com.eg";
            MailMessage msgMail = new();
            msgMail.From = new MailAddress("infoweb@scbank.com.eg", "Security Permits System");
            string[] emails = toEmail.Split(',');
            foreach (string email in emails)
            {
                msgMail.To.Add(email);
            }
           
            msgMail.IsBodyHtml = true;
            msgMail.Subject = subject;
            msgMail.Body = body;

            try
            {
                SmtpClient mailClient = new("172.18.3.217");
                mailClient.Send(msgMail);
                msgMail.Dispose();
            }

            catch
            {
            }
        }

        //[Authorize]
        //[AllowAnonymous]
        [HttpPost]
        [Route("[action]")]
        public async Task<ActionResult<Boolean>> ChangePermitStatus(long PermitID,int newStatus,int userid)
        {
            try
            {
                var Permit = _dbContext.Permits.Where(a => a.Id == PermitID).Include(a => a.PermitPeople).Include(a => a.PermitsDevices).Include(a => a.PermitWorkTypes).FirstOrDefault();
                //.Find(PermitID);
            if (Permit == null)
                return BadRequest("No Record Found");

            Permit.ApproveEmpNumber = userid;
            Permit.Status = newStatus;
            _dbContext.SaveChanges();

                string branch = "";
                string depart = "";
                string departSc = "";
                string Emp_name = "";
                string PermitStatus = "";
                string WorkTypes = "";
                try
                {
                    var x = await GetPermitStatus(int.Parse(Permit.Id.ToString()));
                    PermitStatus = ((SecurityPermits.Server.Models.StrData)((Microsoft.AspNetCore.Mvc.ObjectResult)x.Result).Value).Data.ToString();
                }
                catch { }

                try
                {
                    foreach (var item in Permit.PermitWorkTypes)
                    {
                        WorkTypes = WorkTypes + " , " + _dbContext.WorkTypes.Find(item.WorkTypeId).WorkTypeName;

                    }
                
                }
                catch { }


                try
                {
                    Emp_name = _dbContext.Employees.Where(a => a.Number == Permit.EntryEmpNumber).ToList().FirstOrDefault().Name;
                    branch = _dbContext.Branches.Where(a => a.Id == Permit.BranchId).ToList().FirstOrDefault().NameEn;
                     depart = _dbContext.Departments.Where(a => a.Id == Permit.DepartmentId).ToList().FirstOrDefault().Name;
                     departSc = _dbContext.DepartmentSections.Where(a => a.Id == Permit.DepartmentSectionId).ToList().FirstOrDefault().Name;
                }
                catch { }
                    //send email
                if (newStatus == 1)
                {
                    try
                    {
                        Employee emp = _dbContext.Employees.Where(a => a.Number == Permit.HeadSerctorEmpNumber).ToList().FirstOrDefault();
                        string body = _scBankUserService.GetPermitBody(Permit, Permit.PermitPeople.ToList(), Permit.PermitsDevices.ToList(), _dbContext.DeviceStatus.ToList(),branch,depart,departSc, Emp_name, WorkTypes, PermitStatus, Permit.Id.ToString(), Permit.PermitFrom.Value.ToString("yyyy/MM/dd"), Permit.PermitTo.Value.ToString("yyyy/MM/dd"), Permit.ContractorName, Permit.CompanyName);
                        SendEmail(emp.Email, "لديك تصريح امني تمت الموافقه عليه", body);
                        _logger.LogError("Send Email to " + emp.Email + "   لديك تصريح امني تمت الموافقه عليه ");
                    }
                    catch { }

                    try
                    {
                        Employee emp = _dbContext.Employees.Where(a => a.Number == Permit.EntryEmpNumber).ToList().FirstOrDefault();
                        string body = _scBankUserService.GetPermitBody(Permit, Permit.PermitPeople.ToList(), Permit.PermitsDevices.ToList(), _dbContext.DeviceStatus.ToList(), branch, depart, departSc, Emp_name, WorkTypes, PermitStatus, Permit.Id.ToString(), Permit.PermitFrom.Value.ToString("yyyy/MM/dd"), Permit.PermitTo.Value.ToString("yyyy/MM/dd"), Permit.ContractorName, Permit.CompanyName);
                        SendEmail(emp.Email, "لديك تصريح امني تمت الموافقه عليه", body);
                        _logger.LogError("Send Email to " + emp.Email + "   لديك تصريح امني تمت الموافقه عليه ");
                    }
                    catch { }


                    try
                    {
                        Employee emp = _dbContext.Employees.Where(a => a.Number == Permit.SupervisorEmpNumber).ToList().FirstOrDefault();
                        string body = _scBankUserService.GetPermitBody(Permit, Permit.PermitPeople.ToList(), Permit.PermitsDevices.ToList(), _dbContext.DeviceStatus.ToList(), branch, depart, departSc, Emp_name, WorkTypes, PermitStatus, Permit.Id.ToString(), Permit.PermitFrom.Value.ToString("yyyy/MM/dd"), Permit.PermitTo.Value.ToString("yyyy/MM/dd"), Permit.ContractorName, Permit.CompanyName);
                        SendEmail(emp.Email, "لديك تصريح امني تمت الموافقه عليه", body);
                        _logger.LogError("Send Email to " + emp.Email + "   لديك تصريح امني تمت الموافقه عليه ");
                    }
                    catch { }
                }
                
                return Ok( true);
            }
            catch (Exception ex)
            {
                _logger.LogError("In ChangePermitStatus:" + ex.Message);
                return BadRequest();
            }
        }


        //[Authorize]
        //[AllowAnonymous]
        [HttpPost]
        [Route("[action]")]
        public async Task<ActionResult<Boolean>> ConfirmPermit(long PermitID)
        {
            try
            {
                var Permit = _dbContext.Permits.Where(a => a.Id == PermitID).Include(a => a.PermitPeople).Include(a => a.PermitsDevices).Include(a => a.PermitWorkTypes).FirstOrDefault();
                string branch = "";
                string depart = "";
                string departSc = "";
                string Emp_name = "";
                string PermitStatus = "";
                string WorkTypes = "";
                try
                {
                    var x = await GetPermitStatus(int.Parse(Permit.Id.ToString()));
                    PermitStatus = ((SecurityPermits.Server.Models.StrData)((Microsoft.AspNetCore.Mvc.ObjectResult)x.Result).Value).Data.ToString();
                }
                catch { }

                try
                {
                    foreach (var item in Permit.PermitWorkTypes)
                    {
                        WorkTypes = WorkTypes + " , " + item.WorkType.WorkTypeName;

                    }

                }
                catch { }


                try
                {
                    Emp_name = _dbContext.Employees.Where(a => a.Number == Permit.EntryEmpNumber).ToList().FirstOrDefault().Name;
                    branch = _dbContext.Branches.Where(a => a.Id == Permit.BranchId).ToList().FirstOrDefault().NameEn;
                    depart = _dbContext.Departments.Where(a => a.Id == Permit.DepartmentId).ToList().FirstOrDefault().Name;
                    departSc = _dbContext.DepartmentSections.Where(a => a.Id == Permit.DepartmentSectionId).ToList().FirstOrDefault().Name;
                }
                catch { }

              //  var Permit = _dbContext.Permits.Find(PermitID);
                if (Permit == null)
                    return BadRequest("No Record Found");

                try
                {
                    string emails = _configuration["ApproveNotifyEmails"].ToString();
                    string body = _scBankUserService.GetPermitBody(Permit, Permit.PermitPeople.ToList(), Permit.PermitsDevices.ToList(), _dbContext.DeviceStatus.ToList(), branch, depart, departSc, Emp_name, WorkTypes, PermitStatus, Permit.Id.ToString(), Permit.PermitFrom.Value.ToString("yyyy/MM/dd"), Permit.PermitTo.Value.ToString("yyyy/MM/dd"), Permit.ContractorName, Permit.CompanyName);
                    SendEmail(emails, "تصريح امني جديد", body);
                    _logger.LogError("Send Email to " + emails + "   تصريح امني جديد ");
                }
                catch {
                    _logger.LogError("Error Send Email    تصريح امني جديد ");
                }
                Permit.SupervisorEmpDate = DateTime.Now;
                _dbContext.SaveChanges();
                return Ok(true);
            }
            catch (Exception ex)
            {
                _logger.LogError("In ChangePermitStatus:" + ex.Message);
                return BadRequest();
            }
        }




       //[Authorize]
        [HttpPost]
        [Route("[action]")]
        ////[AllowAnonymous]
        public async Task<ActionResult<Boolean>> UploadFiles( [FromForm] IFormFile file)
        {
            try
            {
        
                    if (file == null )
                        return BadRequest("No file selected");
                    var fileName = file.FileName;
                   // var filePath = Path.Combine(Directory.GetCurrentDirectory(), "uploads", fileName);
                    var filePath = Path.Combine(_configuration["PhysicalUlrPath"].ToString(), fileName);
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await file.CopyToAsync(stream);
                    }
              

                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError("In UploadFiles:" + ex.Message);
                return StatusCode(500, $"خطا في رفع الملف: {ex.Message}");
            }


            return false;
        }

       //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<PermitDto>> CreatePermit (PermitDto input)
        {


               
            if (input == null)
            {
                return BadRequest("input data is null");
            }

            input.EntryEmpDate= DateTime.Now;
            input.supervisorEmpDate = null;

            foreach (var item in input.PermitsDevices)
                item.Id = 0;

            foreach (var item in input.PermitPeople)
                item.Id = 0;

            foreach (var item in input.PermitDocs)
                item.Id = 0;

 
            try
            {
                var PermitDocs = _mapper.Map<List<PermitDoc>>(input.PermitDocs.ToList());
                var PermitsDevices = _mapper.Map<List<PermitsDevice>>(input.PermitsDevices);
                var PermitPeople = _mapper.Map<List<PermitPerson>>(input.PermitPeople);
                var PermitWorkTypes = _mapper.Map<List<PermitWorkType>>(input.PermitWorkTypes);

                input.PermitDocs = null;
                input.PermitsDevices = null;
                input.PermitPeople = null;
                input.PermitWorkTypes = null;
                var Permit = _mapper.Map<Permit>(input);

                _dbContext.Database.BeginTransaction();

                _dbContext.Permits.Add(Permit);
                _dbContext.SaveChanges();

                foreach (var i in PermitsDevices)
                {
                    i.PermitId = Permit.Id;
                    i.DeviceStatus = 1;
                }

                foreach (var i in PermitDocs)
                    i.PermitId = Permit.Id;

                foreach (var i in PermitPeople)
                    i.PermitId = Permit.Id;

                foreach (var i in PermitWorkTypes)
                    i.PermitId = Permit.Id;


                _dbContext.PermitDocs.AddRange(PermitDocs);
                _dbContext.PermitsDevices.AddRange(PermitsDevices);
                _dbContext.PermitPersons.AddRange(PermitPeople);
                _dbContext.PermitWorkTypes.AddRange(PermitWorkTypes);
                _dbContext.SaveChanges();
                _dbContext.Database.CommitTransaction();

               var permitDto = _mapper.Map<PermitDto>(Permit);
                return Ok(permitDto);
            }
            catch (Exception ex)
            {
                _logger.LogError("In ChangePermitStatus:" + ex.Message);
                return BadRequest(ex.Message.ToString());
            }



        }

       //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<List<PermitDto>>> GetPermit(long? ID, DateTime? PermitFrom, DateTime? PermitTo, int? Branch_ID, int? Department_ID, int? DepartmentSectionID, string? ContractorName, string? CompanyName, int? EntryEmpNumber, int? Status)
        {
            try
            {
                IQueryable<Permit> PermitQuery = _dbContext.Permits.Where(a => 1 == 1);

                if (Status != null && Status != 0)
                    PermitQuery = PermitQuery.Where(a => a.Status == Status);

                if (DepartmentSectionID != null && DepartmentSectionID != 0)
                    PermitQuery = PermitQuery.Where(a => a.DepartmentSectionId == DepartmentSectionID);

                if (ID != null && ID != 0)
                    PermitQuery = PermitQuery.Where(a => a.Id == (long)ID);

                if (Department_ID != null && Department_ID != 0)
                    PermitQuery = PermitQuery.Where(a => a.DepartmentId == Department_ID);

                if (Branch_ID != null && Branch_ID != 0)
                    PermitQuery = PermitQuery.Where(a => a.BranchId == Branch_ID);

                if (PermitTo != null && PermitFrom != null)
                {
                    PermitQuery = PermitQuery.Where(a => a.EntryEmpDate >= PermitFrom
                  && a.EntryEmpDate <= PermitTo);
                }

                if (CompanyName != null && CompanyName.Trim() != "")
                    PermitQuery = PermitQuery.Where(a => a.CompanyName.Contains(CompanyName));

                if (ContractorName != null && ContractorName.Trim() != "")
                    PermitQuery = PermitQuery.Where(a => a.ContractorName.Contains(ContractorName));

                if (EntryEmpNumber != null && EntryEmpNumber != 0)
                    PermitQuery = PermitQuery.Where(a => a.EntryEmpNumber == EntryEmpNumber);

                var result = PermitQuery.Include(a => a.PermitsDevices).Include(a => a.PermitPeople).Include(a => a.PermitDocs).ToList();


                List<PermitDto> permitDto = _mapper.Map<List<PermitDto>>(result);

                foreach (var item in permitDto.ToList())
                {
                    foreach (var i in item.PermitDocs)
                    {
                        if (i.DocPath != null)
                        i.DocPath = Path.Combine(_configuration["AttachementsUrl"], i.DocPath); 
                    }

                }
                return Ok(permitDto);
            }
            catch (Exception ex)
            {
                _logger.LogError("In GetPermit:" + ex.Message);
                return BadRequest();
            }

        }


        //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<List<PermitDto>>> GetPermitByUser(int empnumber,long? ID, DateTime? PermitFrom, DateTime? PermitTo, int? Branch_ID, int? Department_ID, int? DepartmentSectionID, string? ContractorName, string? CompanyName, int? EntryEmpNumber, int? Status)
        {
            try
            {
                Employee emp = _dbContext.Employees.Where(a => a.Number == empnumber).ToList().FirstOrDefault();

                IQueryable<Permit> PermitQuery = _dbContext.Permits.Where(a => a.Status != 2);

                //not query permision
                if (_dbContext.AccessPermits.Where(a => a.EmpNumber == empnumber && a.AccessType == 1).ToList().Count() <= 0)
                {
                    //PermitQuery = PermitQuery.Where(a => a.ApproveEmpNumber == empnumber || a.EntryEmpNumber == empnumber || a.SupervisorEmpNumber == empnumber);
                    PermitQuery = PermitQuery.Where(a => a.BranchId == emp.BranchId || a.DepartmentId == emp.DepartmentId || a.DepartmentSectionId == emp.DepartmentSectionId || a.ApproveEmpNumber == empnumber || a.EntryEmpNumber == empnumber || a.SupervisorEmpNumber == empnumber);
                }
                //query permision
                else
                {
                    var AccessType = _dbContext.AccessPermits.Where(a => a.EmpNumber == empnumber && a.AccessType == 1).ToList().FirstOrDefault();
                   
                    if (AccessType.ForBranchId != null)
                        PermitQuery = PermitQuery.Where(a => a.BranchId == AccessType.ForBranchId);

                    if (AccessType.ForDepartmentId != null)
                        PermitQuery = PermitQuery.Where(a => a.DepartmentId == AccessType.ForDepartmentId);

                    if (AccessType.ForDepartmentSectionId != null) 
                        PermitQuery = PermitQuery.Where(a => a.DepartmentSectionId == AccessType.ForDepartmentSectionId);
                }

                if (Status != null && Status != 0)
                    PermitQuery = PermitQuery.Where(a => a.Status == Status);

                if (DepartmentSectionID != null && DepartmentSectionID != 0)
                    PermitQuery = PermitQuery.Where(a => a.DepartmentSectionId == DepartmentSectionID);

                if (ID != null && ID != 0)
                    PermitQuery = PermitQuery.Where(a => a.Id == (long)ID);

                if (Department_ID != null && Department_ID != 0)
                    PermitQuery = PermitQuery.Where(a => a.DepartmentId == Department_ID);

                if (Branch_ID != null && Branch_ID != 0)
                    PermitQuery = PermitQuery.Where(a => a.BranchId == Branch_ID);

                if (PermitTo != null && PermitFrom != null)
                {
                    PermitQuery = PermitQuery.Where(a => a.EntryEmpDate >= PermitFrom
                  && a.EntryEmpDate <= PermitTo);
                }

                if (CompanyName != null && CompanyName.Trim() != "")
                    PermitQuery = PermitQuery.Where(a => a.CompanyName.Contains(CompanyName));

                //search value
                if (ContractorName != null && ContractorName.Trim() != "")
                    PermitQuery = PermitQuery.Where(a => a.ContractorName.Contains(ContractorName)
                    || a.CompanyName.Contains(ContractorName)
                    );

                if (EntryEmpNumber != null && EntryEmpNumber != 0)
                    PermitQuery = PermitQuery.Where(a => a.EntryEmpNumber == EntryEmpNumber);

                var result = PermitQuery.Include(a => a.PermitsDevices).Include(a => a.PermitPeople).Include(a => a.PermitDocs).ToList();


                List<PermitDto> permitDto = _mapper.Map<List<PermitDto>>(result);



                foreach (var item in permitDto.ToList())
                {
                    foreach (var i in item.PermitDocs)
                    {
                        if (i.DocPath != null)
                            i.DocPath = Path.Combine(_configuration["AttachementsUrl"], i.DocPath);
                    }

                }
                return Ok(permitDto);
            }
            catch (Exception ex)
            {
                _logger.LogError("In GetPermit:" + ex.Message);
                return BadRequest();
            }

        }


        //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<List<PermitDto>>> GetPendingApprovePermit()
        {
            try
            {
                IQueryable<Permit> PermitQuery = _dbContext.Permits.Where(a => a.Status != 2);
                PermitQuery = PermitQuery.Where(a => a.SupervisorEmpDate != null && a.Status == null );
                var result = PermitQuery.ToList();
                List<PermitDto> permitDto = _mapper.Map<List<PermitDto>>(result);
                return Ok(permitDto);
            }
            catch (Exception ex)
            {
                _logger.LogError("In GetPendingApprovePermit:" + ex.Message);
                return BadRequest();
            }
        }

        
        //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<List<DeviceStatusDto>>> GetDeviceStatus()
        {
            try
            {
                var DeviceStatus = _dbContext.DeviceStatus.ToList();
                return Ok(DeviceStatus);
            }
            catch (Exception ex)
            {
                _logger.LogError("In GetDeviceStatus:" + ex.Message);
                return BadRequest();
            }
        }

        //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<List<PermitDto>>> GetPendingSupervisorPermit(int userNumber)
        {
            try
            {
                var currentUser = _dbContext.Employees.Where(a => a.Number == userNumber).ToList().SingleOrDefault();
                IQueryable<Permit> PermitQuery = _dbContext.Permits.Where(a => a.Status != 2 && a.SupervisorEmpDate == null && a.SupervisorEmpNumber == currentUser.Number);
                var result = PermitQuery.ToList();
                List<PermitDto> permitDto = _mapper.Map<List<PermitDto>>(result);
                return Ok(permitDto);
            }
            catch (Exception ex)
            {
                _logger.LogError("In GetPendingSupervisorPermit:" + ex.Message);
                return BadRequest();
            }
        }

       //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<List<BranchDto>>> GetBranches()
        {
            try
            {
                var result = _mapper.Map<List<BranchDto>>(_dbContext.Branches.ToList());
                result.Add(new BranchDto() { Id = 0, NameAr = "غير محدد" ,NameEn="All" });
                return Ok(result.OrderBy(a=>a.Id).ToList());

                // return Ok (_mapper.Map<List<BranchDto>>(_dbContext.Branches.ToList()));

            }
            catch (Exception ex)
            {
                _logger.LogError("In GetBranches:" + ex.Message);
                return BadRequest();
            }
        }

       //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<List<DepartmentDto>>> GetDepartments()
        {
            try
            {
                var result = _mapper.Map<List<DepartmentDto>>(_dbContext.Departments.ToList());
                result.Add(new DepartmentDto() { Id = 0, Name = "غير محدد" });
                return Ok(result.OrderBy(a => a.Id).ToList());

            }
            catch (Exception ex)
            {
                _logger.LogError("In GetDepartments:" + ex.Message);
                return BadRequest();
            }
        }

       //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<List<DepartmentSectionDto>>> GetDepartmentsSection()
        {
            try
            {
                var result = _mapper.Map<List<DepartmentSectionDto>>(_dbContext.DepartmentSections.ToList());
                result.Add(new DepartmentSectionDto() { Id = 0, Name = "غير محدد" });
                return Ok(result.OrderBy(a => a.Id).ToList());
                // return Ok(_mapper.Map<List<DepartmentSectionDto>>(_dbContext.DepartmentSections.ToList()));

            }
            catch (Exception ex)
            {
                _logger.LogError("In GetDepartmentsSection:" + ex.Message);
                return BadRequest();
            }
        }

       //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<List<WorkTypeDto>>> Getworktypes()
        {
            try
            {
                var result = _mapper.Map<List<WorkTypeDto>>(_dbContext.WorkTypes.ToList());
               // result.Add(new WorkTypeDto() { Id = 0, WorkTypeName = "الكل" });
                return Ok(result.OrderBy(a => a.Id).ToList());

                // return Ok (_mapper.Map<List<BranchDto>>(_dbContext.Branches.ToList()));

            }
            catch (Exception ex)
            {
                _logger.LogError("In GetDepartmentsSection:" + ex.Message);
                return BadRequest();
            }
        }

       //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<List<EmployeeDto>>> GetEmployess(int userNumber)
        {
            try
            {
              var currentUser=  _dbContext.Employees.Where(a => a.Number == userNumber).ToList().SingleOrDefault();
                List < EmployeeDto > result = new List< EmployeeDto >();
                if (currentUser.BranchId == 1 )
                    result = _mapper.Map<List<EmployeeDto>>(_dbContext.Employees.Where(a => a.DepartmentId == currentUser.DepartmentId).ToList());
                else
                    result = _mapper.Map<List<EmployeeDto>>(_dbContext.Employees.Where(a=>a.BranchId == currentUser.BranchId).ToList());

                return Ok(result.OrderBy(a => a.Name).ToList());

                // return Ok (_mapper.Map<List<BranchDto>>(_dbContext.Branches.ToList()));

            }
            catch (Exception ex)
            {
                _logger.LogError("In GetEmployess:" + ex.Message);
                return BadRequest();
            }
        }







       //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<StrData>> GetBrancheName(int? id)
        {
            try
            {
                var result = _mapper.Map<List<BranchDto>>(_dbContext.Branches.Where(a=>a.Id == id).ToList());
                
                return Ok(new StrData() { Data = result[0].NameAr });

                // return Ok (_mapper.Map<List<BranchDto>>(_dbContext.Branches.ToList()));

            }
            catch (Exception ex)
            {
                _logger.LogError("In GetBrancheName:" + ex.Message);
                return new StrData();
            }


        }

       //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<StrData>> GetDepartmentName(int? id)
        {
            try
            {
 

                var result = _mapper.Map<List<DepartmentDto>>(_dbContext.Departments.Where(a => a.Id == id).ToList());
                return Ok(new StrData() { Data = result[0].Name });


            }
            catch (Exception ex)
            {
                _logger.LogError("In GetDepartmentName:" + ex.Message);
                return new StrData();
            }
        }

       //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<StrData>> GetDepartmentsSectionName(int? id)
        {
            try
            {
           
                var result = _mapper.Map<List<DepartmentSectionDto>>(_dbContext.DepartmentSections.Where(a => a.Id == id).ToList());
                return Ok(new StrData() { Data = result[0].Name });

            }
            catch (Exception ex)
            {
                _logger.LogError("In GetDepartmentsSectionName:" + ex.Message);
                return new StrData();
            }
        }

       //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<StrData>> GetworktypesName(long Permid)
        {
            try
            {
                var result = "";

                var PermitWorkTypes = _mapper.Map<List<PermitWorkTypeDto>>(_dbContext.PermitWorkTypes.Where(a => a.PermitId == Permid).ToList());
                foreach (var item in PermitWorkTypes)
                {
                    var x = _mapper.Map<List<WorkTypeDto>>(_dbContext.WorkTypes.Where(a => a.Id == item.WorkTypeId).ToList());
                    result = result + x[0].WorkTypeName + " ,";
                }
               
              
                return Ok(new StrData() { Data = result });

                // return Ok (_mapper.Map<List<BranchDto>>(_dbContext.Branches.ToList()));

            }
            catch (Exception ex)
            {
                _logger.LogError("In GetworktypesName:" + ex.Message);
                return new StrData();
            }
        }

       //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<StrData>> GetEmployesName(int? id)
        {
            try
            {
                var result = _mapper.Map<List<EmployeeDto>>(_dbContext.Employees.Where(a => a.Number == id).ToList());
             
                return Ok(new StrData() { Data = result[0].Name });
                // return Ok (_mapper.Map<List<BranchDto>>(_dbContext.Branches.ToList()));

            }
            catch (Exception ex)
            {
                _logger.LogError("In GetEmployesName:" + ex.Message);
                return new StrData();
            }
        }

        private string GetEmployesNamestr(int? id)
        {
            try
            {
                var result = _mapper.Map<List<EmployeeDto>>(_dbContext.Employees.Where(a => a.Number == id).ToList());

                return result[0].Name;
                // return Ok (_mapper.Map<List<BranchDto>>(_dbContext.Branches.ToList()));

            }
            catch (Exception ex)
            {
                _logger.LogError("In GetEmployesNamestr:" + ex.Message);
                return "";
            }
        }


       //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<StrData>> GetPermitStatus(int Permitid)
        {
            try
            {
                string result = "";
                var permit = _mapper.Map<List<PermitDto>>(_dbContext.Permits.Where(a => a.Id == Permitid).ToList()).FirstOrDefault();
                if (permit.Status == 0)
                    result = "مرفوض من " + this.GetEmployesNamestr(permit.ApproveEmpNumber);
                else if (permit.Status == 1)
                    result = " تم اعتماد التصريح من " + this.GetEmployesNamestr(permit.ApproveEmpNumber);
                else
                {
                    if (permit.supervisorEmpDate != null)
                        result = "تم مراجعته من   " +  this.GetEmployesNamestr(permit.supervisorEmpNumber);
                    else
                        result = "لم يتم مراجعه  حتي الان من  " + this.GetEmployesNamestr(permit.supervisorEmpNumber);

                }
                return Ok(new StrData() { Data = result});
            }
            catch(Exception ex)
            {
                _logger.LogError("In GetPermitStatus:" + ex.Message);
                return Ok(new StrData());
            }
        }


       //[Authorize]
        [HttpPost]
        [Route("[action]")]
        //[AllowAnonymous]
        public async Task<ActionResult<AccessPermitDto>> GetAccessPermits( int userNumber, int AccessType)
        {
            try
            {
                var result = _mapper.Map<List<AccessPermitDto>>(_dbContext.AccessPermits.Where(a => a.EmpNumber == userNumber).ToList());
                //حاله كل الموظفين
                if (AccessType == 2 && result.Count == 0)
                    return Ok(new AccessPermitDto() { IsAllowed = true, AccessType = 0, EmpNumber = 0, Id = 0 });

                result = _mapper.Map<List<AccessPermitDto>>(_dbContext.AccessPermits.Where(a => a.EmpNumber == userNumber && a.AccessType == AccessType).ToList());

                if (result.Count > 0)
                {
                    result.FirstOrDefault().IsAllowed = true;
                    return Ok(result.FirstOrDefault());
                }
                else
                    return Ok(new AccessPermitDto() { IsAllowed = false, AccessType = 0, EmpNumber = 0, Id = 0 });

            }
            catch (Exception ex)
            {
                _logger.LogError("In GetAccessPermits:" + ex.Message);
                return Ok(new AccessPermitDto() { IsAllowed = false, AccessType = 0, EmpNumber = 0, Id = 0 });
            }
        }






    }
}

using AutoMapper;
using Microsoft.AspNetCore.Authentication;
using Microsoft.IdentityModel.Tokens;
using SecurityPermits.Server.Controllers;
using SecurityPermits.Server.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.DirectoryServices.AccountManagement;
using System.Security.Principal;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Threading;

namespace SecurityPermits.Server.Services
{
    public class ScBankUserService: IScBankUserService
    {
        private readonly SecurityPermitsContext _dbContext;
       
        public ScBankUserService(SecurityPermitsContext dbContext)
        {
            _dbContext = dbContext;
          
        }
        
         public string? GetdomainUserNumber(IHttpContextAccessor _httpContextAccessor, ILogger<SecurityPermitsController> _logger)
        {
#if DEBUG
            return "22837";
#endif
            try
            {
                HttpContext c = _httpContextAccessor.HttpContext;
                var user1 = c.User;

                    string userName = user1.Identity.Name;
                    _logger.LogError("In userName:" + userName);
                    // _logger.LogError("In userName:" + windowsIdentity);
                    using (PrincipalContext context = new PrincipalContext(ContextType.Domain))
                    {
                        UserPrincipal user = UserPrincipal.FindByIdentity(context, IdentityType.SamAccountName, userName);
                        _logger.LogError("In user:" + user);
                        if (user != null)
                            return user.EmployeeId;
                    }
                    // }

                
            }
            catch (Exception ex)
            {
                _logger.LogError("In GetdomainUserNumber:" + ex);
                return "";
            }
            return "";

        }

        public string? GetdomainUserNumber(WindowsIdentity windowsIdentity, ILogger<SecurityPermitsController> _logger)
        {
        #if DEBUG
        return "22837";
        #endif



            try
            {
                // WindowsIdentity windowsIdentity = WindowsIdentity.GetCurrent();
                //WindowsIdentity windowsIdentity = WindowsIdentity.GetCurrent();
              //  WindowsIdentity windowsIdentity = HttpContext.User.Identity as WindowsIdentity;

                if (windowsIdentity != null)
                {
                    WindowsPrincipal windowsPrincipal = new WindowsPrincipal (windowsIdentity);
                    //if (windowsPrincipal.Identity.IsAuthenticated)
                    //{
                        string userName = windowsIdentity.Name;
                        _logger.LogError("In userName:" + userName);
                       // _logger.LogError("In userName:" + windowsIdentity);
                        using (PrincipalContext context = new PrincipalContext(ContextType.Domain))
                        {
                            UserPrincipal user = UserPrincipal.FindByIdentity(context, IdentityType.SamAccountName, userName);
                            _logger.LogError("In user:" + user);

                            if (user != null)
                                return user.EmployeeId;

                        }
                   // }

                }
            }
            catch (Exception ex)
            {
                _logger.LogError("In GetdomainUserNumber:" + ex);
                return "";
            }
            return "";


            // return "21857";
        }

 

    public System.Boolean ValidUser(UserDto input )
        {
            string EncryptedPassword = EncryptOneWay(input.passWord);
            var employee =  _dbContext.Employees.Where(a => a.Number == input.userNumber && a.Password == EncryptedPassword);

            if (employee.ToList().Count()> 0) return true;
            else return false;
        }

        private string GetUserName(UserDto input)
        {
            var employee = _dbContext.Employees.Where(a => a.Number == input.userNumber );

            if (employee.ToList().Count()> 0) return employee.FirstOrDefault().Name;
            else return "";
        }


        public string GenerateJwtToken(UserDto input )
        {
            string secretKey = "P@$$w0rdP@$$w0rdP@$$w0rdP@$$w0rd";
            string issuer = "SCBANK";
            string audience = "SCBANK";

            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
             new Claim("UserNumber", input.userNumber.ToString()),
             new Claim("UserName", GetUserName(input)),
             new Claim(JwtRegisteredClaimNames.Aud, audience)
            };

            var token = new JwtSecurityToken(
                issuer: issuer,
                audience: audience,
                claims: claims,
                expires: DateTime.UtcNow.AddHours(1),
                signingCredentials: credentials
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        private int decryptusernumber(string x)
        {
            string y = "";
            for (int i = 3; i <= x.Length; i = i + 3)
            {
                string s = x.Substring(i - 3, 3);
                switch (s)
                {
                    case "5zx":
                        y = y + "1";
                        break;
                    case "9qs":
                        y = y + "2";
                        break;
                    case "1ny":
                        y = y + "3";
                        break;
                    case "7so":
                        y = y + "4";
                        break;
                    case "3ha":
                        y = y + "5";
                        break;
                    case "8mn":
                        y = y + "6";
                        break;
                    case "4yz":
                        y = y + "7";
                        break;
                    case "6dd":
                        y = y + "8";
                        break;
                    case "0qa":
                        y = y + "9";
                        break;
                    case "2ad":
                        y = y + "0";
                        break;

                }
            }
            return  int.Parse( y);
        }
        private static string EncryptOneWay(string Text)
        {
            byte[] pass = Encoding.ASCII.GetBytes(Text);
            MD5 md5 = new MD5CryptoServiceProvider();
            return Encoding.ASCII.GetString(md5.ComputeHash(pass));
        }

        public string GetPermitBody(Permit permit, List<PermitPerson> persons, List<PermitsDevice> devices, List<DeviceStatus> DeviceStatus ,string branch, string depart, string departsec, string emp, string worktypes, string permitStatus, string id, string permitFrom, string permitTo, string contractorName, string companyName)
        {

            string body = @"
  <div #printContent style='text -align: center; border: 2px solid #333; padding: 20px; border-radius: 10px; background-color: #f9f9f9;'>



    <div style = 'text-align: center;'>
    <h1 style = 'font-weight: bold; margin-bottom: 20px; color: #333;'> انظمة التصاريح الامنية والالكترونية </h1>
    <h2 style = 'font-weight: bold; margin-bottom: 20px; color: #333;'>  تصريح امني </h2>
    </div>

    <div style = 'text-align: center;' >
      " + permitStatus + @"
    </div>


    <div style = 'text-align: right; margin-bottom: 20px;'>
      <p><strong style = 'color: #333;'> رقم التصريح </strong> " + id + @" </p>
      <p><strong style = 'color: #333;'> التصريح من </strong> " + permitFrom + @"  <strong style = 'color: #333;'> الى:</strong> " + permitTo + @" </p>
      <p><strong style = 'color: #333;'> حالة الفرع </strong> " + permit.BranchStatus + @" </p>
      <p><strong style = 'color: #333;'> الفرع </strong> " + branch + @" </p>
      <p><strong style = 'color: #333;'> الادارة </strong> " + depart + @" </p>
      <p><strong style = 'color: #333;'> الادارة الفرعية </strong> " + departsec + @" </p>
      <p><strong style = 'color: #333;'> المقاول </strong> " + contractorName + @" </p>
      <p><strong style = 'color: #333;'> الشركة </strong> " + companyName + @" </p>
      <p><strong style = 'color: #333;'> اسم الموظف </strong> " + emp + @" </p>
      <p><strong style = 'color: #333;'> الرقم الداخلي للموظف</strong> " + permit.EntryEmpPhone + @" </p>
      <p><strong style = 'color: #333;'> رقم التليفون المحمول</strong> " + permit.EntryEmpMobile + @" </p>
      <p><strong style = 'color: #333;'> نوع الأعمال المطلوبة</strong> " + worktypes + @" </p>
      <p><strong style = 'color: #333;'> حالة التصريح الامني</strong> " + permitStatus + @" </p>
    </div>

    <div style = 'border: 2px solid #333; border-radius: 10px; margin-bottom: 20px; overflow-x: auto;'>
      <table style = 'width: 100%; text-align: right; border-collapse: collapse;'>
        <thead style = 'background-color: #333; color: #fff;'>
          <tr>
            <th style = 'padding: 10px;'> ملاحظات </th>
            <th style = 'padding: 10px;'> الحالة </th>
            <th style = 'padding: 10px;'> تاريخ العودة الفعلي</th>
            <th style = 'padding: 10px;'> تاريخ العودة المتوقع</th>
            <th style = 'padding: 10px;'> تاريخ سحب الجهاز</th>
            <th style = 'padding: 10px;'> سيريال </th>
            <th style = 'padding: 10px;'> نوع </th>
            <th style = 'padding: 10px;'> عدد </th>
            <th style = 'padding: 10px;'> معدات عبارة عن</th>
          </tr>
        </thead>
        <tbody>
";

            foreach (PermitsDevice item in devices)
            {
                string ReturnDateSt = "";
                string ExpectedReturnDateSt = "";
                string OutDateSt = "";

                if (item.ReturnDate != null)
                    ReturnDateSt = item.ReturnDate.Value.ToString("yyyy-MM-dd");

                if (item.ExpectedReturnDate != null)
                    ExpectedReturnDateSt = item.ExpectedReturnDate.Value.ToString("yyyy-MM-dd");


                if (item.OutDate != null)
                    OutDateSt = item.OutDate.Value.ToString("yyyy-MM-dd");


                body = body + @"
                    <tr style = 'background-color: #f9f9f9;'>
                    <td style = 'padding: 10px;'> " + item.ReturnDeviceNote + @"</td>
                    <td style = 'padding: 10px;'> " + DeviceStatus.Where(a=>a.Id== item.DeviceStatus).FirstOrDefault().DeviceReturnStateName + @"</td>
                    <td style = 'padding: 10px;'> " + ReturnDateSt + @"</td>
                    <td style = 'padding: 10px;'> " + ExpectedReturnDateSt + @"</td>
                    <td style = 'padding: 10px;'> " + OutDateSt + @"</td>
                    <td style = 'padding: 10px;'> " + item.DeviceSerialNo + @"</td>
                    <td style = 'padding: 10px;'> " + item.DeviceType + @"</td>
                    <td style = 'padding: 10px;'> " + item.DeviceCount + @"</td>
                    <td style = 'padding: 10px;'> " + item.DeviceName + @"</td>
                    </tr>";
            }

            body = body + @"
        </tbody>
      </table>
    </div>

    <div style = 'border: 2px solid #333; border-radius: 10px; overflow-x: auto;'>
      <table style = 'width: 100%; text-align: right; border-collapse: collapse;'>
        <thead style = 'background-color: #333; color: #fff;'>
          <tr>
            <th style = 'padding: 10px;'> الرقم القومي </th>
            <th style = 'padding: 10px;'> الاسم </th>
          </tr>
        </thead>
        <tbody>
";

            foreach (PermitPerson item in persons)
            {
            body = body + @"
                    <tr style = 'background-color: #f9f9f9;'>
                        <td style = 'padding: 10px;'> "+ item.NationalId + @"</td>
                        <td style = 'padding: 10px;'> "+ item.PersonName + @"</td>
                    </tr>";
            }

body = body + @"
        </tbody>
      </table>
    </div>
  </div>
</div>
";

            return body;
        }



        //        public string GetPermitBody(string id, string permitFrom, string permitTo, string contractorName, string companyName )
        //        {
        //            string body = @"
        //  <div #printContent style='text-align: center; border: 2px solid #333; padding: 20px; border-radius: 10px; background-color: #f9f9f9;'>
        //    <div style='text-align: center;'>
        //    <h2 style='font-weight: bold; margin-bottom: 20px; color: #333;'>تم اعتماد هذا التصريح الامني</h2>
        //    </div>
        //    <div style='text-align: right; margin-bottom: 20px;'>
        //      <p><strong style='color: #333;'>رقم التصريح  </strong>  </p>
        //      <strong style='color: #333;'>  '" +  id + @"</strong>  
        //      <p><strong style='color: #333;'>التصريح من  </strong>  </p>
        //      <strong style='color: #333;'>  '" + permitFrom + @"</strong>  
        //      <p><strong style='color: #333;'>الي  </strong>  </p>
        //      <strong style='color: #333;'>  '" + permitTo + @"</strong>  
        //      <p><strong style='color: #333;'>المقاول  </strong>  </p>
        //      <strong style='color: #333;'>  '" + contractorName + @"</strong>  
        //      <p><strong style='color: #333;'>الشركة  </strong>  </p>
        //      <strong style='color: #333;'>  '" + companyName + @"</strong>     
        //    </div>
        //        <a href='https://scbworkflow.scb.local:4448/SecurityPermitsSite/#/component/SecurityPermits/Printpermit?id=" +  id.ToString() + @"' style='margin-top: 20px; padding: 10px 20px; background-color: #333; color: #fff; border: none; border-radius: 5px; cursor: pointer;'>طباعة التصريح</a>
        //  </div>
        //</div>
        //";

        //            return body;
        //        }

    }
}

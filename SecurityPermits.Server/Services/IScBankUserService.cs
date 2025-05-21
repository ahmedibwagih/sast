using AutoMapper;
using Microsoft.IdentityModel.Tokens;
using SecurityPermits.Server.Controllers;
using SecurityPermits.Server.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Security.Principal;
using System.Text;

namespace SecurityPermits.Server.Services
{
    public interface IScBankUserService
    {
        public Boolean ValidUser(UserDto input);
        public string GenerateJwtToken(UserDto input);
        public string? GetdomainUserNumber(WindowsIdentity windowsIdentity, ILogger<SecurityPermitsController> logger);
        string? GetdomainUserNumber(IHttpContextAccessor _httpContextAccessor, ILogger<SecurityPermitsController> _logger);
        string GetPermitBody(Permit permit, List<PermitPerson> persons, List<PermitsDevice> devices, List<DeviceStatus> DeviceStatus, string branch, string depart, string departsec, string emp, string worktypes, string permitStatus, string id, string permitFrom, string permitTo, string contractorName, string companyName);
    }
}

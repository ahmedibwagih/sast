using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.Sec;
using Application.Core.DTOs.WorkFlow;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.Sec;

namespace Application.Core.Services.LookUps
{
    public interface ISecurityService : IService<SecUser, SecUserDto, SecUserCreateDto, SecUserDto, SecUserDto>
    {

        Task<bool> SetSeeNotifcation(int userid);
        Task<ExchangeResponse<List<RequestResult>>> GetNotifcationRequest(int userid);
        Task<ExchangeResponse<SecUserDto>> CreateNewUser(SecUserCreateDto input, int userid);
        Task<ExchangeResponse<string>> GenerateJwtTokenAsync(SecUserLoginDto input);
        Task<ExchangeResponse<List<ExBranchDto>>> GetBranches(int currentUserId);
        Task<ExchangeResponse<string>> ChangePassword(int userid, string oldPassword, string newPassword);
        Task<ExchangeResponse<List<SecFormDto>>> GetUserForms(int userId);
        Task<ExchangeResponse<List<SecFormsFunctionDto>>> GetUserFunctions(int userId, int formId);
        Task<ExchangeResponse<List<SecFormsFunctionDto>>> GetAllFunctions(int formId, int permissionTypeId);
        Task<ExchangeResponse<List<SecFormDto>>> GetAllForms(int permissionTypeId);

       Task<ExchangeResponse<SecUserDto>> GetUserData(int userid);
        Task<ExchangeResponse<List<SecUserDto>>> GetUsersForWorkFlow(int RequestTypeId);
        Task<ExchangeResponse<List<SecUserDto>>> GetUsers();

        Task<ExchangeResponse<SecUsersFormDto>> AllowpermissionTypeForm(int permissionType, int formId, bool isChecked);

        Task<ExchangeResponse<SecUsersFunctionDto>> AllowpermissionTypeFunction(int permissionType, int formFunctionID, bool isChecked, string FunText);
        Task<ExchangeResponse<List<SecPermissionTypeDto>>> GetPermissionType();

        Task<SecPermissionTypeDto> UpdatePermissionType(SecPermissionTypeDto input);
        Task<ExchangeResponse<SecPermissionTypeDto>> CreatePermissionType(SecPermissionTypeDto input);
        Task<SecPermissionTypeDto> GetPermissionTypeById(int PermissionTypeId);
        Task<PagingResultDto<SecUserDto>> GetUserAllPaging(PagingInputDto pagingInputDto);


        Task<ExchangeResponse<List<ExBranchDto>>> GetpermissionTypeBranches(int permissionTypeId);
        Task<ExchangeResponse<SecPermissionTypeBranchesDto>> AllowpermissionTypeBranche(int permissionTypeId, int branhId, bool isChecked);

        Task<ExchangeResponse<ActivationKeysDto>> CreateActivationKey(ActivationKeysDto input) ;

        Task<ExchangeResponse<ActivationKeysData>> GetActivationData();

        Task<ExchangeResponse<string>> UpdateImageProfile(int currentUserId, string imagePath);

        }
}

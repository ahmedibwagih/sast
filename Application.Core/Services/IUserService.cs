﻿//
//
//using Core.DTOs;
//using Core.Other;

//namespace Application.Core.Services
//{
//    public interface IUserService
//    {
//        Task<PagingResultDto<UserAllDto>> GetAll(PagingInputDto pagingInputDto);
//        Task<UserDto> GetById(string id);
//        Task<UserDto> GetByIdLight(string id);
//        Task Delete(string id);
//        Task UndoDelete(string id);
//        Task<UserDto> CreateUser(UserDto input);
//        Task<UserDto> CreateUserWithoutRoles(UserDto input);
//        Task<UserUpdateDto> Update(UserUpdateDto input);

//        Task<SessionDto> GetUserSession();
//        Task<UserAllDto[]> GetUsersPermission(string permission);


//        Task<PagingResultDto<UserDto>> GetUsers(PagingInputDto pagingInputDto);
//        Task<bool> ResetPassword(ResetPasswordDto input);
//        Task<UserDto> UpdateUser(UserDto input);
//       // Task<bool> CompleteForgetPassword(string userId, string newPassword);


//    }
//}

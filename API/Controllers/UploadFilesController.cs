using System.Threading.Tasks;
using Application.Core.DTOs;
using Application.Core.DTOs.Clients;
using Application.Core.DTOs.LookUps;

using Application.Core.Services;
using Application.Core.Services.Client;
using Application.Core.Services.LookUps;
using Application.Services;
using Application.Services.LookUps;
using Core;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Other;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.ChangeTracking.Internal;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadFilesController : ControllerBase
    {

        private readonly IExClientService service;
        private readonly AppSettings AppSettings;

        public UploadFilesController(IExClientService service, AppSettings appSettings)
        {
            this.service = service;
            this.AppSettings = appSettings;

        }


        [HttpPost]
        [Route("[action]")]
        ////[AllowAnonymous]
        public async Task<ExchangeResponse<FileInfoDto>>  UploadFiles( IFormFile file, UploadFileTypeEnum type)
        {
            try
            {

                if (file == null)
                    return new ExchangeResponse<FileInfoDto> { Status = ResponseEnum.Fail, Result = null, Notes = $"لابد من اختير الملف المناسب" };

                var fileName = file.FileName;
                string newfileName = Guid.NewGuid().ToString() + Path.GetExtension(fileName);
                // var filePath = Path.Combine(Directory.GetCurrentDirectory(), "uploads", fileName);
                if (!Directory.Exists(AppSettings.Attachment.Path + @"\" + type.ToString()))
                {
                    Directory.CreateDirectory(AppSettings.Attachment.Path + @"\" + type.ToString());
                }

                var filePath = Path.Combine(AppSettings.Attachment.Path + @"\" + type.ToString(), newfileName);
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }

                return new ExchangeResponse<FileInfoDto> { Status = ResponseEnum.Ok, Result = new FileInfoDto() { Path = @"\" + type.ToString() + @"\" + newfileName } };


            }
            catch (Exception ex)
            {
                return new ExchangeResponse<FileInfoDto> { Status = ResponseEnum.Fail, Result = null,Notes= $"خطا في رفع الملف: {ex.Message}"};

            }

            return new ExchangeResponse<FileInfoDto> { Status = ResponseEnum.Fail, Result = null, Notes = $"خطا في رفع الملف" };

        }

    }
}

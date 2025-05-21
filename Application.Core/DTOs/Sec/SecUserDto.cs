using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Core.DTOs;
using Core.Entities.others;
using Core.Entities.Sec;

namespace Application.Core.DTOs.Sec
{
    public partial class SecUserDto : EntityDto
    {
        [Key]
        public int UserId { get; set; }

        public int? PermissionTypeId { get; set; }

        public string UserCode { get; set; }
        
        public string UserNameEn { get; set; }

        public string UserNameAr { get; set; }

        public string LoginName { get; set; }

        public string Password { get; set; }

        public bool Enabled { get; set; }
        public DateTime? LastNotifcationDate { get; set; }
        public DateTime? CreatedDate { get; set; }

        public string ThemeName { get; set; }

        public bool IsSupervisor { get; set; }

        public bool LiveExchange { get; set; }

        public int? BranchId { get; set; }

        public string LocalIpaddress { get; set; }

        public string OnlineStatus { get; set; }
        public string PermissionTypeName { get; set; }
        public string branchName { get; set; }
        public string? ImagePath { get; set; }
        public virtual ICollection<UserSettingDto> UserSettings { get; set; } = new List<UserSettingDto>();



    }
}

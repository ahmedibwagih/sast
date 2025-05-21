using Core.DTOs;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
namespace Application.Core.DTOs.Sec
{

    public partial class SecUsersFormDto : EntityDto
    {
        [Key]
        public int Id { get; set; }

        public int permissionTypeId { get; set; }

        public int FormId { get; set; }

        public bool Selected { get; set; }

    }
}

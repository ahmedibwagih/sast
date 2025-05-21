using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Core.DTOs;
using Core.Entities.others;

namespace Application.Core.DTOs.Sec
{
    public partial class SecUserLoginDto
    {
        public string LoginName { get; set; }
        public string Password { get; set; }
       // public string? MACaddress { get; set; }

    }
}

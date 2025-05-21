using Core.DTOs;
using Core.Entities.others;
using System;
using System.Collections.Generic;
namespace Application.Core.DTOs.Account;

public partial class AJvtypeDto : EntityDto
{
    public int JvtypeId { get; set; }

    public string JvtypeNameEn { get; set; }

    public string JvtypeNameAr { get; set; }

}



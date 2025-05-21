using Core.DTOs;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.Sec;

public partial class SecPermissionTypeBranchesDto : EntityDto
{
    //public int ID { get; set; }
    public int PermissionTypeId { get; set; }
    public int BranchId { get; set; }

    public bool Selected { get; set; }
}

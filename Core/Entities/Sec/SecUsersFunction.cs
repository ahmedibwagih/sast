using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.Sec;

public partial class SecUsersFunction
{
    [Key]
    public int Id { get; set; }

    public int PermissionTypeId { get; set; }

    public int FormFunctionId { get; set; }

    public bool Selected { get; set; }

    public string FunValue { get; set; }

    public virtual SecFormsFunction FormFunction { get; set; }

    public virtual SecPermissionType PermissionType { get; set; }
}

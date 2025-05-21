using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.Sec;

public partial class SecUsersForm
{
    [Key]
    public int Id { get; set; }

    public int PermissionTypeId { get; set; }

    public int FormId { get; set; }

    public bool Selected { get; set; }

    public virtual SecForm Form { get; set; }

    public virtual SecPermissionType PermissionType { get; set; }
}

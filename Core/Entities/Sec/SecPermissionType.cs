using System;
using System.Collections.Generic;

namespace Core.Entities.Sec;

public partial class SecPermissionType
{
    public int PermissionTypeId { get; set; }

    public string PermissionTypeNameEn { get; set; }

    public string PermissionTypeNameAr { get; set; }


    public virtual ICollection<SecUser> SecUsers { get; set; } = new List<SecUser>();
    public virtual ICollection<SecUsersForm> SecUsersForms { get; set; } = new List<SecUsersForm>();
    public virtual ICollection<SecUsersFunction> SecUsersFunctions { get; set; } = new List<SecUsersFunction>();
}

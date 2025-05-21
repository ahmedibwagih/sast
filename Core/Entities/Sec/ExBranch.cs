using System;
using System.Collections.Generic;

namespace Core.Entities.Sec;

public partial class ExBranch
{
    public int BranchId { get; set; }

    public string BranchCode { get; set; }

    public string BranchNameEn { get; set; }

    public string BranchNameAr { get; set; }

    public int? AccountId { get; set; }

    public int? ManagerId { get; set; }

    public virtual ICollection<SecUser> SecUsers { get; set; } = new List<SecUser>();
}

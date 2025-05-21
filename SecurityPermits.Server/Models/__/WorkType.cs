using System;
using System.Collections.Generic;

namespace SecurityPermits.Server.Models;

public partial class WorkType
{
    public long Id { get; set; }

    /// <summary>
    /// انواع الاعمال المطلوبة
    /// </summary>
    public string? WorkTypeName { get; set; }

    public virtual ICollection<PermitWorkType> PermitWorkTypes { get; set; } = new List<PermitWorkType>();
}

using System;
using System.Collections.Generic;

namespace Core.Entities.Account;

public partial class ACashFlowStatus
{
    public int StatusId { get; set; }

    public string StatusNameEn { get; set; }

    public string StatusNameAr { get; set; }

    public virtual ICollection<ACashFlow> ACashFlows { get; set; } = new List<ACashFlow>();
}

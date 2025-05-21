using System;
using System.Collections.Generic;

namespace SecurityPermits.Server.Models;

public partial class PermitWorkType
{
    public long Id { get; set; }

    public long? PermitId { get; set; }

    public long? WorkTypeId { get; set; }

    public virtual Permit? Permit { get; set; }

    public virtual WorkType? WorkType { get; set; }
}

using System;
using System.Collections.Generic;

namespace SecurityPermits.Server.Models;

public partial class PermitDoc
{
    public long Id { get; set; }

    public long PermitId { get; set; }

    public string? DocName { get; set; }

    public string? DocPath { get; set; }

    public virtual Permit Permit { get; set; } = null!;
}

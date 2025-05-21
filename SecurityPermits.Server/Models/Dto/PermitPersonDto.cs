using System;
using System.Collections.Generic;

namespace SecurityPermits.Server.Models;

public partial class PermitPersonDto
{
    public long Id { get; set; }

    public long PermitId { get; set; }

    public string PersonName { get; set; } = null!;

    public string? NationalId { get; set; }

}

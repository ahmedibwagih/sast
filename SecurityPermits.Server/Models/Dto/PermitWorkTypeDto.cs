using System;
using System.Collections.Generic;

namespace SecurityPermits.Server.Models;

public partial class PermitWorkTypeDto
{
    public long Id { get; set; }

    public long? PermitId { get; set; }

    public long? WorkTypeId { get; set; }


}

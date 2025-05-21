using System;
using System.Collections.Generic;

namespace SecurityPermits.Server.Models;

public partial class WorkTypeDto
{
    public long Id { get; set; }

    /// <summary>
    /// انواع الاعمال المطلوبة
    /// </summary>
    public string? WorkTypeName { get; set; }

    public Boolean Checked { get; set; }

}

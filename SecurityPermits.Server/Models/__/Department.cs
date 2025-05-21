using System;
using System.Collections.Generic;

namespace SecurityPermits.Server.Models;

public partial class Department
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public int? BranchId { get; set; }
}

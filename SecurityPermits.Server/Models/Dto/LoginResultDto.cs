using System;
using System.Collections.Generic;

namespace SecurityPermits.Server.Models;

public partial class LoginResultDto
{

    public string? Token { get; set; }

    public string? UserNumber { get; set; }

    public string? UserName { get; set; }
}

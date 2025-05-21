using System;
using System.Collections.Generic;

namespace SecurityPermits.Server.Models;

public partial class DeviceStatus
{
    public long Id { get; set; }

    /// <summary>
    /// حاله الجهاز المرتجع
    /// </summary>
    public string? DeviceReturnStateName { get; set; }

}

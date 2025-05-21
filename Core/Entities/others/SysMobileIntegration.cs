using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.others;

public partial class SysMobileIntegration
{
    [Key]
    public int Id { get; set; }

    public string ClientIdc { get; set; }

    public bool IsEnabled { get; set; }

    public string ApiUrl { get; set; }
}

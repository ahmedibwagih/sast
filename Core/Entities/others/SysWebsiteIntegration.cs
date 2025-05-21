using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.others;

public partial class SysWebsiteIntegration
{
    [Key]
    public int Id { get; set; }

    public bool IsEnabled { get; set; }

    public string WebsiteUrl { get; set; }
}

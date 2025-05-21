using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.others;

public partial class SysReplicationSetting
{
    [Key]
    public int Id { get; set; }

    public bool IsEnabled { get; set; }

    public bool IsBranch { get; set; }

    public string BranchName { get; set; }

    public string ServiceUrl { get; set; }

    public string AccessKeyId { get; set; }

    public string SecretAccessKey { get; set; }

    public string QueueUrl { get; set; }
}

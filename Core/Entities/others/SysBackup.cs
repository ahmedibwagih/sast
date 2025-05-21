using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Core.Entities.Sec;

namespace Core.Entities.others;

public partial class SysBackup
{
    [Key]
    public int BackupId { get; set; }

    public string BackupFilePath { get; set; }

    public DateTime BackupDateTime { get; set; }

    public DateTime BackupAssemblyDate { get; set; }

    public int UserId { get; set; }

    public virtual SecUser User { get; set; }
}

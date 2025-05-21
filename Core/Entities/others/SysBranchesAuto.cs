using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.others;

public partial class SysBranchesAuto
{
    [Key]
    public int Id { get; set; }

    public DateTime ScheduleTime { get; set; }

    public string Remarks { get; set; }
}

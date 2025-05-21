using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.others;

public partial class Privilage2
{
    [Key]
    public long Id { get; set; }

    public long? ScreensId { get; set; }

    public long? PrivilageTypeId { get; set; }

    public long JobId { get; set; }

    public int State { get; set; }
}

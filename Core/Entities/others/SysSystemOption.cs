using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.others;

public partial class SysSystemOption
{
    [Key]
    public int Id { get; set; }

    public bool ClientHasAttachments { get; set; }

    public bool OptimizeImages { get; set; }

    public bool NotifySuppliers { get; set; }

    public bool MembershipProgram { get; set; }

    public bool Isil { get; set; }
}

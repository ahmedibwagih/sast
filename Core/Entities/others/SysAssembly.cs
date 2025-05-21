using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.others;

public partial class SysAssembly
{
    [Key]
    public int AssemblyId { get; set; }

    public string AssemblyName { get; set; }

    public byte[] AssemblyFile { get; set; }

    public DateTime AssemblyModifiedDate { get; set; }
}

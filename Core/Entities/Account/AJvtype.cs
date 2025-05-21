using Core.Other;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.others;

public partial class AJvtype
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int JvtypeId { get; set; }

    public string JvtypeNameEn { get; set; }

    public string JvtypeNameAr { get; set; }

    public virtual ICollection<AJv> AJvs { get; set; } = new List<AJv>();
}

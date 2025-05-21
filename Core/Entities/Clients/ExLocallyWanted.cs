using Core.Other;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities.others;

public partial class ExLocallyWanted
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Filter]
    public int LocallyWantedId { get; set; }

    public Boolean IsDeleted { get; set; }

    [Filter]
    public string Name { get; set; }
    [Filter]
    public string Nid { get; set; }
}

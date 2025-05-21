using Core.Other;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.Sec;

public partial class ActivationKeys
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int ActivationKeyId { get; set; }
    public string key { get; set; }
    public DateTime date { get; set; }

}

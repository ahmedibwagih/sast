using Core.Entities.Clients;
using Core.Other;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities.LookUps;

public partial class ClientActivities
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int ClientActivityID { get; set; }

    [Filter]
    public string ActivityNameAr { get; set; }

    [Filter]
    public string ActivityNameEn { get; set; }


}

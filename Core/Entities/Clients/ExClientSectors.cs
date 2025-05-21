using Core.Other;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.Clients;

public partial class ExClientSectors
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Filter]
    public int ClientSectorId { get; set; }

    [Filter]
    public string ClientSectorNameEn { get; set; }
    [Filter]
    public string ClientSectorNameAr { get; set; }

    public string Desc { get; set; } 
}

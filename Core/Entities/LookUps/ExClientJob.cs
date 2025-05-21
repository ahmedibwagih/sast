using Core.Entities.Clients;
using Core.Other;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities.LookUps;

public partial class ExClientJob
{
    [Filter]
    public int JobId { get; set; }
    

    public Boolean IsDeleted { get; set; }
    public string JobCode { get; set; }
    [Filter]
    public string JobName { get; set; }

    [Filter]
    public string JobNameEn { get; set; }

    public int SeverityId { get; set; }


    public int? ClientSectorId { get; set; }
    [ForeignKey("ClientSectorId")]
    public ExClientSectors ExClientSectors { get; set; }

    public virtual ExClientJobSeverity Severity { get; set; }
}

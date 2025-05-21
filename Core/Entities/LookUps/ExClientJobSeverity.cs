using Core.Other;
using System;
using System.Collections.Generic;

namespace Core.Entities.LookUps;

public partial class ExClientJobSeverity
{
    public int SeverityId { get; set; }
    [Filter]

    public Boolean IsDeleted { get; set; }
    public string SeverityNameEn { get; set; }
    [Filter]
    public string SeverityNameAr { get; set; }

    public virtual ICollection<ExClientJob> ExClientJobs { get; set; } = new List<ExClientJob>();

    public virtual ICollection<ExCountry> ExCountries { get; set; } = new List<ExCountry>();
}

using Core.Entities.Clients;
using Core.Other;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.LookUps;

public partial class ExCountry
{
    [Filter]
    public int CountryId { get; set; }
    [Filter]

    public Boolean IsDeleted { get; set; }
    public string CountryNameEn { get; set; }
    [Filter]
    public string CountryNameAr { get; set; }

    public int SeverityId { get; set; }

    public decimal? OutLimit { get; set; }

    public ActiveEnum IsActve { get; set; }

    public virtual ICollection<ExClient> ExClientBirthCountries { get; set; } = new List<ExClient>();

    public virtual ICollection<ExClient> ExClientCountries { get; set; } = new List<ExClient>();

    public virtual ICollection<ExIdsource> ExIdsources { get; set; } = new List<ExIdsource>();

    public virtual ICollection<ExSupplier> ExSuppliers { get; set; } = new List<ExSupplier>();

    public virtual ExClientJobSeverity Severity { get; set; }
}

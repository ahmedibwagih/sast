using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Core.Entities.Clients;
using Core.Other;

namespace Core.Entities.LookUps;

public partial class ExIdsource
{
    [Filter]
    public int IdsourceId { get; set; }
    [Filter]

    public Boolean IsDeleted { get; set; }
    public string IdsourceNameEn { get; set; }
    [Filter]
    public string IdsourceNameAr { get; set; }

    public int CountryId { get; set; }



    public virtual ExCountry Country { get; set; }

    public virtual ICollection<ExClient> ExClientBirthCities { get; set; } = new List<ExClient>();

    public virtual ICollection<ExClient> ExClientIdsourceNavigations { get; set; } = new List<ExClient>();
}

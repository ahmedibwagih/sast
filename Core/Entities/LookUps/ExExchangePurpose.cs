using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Core.Entities.Clients;
using Core.Other;

namespace Core.Entities.LookUps;

public partial class ExExchangePurpose
{
    [Filter]
    public int ExchangePurposeId { get; set; }
    [Filter]

    public Boolean IsDeleted { get; set; }
    public string ExchangePurposeNameEn { get; set; }
    [Filter]
    public string ExchangePurposeNameAr { get; set; }

    public virtual ICollection<ExClient> ExClients { get; set; } = new List<ExClient>();
}

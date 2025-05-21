using System;
using System.Collections.Generic;
using Core.Entities.Clients;
using Core.Other;

namespace Core.Entities.LookUps;

public partial class ExIncomeSource
{
    [Filter]
    public int IncomeSourceId { get; set; }
    [Filter]

    public Boolean IsDeleted { get; set; }
    public string IncomeSourceNameEn { get; set; }
    [Filter]
    public string IncomeSourceNameAr { get; set; }

    public virtual ICollection<ExClient> ExClients { get; set; } = new List<ExClient>();
}

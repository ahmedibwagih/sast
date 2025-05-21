using System;
using System.Collections.Generic;

namespace Core.Entities.Clients;

public partial class ExClientsType
{
    public int ClientTypeId { get; set; }


    public string ClientTypeNameEn { get; set; }

    public string ClientTypeNameAr { get; set; }

    public int? MonetaryAgencyReportId { get; set; }
}

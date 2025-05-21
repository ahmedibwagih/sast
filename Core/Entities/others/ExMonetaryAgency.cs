using System;
using System.Collections.Generic;

namespace Core.Entities.others;

public partial class ExMonetaryAgency
{
    public int MonetaryAgencyReportId { get; set; }

    public string MonetaryAgencyReportName { get; set; }

    public int OrderBy { get; set; }
}

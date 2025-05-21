using System;
using System.Collections.Generic;

namespace Core.Entities.TRN_Invoices;

public partial class ExFormingStatus
{
    public int FormingStatusId { get; set; }

    public string FormingStatusNameEn { get; set; }

    public string FormingStatusNameAr { get; set; }

    public bool RequireApproval { get; set; }

    public bool RequireReview { get; set; }
}

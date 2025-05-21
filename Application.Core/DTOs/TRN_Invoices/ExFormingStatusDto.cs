using Core.DTOs;
using System;
using System.Collections.Generic;

namespace Application.Core.DTOs.TRN_Invoices;

public partial class ExFormingStatusDto : EntityDto
{
    public int FormingStatusId { get; set; }

    public string FormingStatusNameEn { get; set; }

    public string FormingStatusNameAr { get; set; }

    public bool RequireApproval { get; set; }

    public bool RequireReview { get; set; }
}

using System;
using System.Collections.Generic;

namespace Core.Entities.TRN_WholeInvoices;

public partial class ExWholeInvoiceStatus
{
    public int StatusId { get; set; }

    public string StatusNameEn { get; set; }

    public string StatusNameAr { get; set; }

    public virtual ICollection<ExWholeInvoice> ExWholeInvoices { get; set; } = new List<ExWholeInvoice>();
}

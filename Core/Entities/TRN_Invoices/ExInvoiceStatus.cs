using System;
using System.Collections.Generic;

namespace Core.Entities.TRN_Invoices;

public partial class ExInvoiceStatus
{
    public int StatusId { get; set; }

    public string StatusNameEn { get; set; }

    public string StatusNameAr { get; set; }

    public virtual ICollection<ExInvoice> ExInvoices { get; set; } = new List<ExInvoice>();
}

using System;
using System.Collections.Generic;
using Core.Entities.TRN_WholeInvoices;

namespace Core.Entities.TRN_Invoices;

public partial class ExInvoicesType
{
    public int InvoiceTypeId { get; set; }

    public string InvoiceTypeNameEn { get; set; }

    public string InvoiceTypeNameAr { get; set; }

    public virtual ICollection<ExInvoice> ExInvoices { get; set; } = new List<ExInvoice>();

    public virtual ICollection<ExWholeInvoice> ExWholeInvoices { get; set; } = new List<ExWholeInvoice>();
}

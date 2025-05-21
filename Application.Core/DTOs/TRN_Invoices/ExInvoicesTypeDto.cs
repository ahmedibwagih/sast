using System;
using System.Collections.Generic;
using Core.DTOs;
using Core.Entities.TRN_WholeInvoices;

namespace Application.Core.DTOs.TRN_Invoices;

public partial class ExInvoicesTypeDto : EntityDto
{
    public int InvoiceTypeId { get; set; }

    public string InvoiceTypeNameEn { get; set; }

    public string InvoiceTypeNameAr { get; set; }
}

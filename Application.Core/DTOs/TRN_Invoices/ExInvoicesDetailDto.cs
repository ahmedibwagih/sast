using System;
using System.Collections.Generic;
using Core.DTOs;
using Core.Entities.LookUps;

namespace Application.Core.DTOs.TRN_Invoices;

public partial class ExInvoicesDetailDto : EntityDto
{
    public int InvoiceDetailId { get; set; }

    public int InvoiceId { get; set; }

    public int CurrencyId { get; set; }

    public decimal Amount { get; set; }

    public decimal ExRate { get; set; }
    public Boolean IsDeleted { get; set; }
}

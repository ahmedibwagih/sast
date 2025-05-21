using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Core.Entities.LookUps;
using Core.Other;

namespace Core.Entities.TRN_Invoices;

public partial class ExInvoicesDetail
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Filter]
    public int InvoiceDetailId { get; set; }

    public int InvoiceId { get; set; }

    public int CurrencyId { get; set; }

    public decimal Amount { get; set; }

    public decimal ExRate { get; set; }

    public virtual Currency Currency { get; set; }

    public virtual ExInvoice Invoice { get; set; }
    public Boolean IsDeleted { get; set; }
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.Clients;
using Core.Entities.TRN_Invoices;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Other;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.TRN_WholeInvoices;

public partial class ExWholeInvoice
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int InvoiceId { get; set; }
    public int BranchID { get; set; }
    [ForeignKey("BranchID")]
    public ExBranch ExBranch { get; set; }

    public int? UserId { get; set; }
    [ForeignKey("UserId")]
    public SecUser SecUser { get; set; }


    public int? TreasuryId { get; set; }
    [ForeignKey("TreasuryId")]
    public Treasury Treasury { get; set; }


    public int InvoiceNo { get; set; }

    public DateTime InvoiceDate { get; set; }

    public DateTime InvoiceTime { get; set; }

   // public int CashierId { get; set; }

    public int InvoiceTypeId { get; set; }

    public int SupplierId { get; set; }

    public int SupplierCurrencyId { get; set; }

    public decimal SupplierCurrencyExRate { get; set; }

    public int PaymentMethod { get; set; }

    public int? BankId { get; set; }

    public string Receptionist { get; set; }

    public string Remarks { get; set; }

    public decimal Paid { get; set; }

    public string? PaidCheckNo { get; set; }
    public decimal? PaidCash { get; set; }
    public decimal? PaidCheck { get; set; }
    public decimal? PaidUnderAccount { get; set; }

    public decimal Remain { get; set; }

    public int StatusId { get; set; }

    public bool IsNotified { get; set; }

    public int UpdatedCount { get; set; }

    public decimal AvTaxPercentage { get; set; }

    public decimal AvTaxAmount { get; set; }

    public Boolean? IsPendingWorkflow { get; set; }

    public virtual ICollection<AJv> AJvs { get; set; } = new List<AJv>();

    public virtual ExBank Bank { get; set; }

    public Boolean IsDeleted { get; set; }
    //public virtual ExCashier Cashier { get; set; }

    public virtual ICollection<ExWholeInvoicesDetail> ExWholeInvoicesDetails { get; set; } = new List<ExWholeInvoicesDetail>();

    public virtual ExInvoicesType InvoiceType { get; set; }

    public virtual ExWholeInvoiceStatus Status { get; set; }

    public virtual ExSupplier Supplier { get; set; }

    public virtual Currency SupplierCurrency { get; set; }
}

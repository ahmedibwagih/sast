using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_Transfers;
using Core.Other;

namespace Core.Entities.TRN_Invoices;

public partial class ExInvoice
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

    public int? ClientId { get; set; }

    public int PaymentMethod { get; set; }  //1  nakdy

    public int? BankId { get; set; }

    public decimal Commission { get; set; }

    public decimal Paid { get; set; }

    public string? PaidCheckNo { get; set; }
    public decimal? PaidCash { get; set; }
    public decimal? PaidCheck { get; set; }
    public decimal? PaidUnderAccount { get; set; }

    public decimal Remain { get; set; }

    public int StatusId { get; set; }

    public int? InternalTransferId { get; set; }

    public decimal AvTaxPercentage { get; set; }

    public decimal AvTaxAmount { get; set; }

    public string PurposeOfExchange { get; set; }

    public string Remarks { get; set; }

    public string FormingStatusIds { get; set; }

    public int? FormingResponsibleId { get; set; }

    public bool IsPos { get; set; }
    public Boolean? IsPendingWorkflow { get; set; }

    public virtual ICollection<AJv> AJvs { get; set; } = new List<AJv>();

    public virtual ExBank Bank { get; set; }

    //public virtual ExCashier Cashier { get; set; }

    public virtual ExClient Client { get; set; }

    public virtual ICollection<ExInvoicesDetail> ExInvoicesDetails { get; set; } = new List<ExInvoicesDetail>();

    public virtual SecUser FormingResponsible { get; set; }

    public virtual ExInternalTransfer InternalTransfer { get; set; }

    public virtual ExInvoicesType InvoiceType { get; set; }

    public virtual ExInvoiceStatus Status { get; set; }
    public Boolean IsDeleted { get; set; }
}

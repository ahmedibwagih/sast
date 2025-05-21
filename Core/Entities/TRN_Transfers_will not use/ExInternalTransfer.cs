using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_Invoices;
using Core.Other;

namespace Core.Entities.TRN_Transfers;

public partial class ExInternalTransfer
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int TransferId { get; set; }

    public int? BranchID { get; set; }
    [ForeignKey("BranchID")]
    public ExBranch ExBranch { get; set; }

    public int? UserId { get; set; }
    [ForeignKey("UserId")]
    public SecUser SecUser { get; set; }


    public int? TreasuryId { get; set; }
    [ForeignKey("TreasuryId")]
    public Treasury Treasury { get; set; }


    public int TransferNo { get; set; }

    public DateTime TransferDate { get; set; }

    public string Remarks { get; set; }

    //public int CashierId { get; set; }

    public bool Closed { get; set; }

    public DateTime? TransferClosingDate { get; set; }

    //public virtual ExCashier Cashier { get; set; }

    public virtual ICollection<ExInternalTransfersClosingDetail> ExInternalTransfersClosingDetails { get; set; } = new List<ExInternalTransfersClosingDetail>();

    public virtual ICollection<ExInternalTransfersDetail> ExInternalTransfersDetails { get; set; } = new List<ExInternalTransfersDetail>();

    public virtual ICollection<ExInternalTransfersDetailsTemp> ExInternalTransfersDetailsTemps { get; set; } = new List<ExInternalTransfersDetailsTemp>();

    public virtual ICollection<ExInvoice> ExInvoices { get; set; } = new List<ExInvoice>();
}

using Core.Entities.others;
using Core.Entities.Sec;
using Core.Other;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities.TRN_Transfers;

public partial class ExBranchTransfer
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int VoucherId { get; set; }
    public int BranchID { get; set; }
    [ForeignKey("BranchID")]
    public ExBranch ExBranch { get; set; }


    public int? UserId { get; set; }
    [ForeignKey("UserId")]
    public SecUser SecUser { get; set; }

    public int VoucherNo { get; set; }

    public DateTime VoucherDate { get; set; }

    public DateTime VoucherTime { get; set; }

   // public int CashierId { get; set; }

    public string Receptionist { get; set; }

    public string Remarks { get; set; }

    public int TypeId { get; set; }

    public int? BranchId { get; set; }

    public int StatusId { get; set; }

    public virtual ICollection<AJv> AJvs { get; set; } = new List<AJv>();

    public virtual SysBranch Branch { get; set; }

    //public virtual ExCashier Cashier { get; set; }

    public virtual ICollection<ExBranchTransfersDetail> ExBranchTransfersDetails { get; set; } = new List<ExBranchTransfersDetail>();

    public virtual ExBranchTransferStatus Status { get; set; }

    public virtual ExBranchTransferType Type { get; set; }
}

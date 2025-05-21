using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_Invoices;
using Core.Other;

namespace Core.Entities.TreasuryTransfere;

public partial class ExTreasuryTransfere
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int TransferId { get; set; }
    public Boolean IsDeleted { get; set; }
    public int? FromBranchID { get; set; }
    [ForeignKey("FromBranchID")]
    public ExBranch FromExBranch { get; set; }

    public int? FromTreasuryId { get; set; }
    [ForeignKey("FromTreasuryId")]
    public Treasury FromTreasury { get; set; }


    public int? ToBranchID { get; set; }
    [ForeignKey("ToBranchID")]
    public ExBranch ToExBranch { get; set; }

    public int? ToTreasuryId { get; set; }
    [ForeignKey("ToTreasuryId")]
    public Treasury ToTreasury { get; set; }



    public int? UserId { get; set; }
    [ForeignKey("UserId")]
    public SecUser SecUser { get; set; }




    public Boolean? IsPendingWorkflow { get; set; }
    public int TransferNo { get; set; }

    public DateTime TransferDate { get; set; }

    public string Remarks { get; set; }

    //public int CashierId { get; set; }

    public bool Closed { get; set; }

    public DateTime? TransferClosingDate { get; set; }

    //public virtual ExCashier Cashier { get; set; }

    public int? StatusId { get; set; }
    public virtual ICollection<ExTreasuryTransfereDetail> ExTreasuryTransfereDetail { get; set; } = new List<ExTreasuryTransfereDetail>();


}

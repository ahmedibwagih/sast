using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_Invoices;
using Core.Other;

namespace Core.Entities.Taswya;

public partial class ExTaswya
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int TransferId { get; set; }
    public Boolean IsDeleted { get; set; }
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

    public int? StatusId { get; set; }

    public Boolean? IsPendingWorkflow { get; set; }
    public virtual ICollection<ExTaswyaDetail> ExTaswyaDetails { get; set; } = new List<ExTaswyaDetail>();


}

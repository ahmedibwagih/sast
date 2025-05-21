using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.TRN_Transfers;
using Core.Entities.Clients;
using Core.Entities.TRN_Invoices;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_WholeInvoices;
using Core.Other;
using Core.Entities.Account;

namespace Core.Entities.LookUps;

public partial class Treasury
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int TreasuryId { get; set; }
    [Filter]

    public int BranchID { get; set; }
    [ForeignKey("BranchID")]
    public ExBranch ExBranch { get; set; }

    public Boolean IsDeleted { get; set; }
   
    [Filter]
    public string TreasuryNameEn { get; set; }
    [Filter]
    public string TreasuryNameAr { get; set; }

    public int? OwnerId { get; set; }
    [ForeignKey("OwnerId")]
    public SecUser SecUser { get; set; }

    public int? AccountId { get; set; }
    [ForeignKey("AccountId")]
    public AAccount AAccount { get; set; }

    public virtual ICollection<TreasuryDealers> TreasuryDealers { get; set; } = new List<TreasuryDealers>();

}

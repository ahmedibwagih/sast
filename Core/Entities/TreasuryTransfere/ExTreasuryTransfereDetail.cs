using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Core.Entities.LookUps;
using Core.Other;
using Core.Entities.Sec;

namespace Core.Entities.TreasuryTransfere;

public partial class ExTreasuryTransfereDetail
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int TransferDetailId { get; set; }
    public Boolean IsDeleted { get; set; }
    public int TransferId { get; set; }
    [ForeignKey("TransferId")]
    public ExTreasuryTransfere ExTreasuryTransfere { get; set; }

    public int CurrencyId { get; set; }
    [ForeignKey("CurrencyId")]
    public virtual Currency Currency { get; set; }

    public DateTime TransferTime { get; set; }

    public decimal TransferAmount { get; set; }

    public int TransferType { get; set; }

    public int? TransferWithUserId { get; set; }

    public string TransferRemarks { get; set; }




}

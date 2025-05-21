using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Core.Entities.LookUps;
using Core.Other;

namespace Core.Entities.TRN_Transfers;

public partial class ExInternalTransfersDetail
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int TransferDetailId { get; set; }

    public int TransferId { get; set; }

    public int CurrencyId { get; set; }

    public DateTime TransferTime { get; set; }

    public decimal TransferAmount { get; set; }

    public int TransferType { get; set; }

    public int? TransferWithUserId { get; set; }

    public string TransferRemarks { get; set; }

    public virtual Currency Currency { get; set; }

    public virtual ExInternalTransfer Transfer { get; set; }
}

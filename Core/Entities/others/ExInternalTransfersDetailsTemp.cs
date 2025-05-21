using System;
using System.Collections.Generic;
using Core.Entities.LookUps;
using Core.Entities.TRN_Transfers;

namespace Core.Entities.others;

public partial class ExInternalTransfersDetailsTemp
{
    public int TransferDetailId { get; set; }

    public int TransferId { get; set; }

    public int CurrencyId { get; set; }

    public DateTime TransferTime { get; set; }

    public decimal TransferAmount { get; set; }

    public int TransferType { get; set; }

    public int? TransferWithUserId { get; set; }

    public string TransferRemarks { get; set; }

    public int? ParentTransferDetailId { get; set; }

    public bool? IsAccepted { get; set; }

    public bool IsNotified { get; set; }

    public virtual Currency Currency { get; set; }

    public virtual ExInternalTransfer Transfer { get; set; }
}

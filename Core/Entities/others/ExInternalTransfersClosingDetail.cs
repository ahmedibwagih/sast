using System;
using System.Collections.Generic;
using Core.Entities.TRN_Transfers;

namespace Core.Entities.others;

public partial class ExInternalTransfersClosingDetail
{
    public int TransferClosingDetailId { get; set; }

    public int TransferId { get; set; }

    public int CurrencyId { get; set; }

    public decimal ActualRemainder { get; set; }

    public virtual ExInternalTransfer Transfer { get; set; }
}

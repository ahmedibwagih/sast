using System;
using System.Collections.Generic;
using Core.Entities.LookUps;

namespace Core.Entities.TRN_Transfers;

public partial class ExBranchTransfersDetail
{
    public int VoucherDetailId { get; set; }

    public int VoucherId { get; set; }

    public int CurrencyId { get; set; }

    public decimal Amount { get; set; }

    public decimal ExRate { get; set; }

    public virtual Currency Currency { get; set; }

    public virtual ExBranchTransfer Voucher { get; set; }
}

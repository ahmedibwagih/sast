using System;
using System.Collections.Generic;
using Core.DTOs;
using Core.Entities.LookUps;

namespace Application.Core.DTOs.TRN_Transfers;

public partial class ExBranchTransfersDetailDto : EntityDto
{
    public int VoucherDetailId { get; set; }

    public int VoucherId { get; set; }

    public int CurrencyId { get; set; }

    public decimal Amount { get; set; }

    public decimal ExRate { get; set; }

}

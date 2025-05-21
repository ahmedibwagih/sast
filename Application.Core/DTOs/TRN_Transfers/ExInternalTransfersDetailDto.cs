using System;
using System.Collections.Generic;
using Core.DTOs;
using Core.Entities.LookUps;

namespace Application.Core.DTOs.TRN_Transfers;

public partial class ExInternalTransfersDetailDto : EntityDto
{
    public int TransferDetailId { get; set; }

    public int TransferId { get; set; }

    public int CurrencyId { get; set; }

    public DateTime TransferTime { get; set; }

    public decimal TransferAmount { get; set; }

    public int TransferType { get; set; }

    public int? TransferWithUserId { get; set; }

    public string TransferRemarks { get; set; }

}

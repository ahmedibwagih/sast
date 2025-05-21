using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.DTOs;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;
using Core.Other;

namespace Application.Core.DTOs.TRN_Transfers;

public partial class ExInternalTransferDto : EntityDto
{
    public int TransferId { get; set; }
    public int? UserId { get; set; }
    public int? BranchID { get; set; }
    public int TransferNo { get; set; }
    public DateTime TransferDate { get; set; }
    public string Remarks { get; set; }
    public bool Closed { get; set; }
    public DateTime? TransferClosingDate { get; set; }
    public int? TreasuryId { get; set; }

    public virtual ICollection<ExInternalTransfersDetailDto> ExInternalTransfersDetails { get; set; } = new List<ExInternalTransfersDetailDto>();

}

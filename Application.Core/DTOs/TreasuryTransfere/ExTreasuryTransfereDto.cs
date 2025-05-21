using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_Invoices;
using Core.Other;

namespace Application.Core.DTOs.TreasuryTransfere;

public partial class ExTreasuryTransfereDto : EntityDto
{

    public int TransferId { get; set; }

    public int? FromBranchID { get; set; }


    public int? FromTreasuryId { get; set; }



    public int? ToBranchID { get; set; }


    public int? ToTreasuryId { get; set; }

    public int? StatusId { get; set; }


    public int? UserId { get; set; }


    public Boolean IsDeleted { get; set; }

    public Boolean? IsPendingWorkflow { get; set; }

    public string WorkFlowStatus { get; set; }

    public int TransferNo { get; set; }

    public DateTime TransferDate { get; set; }

    public string Remarks { get; set; }

    //public int CashierId { get; set; }

    public bool Closed { get; set; }

    public DateTime? TransferClosingDate { get; set; }

    //public virtual ExCashier Cashier { get; set; }


    public virtual ICollection<ExTreasuryTransfereDetailDto> ExTreasuryTransfereDetail { get; set; } = new List<ExTreasuryTransfereDetailDto>();


}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.Taswya;
using Core.Entities.TRN_Invoices;
using Core.Other;

namespace Application.Core.DTOs.Taswya;

public partial class ExTaswyaDto : EntityDto
{
    
    public int TransferId { get; set; }

    public int? BranchID { get; set; }
   

    public int? UserId { get; set; }
   


    public int? TreasuryId { get; set; }

    public Boolean IsDeleted { get; set; }

    public int TransferNo { get; set; }

    public DateTime TransferDate { get; set; }

    public string Remarks { get; set; }

    //public int CashierId { get; set; }

    public bool Closed { get; set; }

    public DateTime? TransferClosingDate { get; set; }
    public virtual ICollection<ExTaswyaDetailDto> ExTaswyaDetails { get; set; } = new List<ExTaswyaDetailDto>();

    //public virtual ExCashier Cashier { get; set; }
    public Boolean? IsPendingWorkflow { get; set; }
    public int? StatusId { get; set; }




}

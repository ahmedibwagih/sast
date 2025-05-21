using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.TRN_Transfers;
using Core.Entities.Clients;
using Core.Entities.TRN_Invoices;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_WholeInvoices;
using Core.Other;
using Core.DTOs;
using Core.Entities.LookUps;

namespace Application.Core.DTOs.LookUps;

public partial class TreasuryDto : EntityDto
{
    public int? OwnerId { get; set; }
    public int TreasuryId { get; set; }


    public int BranchID { get; set; }

    public Boolean IsDeleted { get; set; }
   
    public string TreasuryNameEn { get; set; }
    public string TreasuryNameAr { get; set; }

    public int? AccountId { get; set; }
    public int[] DealerS { get; set; }
    public virtual List<TreasuryDealersDto> TreasuryDealers { get; set; } = new List<TreasuryDealersDto>();


}

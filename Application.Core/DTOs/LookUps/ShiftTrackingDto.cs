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

namespace Application.Core.DTOs.LookUps;

public partial class ShiftTrackingDto : EntityDto
{
    public int ShiftTrackingID { get; set; }
    public int TreasuryId { get; set; }
    public string TreasuryName { get; set; }
    public int CurrencyId { get; set; }
    public decimal CurrentBalance { get; set; }
    public int FromUserId { get; set; }
    public int ToUserId { get; set; }
    public DateTime Date { get; set; }
    public string Notes { get; set; }

}


public class result1Dto
{
    public int? UserID { get; set; }
}

public class result2Dto
{
    public int? TreasuryId { get; set; }
    public string CurrencyName { get; set; }
    public decimal Balance { get; set; }
}

public partial class ShiftTrackingSaveInput
{
    public int TreasuryId { get; set; }
    public int FromUserId { get; set; }
    public int ToUserId { get; set; }

    public DateTime Date { get; set; }
    public string Notes { get; set; }

}



public partial class GetAllShiftTrackingInput
{
    public int TreasuryId { get; set; }
    public int? CurrencyId { get; set; }

    public DateTime? Date { get; set; }

}


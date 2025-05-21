using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.DTOs;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;
using Core.Other;

namespace Core.DTOs;

public partial class Exchange_CurrencyMovementOutput
{
    public int CurrencyCode { get; set; }
    public string CurrencyNameAr { get; set; }
    public decimal Prev_Balance { get; set; }
    public decimal Buy_Quantity { get; set; }
    public decimal Sale_Quantity { get; set; }
    public decimal current_Balance { get; set; }

}

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

public partial class Exchange_CurrenciesBalanceOutput 
{

    public int CurrencyCode { get; set; }
    public string CurrencyNameAr { get; set; }
    public decimal Balance { get; set; }
    public decimal Rate { get; set; }
    public decimal TotalBalance { get; set; }
    public DateTime ActionTime { get; set; }

    public string Type { get; set; }
}

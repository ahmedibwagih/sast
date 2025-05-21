using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.Clients;
using Core.Entities.TRN_Invoices;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Other;
using System.ComponentModel.DataAnnotations;
using Core.DTOs;

namespace Application.Core.DTOs;


public partial class CurrencyChangesDto
{
    public int userid { get; set; }
    public decimal SalePriceBefore { get; set; }
    public decimal SalePriceAfter { get; set; }
    public decimal BuyPriceBefore { get; set; }
    public decimal BuyPriceAfter { get; set; }
    public DateTime date { get; set; }
    public string currencuName { get; set; }
    public string BranchName { get; set; }
    public string TreasuryName { get; set; }
}

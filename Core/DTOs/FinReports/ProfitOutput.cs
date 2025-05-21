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

namespace Core.DTOs.FinReports;

public partial class ProfitOutput
{
    public int? seq { get; set; }
    public DateTime? Date { get; set; }
    public string CurrName { get; set; }
    public decimal SalesAmount { get; set; }
    public decimal SalesVallue { get; set; }
    public decimal SalesCost { get; set; }
    public decimal TotalProfit { get; set; }
}

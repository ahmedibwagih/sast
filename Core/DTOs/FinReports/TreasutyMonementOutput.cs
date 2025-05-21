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

public partial class TreasutyMonementOutput
{
    public int? seq { get; set; }
    public DateTime? Date { get; set; }
    public string? CurrName { get; set; }
    public decimal Move_Value { get; set; }
    public decimal balance { get; set; }
    public string? Move_type { get; set; }
    public string? Notes { get; set; }

}

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

public partial class Central_statmentInput
{
    public int? branchId { get; set; }
    public DateTime? Date { get; set; }

    public int? AccountLevel { get; set; }
    public int? onlythislevel { get; set; }

}

public partial class Central_statmentInput_compare
{
    public int? branchId { get; set; }
    public DateTime? Date1 { get; set; }
    public DateTime? Date2 { get; set; }
    public int? AccountLevel { get; set; }
    public int? onlythislevel { get; set; }

}

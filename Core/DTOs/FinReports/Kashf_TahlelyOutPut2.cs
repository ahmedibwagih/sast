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

public partial class Kashf_TahlelyOutPut2
{
    public int? AccountID { get; set; }
    public DateTime? date { get; set; }
    public string AccountName { get; set; }
    public string JVTypeNameAr { get; set; }
    public int? JVNo { get; set; }
    public decimal Debit { get; set; }
    public decimal Credit { get; set; }
    public decimal balance { get; set; }
    public string? Remarks { get; set; }


}

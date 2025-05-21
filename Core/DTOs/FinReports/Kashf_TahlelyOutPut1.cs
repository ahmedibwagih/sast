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

public partial class Kashf_TahlelyOutPut1
{
    public int? AccountID { get; set; }
    public int? ParentID { get; set; }
    public string AccountName { get; set; }
    public decimal Prev_balance { get; set; }
    public decimal Plus_Amount { get; set; }
    public decimal balance { get; set; }


}

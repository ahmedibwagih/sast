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

public partial class mezanOutPut
{
    public int? AccountID { get; set; }
    public int? ParentID { get; set; }

    public string AccountName { get; set; }

    public decimal Prev_balance_Debit { get; set; }
    public decimal Prev_balance_Credit { get; set; }
    public decimal Plus_Amount_Debit { get; set; }
    public decimal Plus_Amount_Credit { get; set; }
    public decimal balance_Debit { get; set; }
    public decimal balance_Credit { get; set; }


}

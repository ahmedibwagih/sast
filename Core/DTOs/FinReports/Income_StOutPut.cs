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

public partial class Income_StOutPut
{
    public int? AccountID { get; set; }
    public string AccountName { get; set; }
    public decimal Debit { get; set; }
    public decimal credit { get; set; }
    public decimal balance { get; set; }



}

public partial class Income_StOutPut_compare
{
    public int? AccountID { get; set; }
    public string AccountName { get; set; }
    public decimal Debit1 { get; set; }
    public decimal credit1 { get; set; }
    public decimal balance1 { get; set; }

    public decimal Debit2 { get; set; }
    public decimal credit2 { get; set; }
    public decimal balance2 { get; set; }

}

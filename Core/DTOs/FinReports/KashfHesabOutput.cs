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

public partial class KashfHesabOutput
{
    public string AccountId { get; set; }
    public DateTime? Date { get; set; }
    public string Desc { get; set; }
    public decimal Debit { get; set; }
    public decimal credit { get; set; }
    public decimal balance { get; set; }
    public string BankId { get; set; }
    public string BankName { get; set; }
    
}

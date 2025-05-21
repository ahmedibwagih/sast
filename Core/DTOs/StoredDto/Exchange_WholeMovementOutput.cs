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

public partial class Exchange_WholeMovementOutput
{
    public int InvoiceID { get; set; }
    public int InvoiceNo { get; set; }
    public string InvoiceTypeNameAr { get; set; }
    public string CurrencyNameAr { get; set; }
    public decimal ExRate { get; set; }
    public decimal Amount { get; set; }
    public decimal Total { get; set; }
    public string UserNameAr { get; set; }
    public DateTime? InvoiceTime { get; set; }
    public string BranchNameAr { get; set; }
    public string type { get; set; }

}

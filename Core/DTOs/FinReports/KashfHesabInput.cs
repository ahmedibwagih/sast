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

public partial class KashfHesabInput
{
  //  public int? branchId { get; set; }
    public DateTime? FromDate { get; set; }
    public DateTime? ToDate { get; set; }
    public int? BankAccountId { get; set; }
    public int? SupplierId { get; set; }
}

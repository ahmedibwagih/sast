using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.TRN_Transfers;
using Core.Entities.Clients;
using Core.Entities.TRN_Invoices;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_WholeInvoices;
using Core.Other;
using Core.Entities.Account;

namespace Core.Entities.LookUps;

public partial class FinYearsPeriods
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int FinYearsPeriodId { get; set; }
    [Filter]
    public string PeriodNameAr { get; set; }
    [Filter]
    public string PeriodNameEn { get; set; }


    public Boolean IsOpen { get; set; }
    public DateTime From { get; set; }
    public DateTime To { get; set; }

    public int FinYearId { get; set; }
    [ForeignKey("FinYearId")]
    public FinYears FinYears { get; set; }

}

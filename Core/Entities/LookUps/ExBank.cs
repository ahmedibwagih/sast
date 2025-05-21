using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_WholeInvoices;
using Core.Other;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Core.Entities.Account;

namespace Core.Entities.LookUps;

public partial class ExBank
{

    [Filter]
    public int BankId { get; set; }
    [Filter]

    public Boolean IsDeleted { get; set; }
    public string BankAccountNameEn { get; set; }
    [Filter]
    public string BankAccountNameAr { get; set; }

    public int? AccountId { get; set; }

    public RiskRateEnum RiskRate { get; set; }

    public ActiveEnum IsActve { get; set; }

    public virtual AAccount Account { get; set; }

    public virtual ICollection<ExInvoice> ExInvoices { get; set; } = new List<ExInvoice>();

    public virtual ICollection<ExWholeInvoice> ExWholeInvoices { get; set; } = new List<ExWholeInvoice>();
}

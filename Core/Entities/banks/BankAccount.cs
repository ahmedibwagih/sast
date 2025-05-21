using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_WholeInvoices;
using Core.Other;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Core.Entities.Account;
using Core.Entities.LookUps;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities.banks;

public partial class BankAccount
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public long BankAccountId { get; set; }
    [Filter]
    public int BankId { get; set; }
    [ForeignKey("BankId")]
    public virtual ExBank ExBank { get; set; }    
    public int CurrencyId { get; set; }
    [ForeignKey("CurrencyId")]
    public virtual Currency Currency { get; set; }
    [Filter]
    public string NameEn { get; set; }
    [Filter]
    public int? AccountId { get; set; }
    public string NameAr { get; set; }
    public string Accountnumber { get; set; }
    public decimal OppenningBalance { get; set; }
    public string Note { get; set; }
    public DateTime? Date { get; set; }
    public Boolean IsDeleted { get; set; }
}

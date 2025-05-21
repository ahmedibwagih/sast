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

public partial class ProveInOutCheck
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public long ProveInOutCheckId { get; set; }
    public string CheckNumber { get; set; }
    public long BankAccountId { get; set; }
    public decimal Amount { get; set; } 
    public int Type { get; set; } 
    //1 out
    //2 in
   
    public string Note { get; set; }
    public DateTime? Date { get; set; }
    public Boolean IsDeleted { get; set; }
}

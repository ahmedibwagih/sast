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

public partial class BanksTreasuryTransfere
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public long BanksTreasuryTransfereId { get; set; }

    public long BankAccountId { get; set; }
    public int CurrencyId { get; set; }
    [ForeignKey("CurrencyId")]
    public virtual Currency Currency { get; set; }
    public int TreasuryId { get; set; }
    public int Type { get; set; } 
    //1 from bank to trasury
    //2 from treasury to bank
    public decimal Amount { get; set; }
    public string Note { get; set; }
    public int? UserId { get; set; }
    public DateTime? Date { get; set; }
    public Boolean IsDeleted { get; set; }
}

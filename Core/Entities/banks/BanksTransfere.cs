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

public partial class BanksTransfere
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public long BanksTransfereId { get; set; }

    public long FromBankAccountId { get; set; }

    public long ToBankAccountId { get; set; }
    public decimal Amount { get; set; }
    public string Note { get; set; }
    public int? UserId { get; set; }

    public DateTime? Date { get; set; }
    public Boolean IsDeleted { get; set; }
}

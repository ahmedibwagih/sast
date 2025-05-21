using System;
using System.Collections.Generic;
using Core.Entities.TRN_Transfers;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_WholeInvoices;
using Core.Entities.others;
using Core.Entities.LookUps;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.Taswya;
using Core.Entities.TreasuryTransfere;
using Core.Other;
using System.ComponentModel.DataAnnotations;
using Core.Entities.Account;
using Core.Entities.Sec;

namespace Core.Entities.others;

public partial class AJvAccountSetting
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int AJvAccountSettingId { get; set; }
    public string AccountName { get; set; }
    public string AccountId { get; set; }
    public int Income_St_order { get; set; }

}

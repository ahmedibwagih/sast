using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_WholeInvoices;
using Core.Other;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Core.Entities.Account;
using Core.Entities.LookUps;
using System.ComponentModel.DataAnnotations.Schema;
using Core.DTOs;

namespace Application.Core.DTOs.Banks;

public partial class BankAccountDto : EntityDto
{

    public long BankAccountId { get; set; }
    public int BankId { get; set; }
    public int CurrencyId { get; set; }
    public string NameEn { get; set; }
    public string NameAr { get; set; }
    public string Accountnumber { get; set; }
    public decimal OppenningBalance { get; set; }
    public int? AccountId { get; set; }
    public string Note { get; set; }
    public DateTime? Date { get; set; }
    public Boolean IsDeleted { get; set; }
}

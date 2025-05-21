using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Core.Entities.Account;

namespace Core.Entities.others;

public partial class ExSetting
{
    [Key]
    public int Id { get; set; }

    public int? AccountIdCash { get; set; }

    public int? AccountIdInvStart { get; set; }

    public int? AccountIdBanks { get; set; }

    public int? AccountIdSuppliers { get; set; }

    public int? AccountIdCapital { get; set; }

    public int? AccountIdCommission { get; set; }

    public int? AccountIdMainBranch { get; set; }

    public int? AccountIdPurchases { get; set; }

    public int? AccountIdSales { get; set; }

    public int? AccountIdAvTax { get; set; }

    public int? AccountIdZakatExp { get; set; }

    public int? AccountIdZakatProv { get; set; }

    public int? AccountIdInvEnd { get; set; }

    public int? AccountIdProfitLoss { get; set; }

    public virtual AAccount AccountIdBanksNavigation { get; set; }

    public virtual AAccount AccountIdCapitalNavigation { get; set; }

    public virtual AAccount AccountIdCashNavigation { get; set; }

    public virtual AAccount AccountIdCommissionNavigation { get; set; }

    public virtual AAccount AccountIdInvStartNavigation { get; set; }

    public virtual AAccount AccountIdMainBranchNavigation { get; set; }

    public virtual AAccount AccountIdPurchasesNavigation { get; set; }

    public virtual AAccount AccountIdSalesNavigation { get; set; }

    public virtual AAccount AccountIdSuppliersNavigation { get; set; }

    public virtual AAccount AccountIdZakatExpNavigation { get; set; }
}

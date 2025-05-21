using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;

namespace Core.Entities.Account;

public partial class AAccount
{
    public int AccountId { get; set; }

    public int? ParentId { get; set; }

    public int AccountCode { get; set; }

    public string AccountName { get; set; }

    public int AccountLevel { get; set; }

    public decimal? LimitOverflow { get; set; }

    public int? CostCenterId { get; set; }
    [ForeignKey("CostCenterId")]
    public ACostCenter ACostCenter { get; set; }

    public int? DepreciationAccountId { get; set; }

    public int? ProvisionAccountId { get; set; }

    public bool? HasDetailedAccounts { get; set; }

    public bool? HasCostCenter { get; set; }

    public bool? HasDirectCostCenter { get; set; }

    public int? CurrencyId { get; set; }

    public virtual ICollection<AJvsDetail> AJvsDetails { get; set; } = new List<AJvsDetail>();

    public virtual AAccount DepreciationAccount { get; set; }

    public virtual ICollection<ExBank> ExBanks { get; set; } = new List<ExBank>();

    public virtual ICollection<ExSetting> ExSettingAccountIdBanksNavigations { get; set; } = new List<ExSetting>();

    public virtual ICollection<ExSetting> ExSettingAccountIdCapitalNavigations { get; set; } = new List<ExSetting>();

    public virtual ICollection<ExSetting> ExSettingAccountIdCashNavigations { get; set; } = new List<ExSetting>();

    public virtual ICollection<ExSetting> ExSettingAccountIdCommissionNavigations { get; set; } = new List<ExSetting>();

    public virtual ICollection<ExSetting> ExSettingAccountIdInvStartNavigations { get; set; } = new List<ExSetting>();

    public virtual ICollection<ExSetting> ExSettingAccountIdMainBranchNavigations { get; set; } = new List<ExSetting>();

    public virtual ICollection<ExSetting> ExSettingAccountIdPurchasesNavigations { get; set; } = new List<ExSetting>();

    public virtual ICollection<ExSetting> ExSettingAccountIdSalesNavigations { get; set; } = new List<ExSetting>();

    public virtual ICollection<ExSetting> ExSettingAccountIdSuppliersNavigations { get; set; } = new List<ExSetting>();

    public virtual ICollection<ExSetting> ExSettingAccountIdZakatExpNavigations { get; set; } = new List<ExSetting>();

    public virtual ICollection<ExSupplier> ExSuppliers { get; set; } = new List<ExSupplier>();

    public virtual ICollection<AAccount> InverseDepreciationAccount { get; set; } = new List<AAccount>();

    public virtual ICollection<AAccount> InverseParent { get; set; } = new List<AAccount>();

    public virtual ICollection<AAccount> InverseProvisionAccount { get; set; } = new List<AAccount>();

    public virtual AAccount Parent { get; set; }

    public virtual AAccount ProvisionAccount { get; set; }

    public virtual ICollection<SysBranch> SysBranches { get; set; } = new List<SysBranch>();
}

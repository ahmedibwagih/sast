using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using Core.DTOs;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;

namespace Application.Core.DTOs.Account;

public partial class AAccountDto : EntityDto
{
    public int AccountId { get; set; }
    public int? BranchID { get; set; }
    public int? ParentId { get; set; }

    public int AccountCode { get; set; }

    public string AccountName { get; set; }

    public int AccountLevel { get; set; }

    public decimal? LimitOverflow { get; set; }

    public int? CostCenterId { get; set; }
   
    public int? DepreciationAccountId { get; set; }

    public int? ProvisionAccountId { get; set; }

    public bool? HasDetailedAccounts { get; set; }
    public bool? HasCostCenter { get; set; }

    public bool? HasDirectCostCenter { get; set; }

    public int? CurrencyId { get; set; }

  
}




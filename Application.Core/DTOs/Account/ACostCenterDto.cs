using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Other;
using Core.DTOs;

namespace Application.Core.DTOs.Account;

public partial class ACostCenterDto : EntityDto
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Filter]

    public int CostCenterId { get; set; }

    public int? ParentId { get; set; }

    public int CostCode { get; set; }

    public string CostName { get; set; }

    public int CostLevel { get; set; }

    public int? CurrencyId { get; set; }

    public bool? HasDetailedAccounts { get; set; }

   
}

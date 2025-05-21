using System;
using System.Collections.Generic;
using Core.DTOs;
using Core.Entities.Account;
using Core.Entities.LookUps;

namespace Application.Core.DTOs.Account;

public partial class AJvsDetailDto : EntityDto
{
    public int JvdetailId { get; set; }

    public int Jvid { get; set; }

    public int AccountId { get; set; }

    public int CurrencyId { get; set; }
    public string CurrencyName { get; set; }

    public decimal? ForeignDebit { get; set; }

    public decimal? ForeignCredit { get; set; }

    public decimal Debit { get; set; }

    public decimal Credit { get; set; }
    public int? CostCenterId { get; set; }
    public Boolean IsDeleted { get; set; }




}

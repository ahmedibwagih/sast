using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Core.Entities.Account;
using Core.Entities.LookUps;
using Core.Other;

namespace Core.Entities.others;

public partial class AJvsDetail
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int JvdetailId { get; set; }

    public int Jvid { get; set; }

    public int AccountId { get; set; }

    public int CurrencyId { get; set; }

    public decimal? ForeignDebit { get; set; }

    public decimal? ForeignCredit { get; set; }

    public decimal Debit { get; set; }

    public decimal Credit { get; set; }
    public Boolean IsDeleted { get; set; }

    public int? CostCenterId { get; set; }
    [ForeignKey("CostCenterId")]
    public ACostCenter ACostCenter { get; set; }

    public virtual AAccount Account { get; set; }

    public virtual Currency Currency { get; set; }

    public virtual AJv Jv { get; set; }
}

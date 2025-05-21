using Core.Entities.LookUps;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.TRN_Transfers;

public partial class ExCurrenciesBvr
{
    [Key]
    public long Id { get; set; }

    public int CurrencyId { get; set; }

    public string ActionType { get; set; }

    public int ActionId { get; set; }

    public int ActionDetailId { get; set; }

    public DateTime ActionTime { get; set; }

    public decimal Amount { get; set; }

    public decimal Rate { get; set; }

    public bool IsProcessed { get; set; }

    public decimal Balance { get; set; }

    public decimal ValRate { get; set; }

    public virtual Currency Currency { get; set; }
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.others;

public partial class ExCurrenciesMarketPrice
{
    [Key]
    public int Id { get; set; }

    public int CurrencyId { get; set; }

    public DateTime MarketPriceDay { get; set; }

    public decimal MarketPrice { get; set; }
}

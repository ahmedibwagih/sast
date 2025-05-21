using System;
using System.Collections.Generic;

namespace Core.Entities.others;

public partial class ASettlement
{
    public int SettlementId { get; set; }

    public DateTime CreationDate { get; set; }

    public int UserId { get; set; }

    public DateTime SettlementStartDate { get; set; }

    public DateTime SettlementEndDate { get; set; }
}

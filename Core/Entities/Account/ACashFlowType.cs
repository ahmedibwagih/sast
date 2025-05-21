using System;
using System.Collections.Generic;

namespace Core.Entities.Account;

public partial class ACashFlowType
{
    public int VoucherTypeId { get; set; }

    public string VoucherTypeNameEn { get; set; }

    public string VoucherTypeNameAr { get; set; }

    public virtual ICollection<ACashFlow> ACashFlows { get; set; } = new List<ACashFlow>();
}

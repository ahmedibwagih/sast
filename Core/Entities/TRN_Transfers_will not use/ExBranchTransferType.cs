using System;
using System.Collections.Generic;

namespace Core.Entities.TRN_Transfers;

public partial class ExBranchTransferType
{
    public int TypeId { get; set; }

    public string TypeNameEn { get; set; }

    public string TypeNameAr { get; set; }

    public virtual ICollection<ExBranchTransfer> ExBranchTransfers { get; set; } = new List<ExBranchTransfer>();
}

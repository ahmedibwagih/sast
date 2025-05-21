using System;
using System.Collections.Generic;

namespace Core.Entities.TRN_Transfers;

public partial class ExBranchTransferStatus
{
    public int StatusId { get; set; }

    public string StatusNameEn { get; set; }

    public string StatusNameAr { get; set; }

    public virtual ICollection<ExBranchTransfer> ExBranchTransfers { get; set; } = new List<ExBranchTransfer>();
}

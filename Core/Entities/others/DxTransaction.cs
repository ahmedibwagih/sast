using System;
using System.Collections.Generic;

namespace Core.Entities.others;

public partial class DxTransaction
{
    public long TransactionId { get; set; }

    public string SqlStatement { get; set; }

    public DateTime CreationDate { get; set; }

    public Guid TransactionGuid { get; set; }
}

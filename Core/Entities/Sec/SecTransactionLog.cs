using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.Sec;

public partial class SecTransactionLog
{
    [Key]
    public int LogId { get; set; }

    public int UserId { get; set; }

    public int FormId { get; set; }

    public int FunctionId { get; set; }

    public int ItemId { get; set; }

    public int ItemNo { get; set; }

    public DateTime ActionDate { get; set; }

    public string ActionDetails { get; set; }

    public virtual SecForm Form { get; set; }

    public virtual SecFunction Function { get; set; }

    public virtual SecUser User { get; set; }
}

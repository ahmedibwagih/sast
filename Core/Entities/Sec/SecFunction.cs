using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.Sec;

public partial class SecFunction
{
    [Key]
    public int FunctionId { get; set; }

    public string FunctionName { get; set; }

    public string FunctionNameEn { get; set; }

    public string FunctionNameAr { get; set; }

    public int FunctionOrder { get; set; }

    public bool Logged { get; set; }
    public bool HasTextValue { get; set; }

    public virtual ICollection<SecFormsFunction> SecFormsFunctions { get; set; } = new List<SecFormsFunction>();

    public virtual ICollection<SecTransactionLog> SecTransactionLogs { get; set; } = new List<SecTransactionLog>();
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.Sec;

public partial class SecForm
{
    [Key]
    public int FormId { get; set; }

    public int? ParentId { get; set; }

    public string FormName { get; set; }

    public string DisplayNameEn { get; set; }

    public string DisplayNameAr { get; set; }

    public int? FormOrder { get; set; }

    public bool ShowInLog { get; set; }

    public string TablesForLog { get; set; }

    public bool Installed { get; set; }

    public virtual ICollection<SecFormsFunction> SecFormsFunctions { get; set; } = new List<SecFormsFunction>();

    public virtual ICollection<SecTransactionLog> SecTransactionLogs { get; set; } = new List<SecTransactionLog>();

    public virtual ICollection<SecUsersForm> SecUsersForms { get; set; } = new List<SecUsersForm>();
}

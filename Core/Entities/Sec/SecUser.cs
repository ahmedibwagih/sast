using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.TRN_Invoices;
using Core.Entities.others;
using Core.Other;
using Core.Entities.Account;

namespace Core.Entities.Sec;

public partial class SecUser
{
    //[Key]
    //[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    //[Column(Order = 0)]
    public int UserId { get; set; }
    [Filter]
    public string UserCode { get; set; }

    public string UserNameEn { get; set; }

    public string UserNameAr { get; set; }

    public string LoginName { get; set; }

    public string Password { get; set; }

    public bool Enabled { get; set; }

    public DateTime? CreatedDate { get; set; }
    public DateTime? LastNotifcationDate { get; set; }

    public string ThemeName { get; set; }

    public bool IsSupervisor { get; set; }

    public bool LiveExchange { get; set; }

    public int? BranchId { get; set; }

    public string LocalIpaddress { get; set; }

    public string OnlineStatus { get; set; }

    public int? PermissionTypeId { get; set; }

    public string? ImagePath { get; set; }

    public virtual ExBranch Branch { get; set; }

    public virtual ICollection<ACashFlow> ACashFlows { get; set; } = new List<ACashFlow>();

    public virtual SecPermissionType PermissionType { get; set; }

    public virtual ICollection<ExInvoice> ExInvoices { get; set; } = new List<ExInvoice>();

    public virtual ICollection<SecTransactionLog> SecTransactionLogs { get; set; } = new List<SecTransactionLog>();

    public virtual ICollection<SecUsersForm> SecUsersForms { get; set; } = new List<SecUsersForm>();

    public virtual ICollection<SecUsersFunction> SecUsersFunctions { get; set; } = new List<SecUsersFunction>();

    public virtual ICollection<SysBackup> SysBackups { get; set; } = new List<SysBackup>();

    public virtual ICollection<UserSetting> UserSettings { get; set; } = new List<UserSetting>();
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Core.Entities.Account;
using Core.Entities.TRN_Transfers;

namespace Core.Entities.others;

public partial class SysBranch
{
    [Key]
    public int BranchId { get; set; }

    public string BranchName { get; set; }

    public string BranchNameEn { get; set; }

    public string BranchNameAr { get; set; }

    public bool DbsynchRequested { get; set; }

    public bool DbsynchStarted { get; set; }

    public bool DbsynchDownloaded { get; set; }

    public bool DbsynchRestored { get; set; }

    public bool DbsynchFinished { get; set; }

    public DateTime? DbsynchLastUpdatedDate { get; set; }

    public bool DbsynchStopped { get; set; }

    public string DbsynchRemarks { get; set; }

    public int? AccountId { get; set; }

    public DateTime? LastSyncTime { get; set; }

    public string LastSyncErrorMessage { get; set; }

    public virtual AAccount Account { get; set; }

    public virtual ICollection<ExBranchTransfer> ExBranchTransfers { get; set; } = new List<ExBranchTransfer>();
}

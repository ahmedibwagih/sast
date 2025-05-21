using System;
using System.Collections.Generic;
using Core.Entities.TRN_Transfers;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_WholeInvoices;
using Core.Entities.others;
using Core.Entities.LookUps;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.Taswya;
using Core.Entities.TreasuryTransfere;
using Core.Other;
using System.ComponentModel.DataAnnotations;
using Core.Entities.Account;
using Core.Entities.Sec;

namespace Core.Entities.others;

public partial class AJv
{

    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int Jvid { get; set; }

    public int Jvno { get; set; }

    public DateTime Jvdate { get; set; }

    public DateTime Jvtime { get; set; }

    public int JvtypeId { get; set; }

    public int JvstatusId { get; set; }

    public string Remarks { get; set; }

    public bool Generated { get; set; }

    public int? InvoiceId { get; set; }

    public int? WholeInvoiceId { get; set; }

    public int? CashFlowId { get; set; }

    public int? BranchTransferId { get; set; }
    public long? BanksTransfereId { get; set; }
    public long? BanksTreasuryTransfereId { get; set; }

    public int? TaswyaTransferId { get; set; }
    [ForeignKey("TaswyaTransferId")]
    public ExTaswya ExTaswya { get; set; }

    public Boolean IsDeleted { get; set; }

    public int? TreasuryTransferId { get; set; }
    [ForeignKey("TreasuryTransferId")]
    public ExTreasuryTransfere ExTreasuryTransfere { get; set; }

    public int? BranchID { get; set; }
    [ForeignKey("BranchID")]
    public ExBranch ExBranch { get; set; }


    public int? UserId { get; set; }

    public virtual ICollection<AJvsDetail> AJvsDetails { get; set; } = new List<AJvsDetail>();

    public virtual ExBranchTransfer BranchTransfer { get; set; }

    public virtual ACashFlow CashFlow { get; set; }

    public virtual ExInvoice Invoice { get; set; }

    public virtual AJvstatus Jvstatus { get; set; }

    public virtual AJvtype Jvtype { get; set; }

    public virtual ExWholeInvoice WholeInvoice { get; set; }
}

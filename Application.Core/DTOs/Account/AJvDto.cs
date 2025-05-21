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
using Core.DTOs;

namespace Application.Core.DTOs.Account;

public partial class AJvDto : EntityDto
{
    public int Jvid { get; set; }

    public int Jvno { get; set; }

    public DateTime Jvdate { get; set; }

    public DateTime Jvtime { get; set; }

    public long? BanksTransfereId { get; set; }
    public long? BanksTreasuryTransfereId { get; set; }
    public int JvtypeId { get; set; }

    public int JvstatusId { get; set; }

    public string Remarks { get; set; }

    public bool Generated { get; set; }

    public int? InvoiceId { get; set; }

    public int? WholeInvoiceId { get; set; }

    public int? CashFlowId { get; set; }

    public int? BranchTransferId { get; set; }

    public int? TaswyaTransferId { get; set; }

    public int? BranchID { get; set; }

    public int? TreasuryTransferId { get; set; }
    public Boolean IsDeleted { get; set; }
    public int? UserId { get; set; }
    public virtual ICollection<AJvsDetailDto> AJvsDetails { get; set; } = new List<AJvsDetailDto>();

}

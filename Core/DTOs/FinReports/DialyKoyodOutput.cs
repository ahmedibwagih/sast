using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.DTOs;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;
using Core.Other;

namespace Core.DTOs.FinReports;

public partial class DialyKoyodOutput
{
    public int Jvid { get; set; }

    public int Jvno { get; set; }

    public decimal Debit { get; set; }

    public decimal Credit { get; set; }

    public decimal ForeignDebit { get; set; }

    public decimal ForeignCredit { get; set; }

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

    public int? TaswyaTransferId { get; set; }

    public int? BranchID { get; set; }

    public int? TreasuryTransferId { get; set; }
    public Boolean IsDeleted { get; set; }

    //------------------------------------------------------------------------
    public string JvtypeName { get; set; }

    public string JvstatusName { get; set; }
    public string? AccountName { get; set; }
    public string? CurrencyNameAr { get; set; }
}

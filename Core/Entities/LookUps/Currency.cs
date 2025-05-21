using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.TRN_Transfers;
using Core.Entities.Clients;
using Core.Entities.TRN_Invoices;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_WholeInvoices;
using Core.Other;
using Core.Entities.Account;

namespace Core.Entities.LookUps;

public partial class Currency
{
    [Key]
    public int CurrencyId { get; set; }
    [Filter]

    public int BranchID { get; set; }
    [ForeignKey("BranchID")]
    public ExBranch ExBranch { get; set; }

    public int TreasuryId { get; set; }
    [ForeignKey("TreasuryId")]
    public Treasury Treasury { get; set; }



    public Boolean IsDeleted { get; set; }
    public int CurrencyCode { get; set; }
    [Filter]
    public string CurrencyNameEn { get; set; }
    [Filter]
    public string CurrencyNameAr { get; set; }

    public string Sign { get; set; }

    public decimal SalePrice { get; set; }

    public decimal BuyPrice { get; set; }

    public decimal ValuationPrice { get; set; }

    public bool IsActive { get; set; }

    public Boolean? IsDefault { get; set; }

    public decimal OpeningBalance { get; set; }

    public decimal OpeningPrice { get; set; }

    public bool ShowInPricesScreen { get; set; }

    public DateTime? OpenningBalanceDate { get; set; }

    public virtual ICollection<ACashFlow> ACashFlows { get; set; } = new List<ACashFlow>();

    public virtual ICollection<AJvsDetail> AJvsDetails { get; set; } = new List<AJvsDetail>();

    public virtual ICollection<ExBranchTransfersDetail> ExBranchTransfersDetails { get; set; } = new List<ExBranchTransfersDetail>();

    public virtual ICollection<ExCurrenciesBvr> ExCurrenciesBvrs { get; set; } = new List<ExCurrenciesBvr>();

    public virtual ICollection<ExInternalTransfersDetail> ExInternalTransfersDetails { get; set; } = new List<ExInternalTransfersDetail>();

    public virtual ICollection<ExInternalTransfersDetailsTemp> ExInternalTransfersDetailsTemps { get; set; } = new List<ExInternalTransfersDetailsTemp>();

    public virtual ICollection<ExInvoicesDetail> ExInvoicesDetails { get; set; } = new List<ExInvoicesDetail>();

    public virtual ICollection<ExSupplier> ExSuppliers { get; set; } = new List<ExSupplier>();

    public virtual ICollection<ExWholeInvoice> ExWholeInvoices { get; set; } = new List<ExWholeInvoice>();

    public virtual ICollection<ExWholeInvoicesDetail> ExWholeInvoicesDetails { get; set; } = new List<ExWholeInvoicesDetail>();
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Other;
using Core.Entities.TRN_WholeInvoices;
using Core.Entities.Account;

namespace Core.Entities.Clients;

public partial class ExSupplier
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Filter]

    public int SupplierId { get; set; }

    public Boolean IsDeleted { get; set; }
    [Filter]
    public int SupplierCode { get; set; }
    [Filter]
    public string SupplierNameEn { get; set; }
    [Filter]
    public string SupplierNameAr { get; set; }
    [Filter]
    public string Phone { get; set; }
    [Filter]
    public string Fax { get; set; }
    [Filter]
    public string Email { get; set; }
    [Filter]
    public int? SupplierTypeId { get; set; }

    public string? Sector { get; set; }
    public int? BranchID { get; set; }
    [ForeignKey("BranchID")]
    public Core.Entities.Sec.ExBranch ExBranch { get; set; }

    public int? CountryId { get; set; }

    public string BankAccount { get; set; }

    public int CurrencyId { get; set; }

    public decimal CurrencyExRate { get; set; }

    public int? AccountId { get; set; }

    public string Crnumber { get; set; }

    public int? ClientActivityID { get; set; }

    public DateTime? CrexpiredDate { get; set; }

    public string UnifiedNumber { get; set; }

    public string LicenseNo { get; set; }

    public DateTime? LicenseExpiredDate { get; set; }

    public decimal? CreditLimit { get; set; }

    public int? BranchId { get; set; }

    public bool IsMainBranch { get; set; }

    public virtual ICollection<ACashFlow> ACashFlows { get; set; } = new List<ACashFlow>();

    public virtual AAccount Account { get; set; }

    public virtual ExCountry Country { get; set; }

    //public virtual Currency Currency { get; set; }

    public virtual ICollection<ExWholeInvoice> ExWholeInvoices { get; set; } = new List<ExWholeInvoice>();

    public virtual ExSuppliersType SupplierType { get; set; }
}

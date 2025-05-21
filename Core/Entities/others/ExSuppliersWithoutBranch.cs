using System;
using System.Collections.Generic;

namespace Core.Entities.others;

public partial class ExSuppliersWithoutBranch
{
    public int SupplierId { get; set; }

    public int SupplierCode { get; set; }

    public string SupplierNameEn { get; set; }

    public string SupplierNameAr { get; set; }

    public string Phone { get; set; }

    public string Fax { get; set; }

    public string Email { get; set; }

    public int? SupplierTypeId { get; set; }

    public int? CountryId { get; set; }

    public string BankAccount { get; set; }

    public int CurrencyId { get; set; }

    public decimal CurrencyExRate { get; set; }

    public int? AccountId { get; set; }

    public string Crnumber { get; set; }

    public DateTime? CrexpiredDate { get; set; }

    public string UnifiedNumber { get; set; }

    public string LicenseNo { get; set; }

    public DateTime? LicenseExpiredDate { get; set; }

    public decimal? CreditLimit { get; set; }

    public int? BranchId { get; set; }

    public bool IsMainBranch { get; set; }
}

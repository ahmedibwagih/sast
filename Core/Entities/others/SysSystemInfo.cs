using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.others;

public partial class SysSystemInfo
{
    [Key]
    public int Id { get; set; }

    public DateTime InternalDataLastModifiedDate { get; set; }

    public string ClientIdentifier { get; set; }

    public string CompanyNameEn { get; set; }

    public string CompanyNameAr { get; set; }

    public string Crno { get; set; }

    public string LicenseNo { get; set; }

    public byte[] ReportsLogo { get; set; }

    public int ExSystemCurrencyId { get; set; }

    public string ExInvoiceCompanyNameEn { get; set; }

    public string ExInvoiceCompanyNameAr { get; set; }

    public string ExInvoiceHeader { get; set; }

    public string ExInvoiceFooter { get; set; }

    public byte[] ExInvoiceLogo { get; set; }

    public string ExWholesaleInvoiceHeaderEn { get; set; }

    public string ExWholesaleInvoiceHeaderAr { get; set; }

    public string ExPortName { get; set; }

    public bool IsBranch { get; set; }

    public string BranchName { get; set; }
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.others;

public partial class SysSetting
{
    [Key]
    public int Id { get; set; }

    public bool SingleLanguage { get; set; }

    public int ExchangeInvoiceNoScope { get; set; }

    public int WholesaleInvoiceNoScope { get; set; }

    public int JvnoScope { get; set; }

    public bool JvnoScopeByType { get; set; }

    public string ReportHeaderLeft { get; set; }

    public string ReportHeaderRight { get; set; }

    public string InvoiceFooter { get; set; }

    public string WholeInvoiceHeader { get; set; }

    public string WholeInvoiceFooter { get; set; }

    public string SamaSignature1 { get; set; }

    public string SamaSignature2 { get; set; }

    public string SamaSignature3 { get; set; }

    public string MsSmtpServer { get; set; }

    public int? MsSmtpPort { get; set; }

    public bool MsSsl { get; set; }

    public string MsUsername { get; set; }

    public string MsPassword { get; set; }

    public string MsDisplayName { get; set; }

    public bool MsNotifySuppliers { get; set; }

    public int MsNotifySuppliersInterval { get; set; }

    public string MsNotifySuppliersCc { get; set; }

    public string MsNotifySuppliersMailFooter { get; set; }

    public bool SamalimitEnabled { get; set; }

    public decimal SamalimitForSaudi { get; set; }

    public decimal SamalimitForNonSaudi { get; set; }

    public string MainServerConString { get; set; }

    public string PriceScreenBackColor { get; set; }

    public string PriceScreenForeColor { get; set; }

    public decimal AvTaxPercentage { get; set; }

    public bool EnableLiteValidation { get; set; }

    public bool EnableLogoutWhenIdle { get; set; }

    public int IdleTimeBeforeLogout { get; set; }

    public string InvoiceBgcForSale { get; set; }

    public string InvoiceBgcForPurchase { get; set; }

    public string PriceScreenNotes { get; set; }
}

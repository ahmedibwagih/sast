//using System;
//using System.Collections.Generic;
//using Core.Entities.TRN_BranchTransfers;
//using Core.Entities.TRN_Invoices;
//using Core.Entities.TRN_WholeInvoices;

//namespace Core.Entities.others;

//public partial class ExCashier
//{
//    public int CashierId { get; set; }

//    public string CashierNameEn { get; set; }

//    public string CashierNameAr { get; set; }

//    public int? BranchId { get; set; }

//    public virtual ICollection<ExBranchTransfer> ExBranchTransfers { get; set; } = new List<ExBranchTransfer>();

//    public virtual ICollection<ExInternalTransfer> ExInternalTransfers { get; set; } = new List<ExInternalTransfer>();

//    public virtual ICollection<ExInvoice> ExInvoices { get; set; } = new List<ExInvoice>();

//    public virtual ICollection<ExWholeInvoice> ExWholeInvoices { get; set; } = new List<ExWholeInvoice>();
//}

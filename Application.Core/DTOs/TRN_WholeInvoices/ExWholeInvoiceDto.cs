using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.Clients;
using Core.Entities.TRN_Invoices;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Other;
using System.ComponentModel.DataAnnotations;
using Core.DTOs;
using Core.Entities.TRN_WholeInvoices;
using Application.Core.DTOs.TRN_Invoices;

namespace Application.Core.DTOs.TRN_WholeInvoices;

public partial class ExWholeInvoiceDto : EntityDto
{
    public int InvoiceId { get; set; }
    public int BranchID { get; set; }
    public int? UserId { get; set; }
    public int InvoiceNo { get; set; }
    public DateTime InvoiceDate { get; set; }
    public DateTime InvoiceTime { get; set; }
    public int InvoiceTypeId { get; set; }
    public int SupplierId { get; set; }
    public int SupplierCurrencyId { get; set; }
    public decimal SupplierCurrencyExRate { get; set; }
    public int PaymentMethod { get; set; }
    public int? BankId { get; set; }
    public string Receptionist { get; set; }
    public string Remarks { get; set; }
    public decimal Paid { get; set; }
    public string? PaidCheckNo { get; set; }
    public decimal Remain { get; set; }
    public int StatusId { get; set; }
    public bool IsNotified { get; set; }
    public int UpdatedCount { get; set; }
    public decimal AvTaxPercentage { get; set; }
    public decimal AvTaxAmount { get; set; }
    public int? TreasuryId { get; set; }
    public Boolean? IsPendingWorkflow { get; set; }
    public string WorkFlowStatus { get; set; }
    public virtual ICollection<ExWholeInvoicesDetailDto> ExWholeInvoicesDetails { get; set; } = new List<ExWholeInvoicesDetailDto>();

    public Boolean IsDeleted { get; set; }
    public List<NewWholePaymentMethods>? NewWholePaymentMethods { get; set; }
}

public partial class NewWholePaymentMethods
{
    public int WholePaymentMethodId { get; set; }

    public int? BankId { get; set; }
    public decimal Paid { get; set; }

    public string? CheckNo { get; set; }
}

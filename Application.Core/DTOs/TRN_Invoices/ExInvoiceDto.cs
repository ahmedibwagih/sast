using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Application.Core.DTOs.TRN_WholeInvoices;
using Core.DTOs;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;
using Core.Other;

namespace Application.Core.DTOs.TRN_Invoices;

public partial class ExInvoiceDto : EntityDto
{

    public int InvoiceId { get; set; }
    public int BranchID { get; set; }

    public int? UserId { get; set; }

    public int InvoiceNo { get; set; }

    public DateTime InvoiceDate { get; set; }

    public DateTime InvoiceTime { get; set; }


    public int InvoiceTypeId { get; set; }

    public int? ClientId { get; set; }

    public int PaymentMethod { get; set; }

    public int? BankId { get; set; }

    public decimal Commission { get; set; }

    public decimal Paid { get; set; }
    public string? PaidCheckNo { get; set; }

    public decimal Remain { get; set; }

    public int StatusId { get; set; }

    public int? InternalTransferId { get; set; }

    public decimal AvTaxPercentage { get; set; }

    public decimal AvTaxAmount { get; set; }

    public string PurposeOfExchange { get; set; }

    public string Remarks { get; set; }

    public string FormingStatusIds { get; set; }

    public int? FormingResponsibleId { get; set; }

    public bool IsPos { get; set; }
    public Boolean? IsPendingWorkflow { get; set; }
    public string WorkFlowStatus { get; set; }

    public virtual ICollection<ExInvoicesDetailDto> ExInvoicesDetails { get; set; } = new List<ExInvoicesDetailDto>();

    public int? TreasuryId { get; set; }
    public Boolean IsDeleted { get; set; }
    public List<NewPaymentMethods>? NewPaymentMethods { get; set; }

}


    public partial class NewPaymentMethods 
{
    public int PaymentMethodId { get; set; }

    public int? BankId { get; set; }
    public decimal Paid { get; set; }

    public string? CheckNo { get; set; }
}

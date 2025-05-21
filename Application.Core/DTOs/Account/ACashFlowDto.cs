using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.Sec;
using Core.Other;
using Core.DTOs;

namespace Application.Core.DTOs.Account;

public partial class ACashFlowDto : EntityDto
{

    public int VoucherId { get; set; }
    public int? BranchID { get; set; }
    public int VoucherNo { get; set; }

    public DateTime VoucherDate { get; set; }

    public DateTime VoucherTime { get; set; }

    public int VoucherTypeId { get; set; }

    public int? SupplierId { get; set; }

    public int PaymentMethod { get; set; }

    public string CheckNo { get; set; }

    public int? BankId { get; set; }

    public decimal Amount { get; set; }

    public int CurrencyId { get; set; }

    public string Remarks { get; set; }

    public int UserId { get; set; }

    public int StatusId { get; set; }

    public Boolean IsDeleted { get; set; }

}

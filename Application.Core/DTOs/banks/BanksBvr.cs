using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_WholeInvoices;
using Core.Other;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Core.Entities.Account;
using Core.Entities.LookUps;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.Sec;
using Core.DTOs;

namespace Application.Core.DTOs.Banks;
public partial class BanksBvrDto : EntityDto
{

    public long BanksBvrId { get; set; }
    public long BankAccountId { get; set; }


    public string ActionType { get; set; }

    public int ActionId { get; set; }

    public int ActionDetailId { get; set; }

    public DateTime ActionTime { get; set; }

    public decimal Amount { get; set; }

    public decimal Balance { get; set; }

}

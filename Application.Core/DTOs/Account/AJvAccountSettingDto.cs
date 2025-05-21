using System;
using System.Collections.Generic;
using Core.Entities.TRN_Transfers;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_WholeInvoices;
using Core.Entities.others;
using Core.Entities.LookUps;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.Taswya;
using Core.Entities.TreasuryTransfere;
using Core.Other;
using System.ComponentModel.DataAnnotations;
using Core.Entities.Account;
using Core.Entities.Sec;
using Core.DTOs;

namespace Application.Core.DTOs.Account;

public partial class AJvAccountSettingDto : EntityDto
{
    public int AJvAccountSettingId { get; set; }
    public string AccountName { get; set; }
    public string AccountId { get; set; }

}

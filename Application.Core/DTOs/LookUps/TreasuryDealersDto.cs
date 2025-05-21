using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.TRN_Transfers;
using Core.Entities.Clients;
using Core.Entities.TRN_Invoices;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_WholeInvoices;
using Core.Other;
using Core.DTOs;

namespace Application.Core.DTOs.LookUps;

public partial class TreasuryDealersDto : EntityDto
{

    public int TreasuryDealerId { get; set; }

    public int TreasuryId { get; set; }

    public int UserId { get; set; }

    public string Desc { get; set; }
    public DateTime Date { get; set; }

    public Boolean? IsDeleted { get; set; }

}

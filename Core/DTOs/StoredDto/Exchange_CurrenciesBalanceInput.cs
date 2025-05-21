using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.DTOs;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;
using Core.Other;

namespace Core.DTOs;

public partial class Exchange_CurrenciesBalanceInput 
{

    public DateTime date { get; set; }
    public int? branchId { get; set; }

    public int? Userid { get; set; }

    public int? Type { get; set; }


}

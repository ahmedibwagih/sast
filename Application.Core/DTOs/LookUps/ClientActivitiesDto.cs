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

public partial class ClientActivitiesDto : EntityDto
{

    public int ClientActivityID { get; set; }


    public string ActivityNameAr { get; set; }


    public string ActivityNameEn { get; set; }


}

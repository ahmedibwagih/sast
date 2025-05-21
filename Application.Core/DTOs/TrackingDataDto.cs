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

namespace Application.Core.DTOs;


    public partial class TrackingDataDto : EntityDto
{

    public string EntityId { get; set; }
    public string TableName { get; set; }
    public int ActionType { get; set; } //0 Delete 1 Update
    public decimal JsonBefore { get; set; }
    public decimal JsonAfter { get; set; }
    public DateTime date { get; set; }


}

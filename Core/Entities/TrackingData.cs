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

namespace Core.Entities.TRN_WholeInvoices;

public partial class TrackingData
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int TrackId { get; set; }
    public string EntityId { get; set; }
    public string TableName { get; set; }
    public int ActionType { get; set; } //0 Delete 1 Update
    public string JsonBefore { get; set; }
    public string JsonAfter { get; set; }
    public DateTime date { get; set; }


}

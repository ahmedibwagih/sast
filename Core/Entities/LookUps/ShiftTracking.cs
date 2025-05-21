using Core.Entities.Clients;
using Core.Entities.Sec;
using Core.Other;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities.LookUps;

public partial class ShiftTracking
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int ShiftTrackingID { get; set; }

    public int TreasuryId { get; set; }
    [ForeignKey("TreasuryId")]
    public Treasury Treasury { get; set; }
    public int CurrencyId { get; set; }

    public decimal CurrentBalance { get; set; }

    public int FromUserId { get; set; }
    [ForeignKey("FromUserId")]
    public SecUser FromSecUser { get; set; }

    public int ToUserId { get; set; }
    [ForeignKey("ToUserId")]
    public SecUser ToSecUser { get; set; }

    public DateTime Date { get; set; }
    public string Notes { get; set; }

}

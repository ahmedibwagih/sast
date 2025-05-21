using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_Invoices;
using Core.Other;

namespace Core.Entities.Workflow;

public partial class WFRequestType
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int RequestTypeId { get; set; }
    public string NameAr { get; set; }
    public string NameEn { get; set; }

    public string RunOnStart { get; set; }
    public string RunONLastApprove { get; set; }
    public string RunOnReject { get; set; }

}

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

public partial class WFRequest
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int RequestId { get; set; }
    public int RequestTypeId { get; set; }
    [ForeignKey("RequestTypeId")]
    public WFRequestType WFRequestType { get; set; }

    public int BranchID { get; set; }
    [ForeignKey("BranchID")]
    public ExBranch ExBranch { get; set; }

    public int? UserId { get; set; }
    [ForeignKey("UserId")]
    public SecUser SecUser { get; set; }

    public string EntityId { get; set; }
  
    public Boolean IsCompleted { get; set; }
    public DateTime RegisterDate { get; set; }

}

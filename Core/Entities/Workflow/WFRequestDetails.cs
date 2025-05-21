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

public partial class WFRequestDetails
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int RequestDetailId { get; set; }

    public int RequestId { get; set; }
    [ForeignKey("RequestId")]
    public WFRequest WFRequest { get; set; }

    public int ActionType { get; set; } // 0:reject ,1 :approve, 2:note

    public int ActionOrder { get; set; }
    public string Notes { get; set; }


    public int? UserId { get; set; }
    [ForeignKey("UserId")]
    public SecUser SecUser { get; set; }
    public DateTime RegisterDate { get; set; }
 


}

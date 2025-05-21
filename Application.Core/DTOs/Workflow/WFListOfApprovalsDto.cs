using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Application.Core.DTOs.Workflow;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_Invoices;
using Core.Other;

namespace Application.Core.DTOs.WorkFlow;

public partial class WFListOfApprovalsDto : EntityDto
{

    public int ListOfApprovalId { get; set; }
    public int RequestTypeId { get; set; }
    public int BranchID { get; set; }
    public int ActionOrder { get; set; }
    public int? UserId { get; set; }
    public Boolean Islast { get; set; }




}

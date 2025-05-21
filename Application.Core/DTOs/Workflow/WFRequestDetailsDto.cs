using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_Invoices;
using Core.Other;

namespace Application.Core.DTOs.WorkFlow;

public partial class WFRequestDetailsDto : EntityDto
{

    public int RequestDetailId { get; set; }

    public int RequestId { get; set; }


    public int ActionType { get; set; } // 0:reject ,1 :approve, 2: comment

    public int ActionTypeName { get; set; }
    public int ActionOrder { get; set; }
    public string Notes { get; set; }
    public DateTime RegisterDate { get; set; }

    public int? UserId { get; set; }
    public Boolean IsCompleted { get; set; }




}

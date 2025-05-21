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

namespace Core.DTOs;

public partial class RequestResult
{

    public int? RequestId { get; set; }
    public int? RequestTypeId { get; set; }


    public int BranchID { get; set; }


    public int? UserId { get; set; }


    public string EntityId { get; set; }
    //public string RunOnStart { get; set; }
    //public string RunONLastApprove { get; set; }
    //public string RunOnReject { get; set; }
    public Boolean IsCompleted { get; set; }
    public DateTime? RegisterDate { get; set; }

}

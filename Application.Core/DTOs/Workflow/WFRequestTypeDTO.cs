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

namespace Application.Core.DTOs.Workflow;

public partial class WFRequestTypeDto : EntityDto
{

    public int RequestTypeId { get; set; }
    public string NameAr { get; set; }
    public string NameEn { get; set; }

}

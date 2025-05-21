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

public class UserActionsInputDto : EntityDto
{
    public int? JvtypeId { get; set; }

    public int? UserId { get; set; }

    public DateTime From { get; set; }
    public DateTime To { get; set; }

    public int? BranchID { get; set; }


}

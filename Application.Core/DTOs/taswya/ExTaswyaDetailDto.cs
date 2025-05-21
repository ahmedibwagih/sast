using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Core.Entities.LookUps;
using Core.Other;
using Core.Entities.Sec;
using Core.DTOs;

namespace Application.Core.DTOs.Taswya;

public partial class ExTaswyaDetailDto : EntityDto
{
    public int TransferDetailId { get; set; }

    public int TransferId { get; set; }
  
    public int CurrencyId { get; set; }
  
    public DateTime TransferTime { get; set; }

    public decimal TransferAmount { get; set; }

    public int TransferType { get; set; }

    public int? TransferWithUserId { get; set; }

    public string TransferRemarks { get; set; }

    public Boolean IsDeleted { get; set; }


}

using Core.DTOs;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Other;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.TRN_Transfers;

public partial class ExBranchTransferDto : EntityDto
{ 
    public int VoucherId { get; set; }
    public int BranchID { get; set; }
    public int? UserId { get; set; }
    public int VoucherNo { get; set; }
    public DateTime VoucherDate { get; set; }
    public DateTime VoucherTime { get; set; }
    public string Receptionist { get; set; }
    public string Remarks { get; set; }
    public int TypeId { get; set; }
    public int? BranchId { get; set; }
    public int StatusId { get; set; }

}

using Core.DTOs;
using System;
using System.Collections.Generic;

namespace Application.Core.DTOs.Account;

public partial class ACashFlowTypeDto : EntityDto
{
    public int VoucherTypeId { get; set; }

    public string VoucherTypeNameEn { get; set; }

    public string VoucherTypeNameAr { get; set; }

  
}

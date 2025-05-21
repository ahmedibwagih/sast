using Core.DTOs;
using System;
using System.Collections.Generic;

namespace Application.Core.DTOs.TRN_Transfers;

public partial class ExBranchTransferTypeDto : EntityDto
{
    public int TypeId { get; set; }

    public string TypeNameEn { get; set; }

    public string TypeNameAr { get; set; }
}

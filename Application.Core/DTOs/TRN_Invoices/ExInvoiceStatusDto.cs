﻿using Core.DTOs;
using System;
using System.Collections.Generic;

namespace Application.Core.DTOs.TRN_Invoices;

public partial class ExInvoiceStatusDto : EntityDto
{
    public int StatusId { get; set; }

    public string StatusNameEn { get; set; }

    public string StatusNameAr { get; set; }

}

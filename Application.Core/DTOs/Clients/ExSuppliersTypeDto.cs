using Core.DTOs;
using System;
using System.Collections.Generic;

namespace Application.Core.DTOs.Clients;

public partial class ExSuppliersTypeDto : EntityDto
{
    public int SupplierTypeId { get; set; }

    public string SupplierTypeNameEn { get; set; }

    public string SupplierTypeNameAr { get; set; }

    public int? MonetaryAgencyReportId { get; set; }


}

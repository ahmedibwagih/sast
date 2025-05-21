using System;
using System.Collections.Generic;

namespace Core.Entities.Clients;

public partial class ExSuppliersType
{
    public int SupplierTypeId { get; set; }

    public string SupplierTypeNameEn { get; set; }

    public string SupplierTypeNameAr { get; set; }

    public int? MonetaryAgencyReportId { get; set; }

    public virtual ICollection<ExSupplier> ExSuppliers { get; set; } = new List<ExSupplier>();
}

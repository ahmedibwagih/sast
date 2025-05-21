using System;
using System.Collections.Generic;

namespace SecurityPermits.Server.Models;

public partial class Branch
{
    public int Id { get; set; }

    public string? NameAr { get; set; }

    public string? NameEn { get; set; }

    public int? GovId { get; set; }

    public string? Address { get; set; }

    public string? AddressEn { get; set; }

    public string? Tel { get; set; }

    public string? Fax { get; set; }

    public string? Mobile { get; set; }

    public string? Map { get; set; }

    public int? ZoneId { get; set; }

    public string? Box { get; set; }

    public string? PostCode { get; set; }

    public int? GlId { get; set; }

    public string? Email { get; set; }
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.Clients;

public partial class IsilXmlDatum
{
    [Key]
    public int Id { get; set; }

    public string XmlData { get; set; }

    public DateTime? LastUpdate { get; set; }

    public DateTime? IsilLastUpdate { get; set; }
}

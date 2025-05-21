using Core.DTOs;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.Core.DTOs.Clients;

public partial class IsilXmlDatumDto : EntityDto
{

    public int Id { get; set; }

    public string XmlData { get; set; }

    public DateTime? LastUpdate { get; set; }

    public DateTime? IsilLastUpdate { get; set; }
}

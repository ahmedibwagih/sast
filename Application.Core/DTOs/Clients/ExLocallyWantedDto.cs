using Core.DTOs;
using System;
using System.Collections.Generic;

namespace Application.Core.DTOs.Clients;

public partial class ExLocallyWantedDto : EntityDto
{
    public int LocallyWantedId { get; set; }

    public string Name { get; set; }

    public string Nid { get; set; }
}

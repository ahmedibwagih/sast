using Core.Other;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Core.DTOs;


namespace Application.Core.DTOs.Clients;

public partial class ExClientSectorsDto : EntityDto
{

    public int ClientSectorId { get; set; }

    public string? ClientSectorNameEn { get; set; }

    public string? ClientSectorNameAr { get; set; }

    public string? Desc { get; set; } 
}

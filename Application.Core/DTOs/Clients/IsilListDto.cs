using Core.DTOs;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.Core.DTOs.Clients;

public partial class IsilListDto : EntityDto
{

    public int Id { get; set; }

    public int Uid { get; set; }

    public string FullName { get; set; }

    public string AliasName { get; set; }

    public string Nationality { get; set; }

    public string Address { get; set; }
}

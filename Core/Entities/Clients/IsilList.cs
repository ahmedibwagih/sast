using Core.Other;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities.Clients;

public partial class IsilList
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Filter]
    public int Id { get; set; }

    public Boolean IsDeleted { get; set; }

    [Filter]
    public int Uid { get; set; }
    [Filter]
    public string FullName { get; set; }
    [Filter]
    public string AliasName { get; set; }
    [Filter]
    public string Nationality { get; set; }
    [Filter]
    public string Address { get; set; }
}

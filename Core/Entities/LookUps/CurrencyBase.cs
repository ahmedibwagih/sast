using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Other;

namespace Core.Entities.LookUps;

public partial class CurrencyBase
{
    [Key]

    public long Id { get; set; }
    
    public Boolean IsDeleted { get; set; }

    [Filter]
    public string Sign { get; set; }
    [Filter]
    public int CurrencyCode { get; set; }
    [Filter]
    public string CurrencyNameEn { get; set; }
    [Filter]
    public string CurrencyNameAr { get; set; }




    public int? CountryId { get; set; }
    [ForeignKey("CountryId")]
    public ExCountry ExCountry { get; set; }
}

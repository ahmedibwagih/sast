using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.Sec;
using Core.Other;

using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.LookUps
{
    public class CurrencyBaseDto : EntityDto
    {

        public Boolean IsDeleted { get; set; }

        public string Sign { get; set; }
        public int CurrencyCode { get; set; }
        public string CurrencyNameEn { get; set; }
        public string CurrencyNameAr { get; set; }
        public string CountryName { get; set; }
        public int? CountryId { get; set; }
    }
}

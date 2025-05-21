using Core.DTOs;
using Core.Other;


namespace Application.Core.DTOs.LookUps
{
    public class ExCountryDto : EntityDto
    {

        public int CountryId { get; set; }
        public Boolean IsDeleted { get; set; }

        public string CountryNameEn { get; set; }

        public string CountryNameAr { get; set; }

        public int SeverityId { get; set; }

        public int IsActve { get; set; } = 1;

        public decimal? OutLimit { get; set; }

    }
}

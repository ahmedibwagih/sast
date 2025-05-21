using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.Sec;
using Core.Other;

using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.LookUps
{
    public class FinYearsDto : EntityDto
    {
        public int FinYearId { get; set; }
        public string YearNameAr { get; set; }
        public string YearNameEn { get; set; }
        public Boolean IsCurrentYear { get; set; }
        public DateTime From { get; set; }
        public DateTime To { get; set; }
    }
}

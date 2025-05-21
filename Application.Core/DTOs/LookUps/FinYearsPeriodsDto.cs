using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.Sec;
using Core.Other;

using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.LookUps
{
    public class FinYearsPeriodsDto : EntityDto
    {
        public int FinYearsPeriodId { get; set; }
        public string PeriodNameAr { get; set; }
        public string PeriodNameEn { get; set; }
        public Boolean IsOpen { get; set; }
        public DateTime From { get; set; }
        public DateTime To { get; set; }
        public int FinYearId { get; set; }
    }
}

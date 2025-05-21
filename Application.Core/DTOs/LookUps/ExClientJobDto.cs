using Core.DTOs;
using Core.Other;


namespace Application.Core.DTOs.LookUps
{
    public class ExClientJobDto : EntityDto
    {
        public int JobId { get; set; }
        public Boolean IsDeleted { get; set; }

        public string JobCode { get; set; }

        public string JobName { get; set; }

        public string JobNameEn { get; set; }

        public int SeverityId { get; set; }
        public int? ClientSectorId { get; set; }

    }
}

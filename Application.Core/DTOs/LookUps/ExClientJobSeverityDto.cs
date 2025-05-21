using Core.DTOs;
using System;
using System.Collections.Generic;

namespace Application.Core.DTOs.LookUps
{
    public partial class ExClientJobSeverityDto : EntityDto
    {
        public int SeverityId { get; set; }
        public Boolean IsDeleted { get; set; }

        public string SeverityNameEn { get; set; }

        public string SeverityNameAr { get; set; }


    }
}

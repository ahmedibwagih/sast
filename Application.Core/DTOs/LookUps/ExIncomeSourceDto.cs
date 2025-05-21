using System;
using System.Collections.Generic;
using Core.DTOs;
using Core.Entities.others;

namespace Application.Core.DTOs.LookUps
{
    public partial class ExIncomeSourceDto : EntityDto
    {
        public int IncomeSourceId { get; set; }
        public Boolean IsDeleted { get; set; }

        public string IncomeSourceNameEn { get; set; }

        public string IncomeSourceNameAr { get; set; }

   
    }
}

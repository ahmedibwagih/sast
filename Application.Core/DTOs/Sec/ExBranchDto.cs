using Core.DTOs;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.Core.DTOs.Sec
{
    public partial class ExBranchDto : EntityDto
    {
        public int BranchId { get; set; }

        public string BranchCode { get; set; }

        public string BranchNameEn { get; set; }

        public string BranchNameAr { get; set; }

        public int? AccountId { get; set; }

        public bool Checked { get; set; }

        public int? ManagerId { get; set; }

    }
}

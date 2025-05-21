using Core.DTOs;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.Core.DTOs.Sec
{
    public partial class SecFormDto : EntityDto
    {
        [Key]
        public int FormId { get; set; }

        public int? ParentId { get; set; }

        public string FormName { get; set; }

        public string DisplayNameEn { get; set; }

        public string DisplayNameAr { get; set; }

        public int? FormOrder { get; set; }

        public bool ShowInLog { get; set; }

        public string TablesForLog { get; set; }

        public bool Installed { get; set; }

        public bool Checked { get; set; }


    }
}

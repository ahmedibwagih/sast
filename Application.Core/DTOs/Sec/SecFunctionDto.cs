using Core.DTOs;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.Core.DTOs.Sec
{
    public partial class SecFunctionDto : EntityDto
    {
        [Key]
        public int FunctionId { get; set; }

        public string FunctionName { get; set; }

        public string FunctionNameEn { get; set; }

        public string FunctionNameAr { get; set; }

        public int FunctionOrder { get; set; }

        public bool HasTextValue { get; set; }

        public bool Logged { get; set; }

 }
}

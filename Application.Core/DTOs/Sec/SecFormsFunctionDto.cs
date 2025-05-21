using Core.DTOs;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.Core.DTOs.Sec
{

    public partial class SecFormsFunctionDto : EntityDto
    {
        [Key]
        public int FormFunctionId { get; set; }

        public int FormId { get; set; }

        public int FunctionId { get; set; }


        public string FunctionName { get; set; }

        public string FormName { get; set; }
        public bool HasTextValue { get; set; }

        public string TextValue { get; set; }
        public bool Checked { get; set; }

    }
}

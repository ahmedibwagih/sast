using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Core.DTOs;
using Core.Entities.others;
using Core.Other;

namespace Application.Core.DTOs
{
    public partial class ExchangeResponse<T> where T : class
    {
        public ResponseEnum Status { get; set; }
        public T? Result { get; set; }

        public string? Notes { get; set; }

        public string? Error_Desc { get; set; }

    }
}

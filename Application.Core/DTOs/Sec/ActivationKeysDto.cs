using Core.DTOs;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.Core.DTOs.Sec
{
    public partial class ActivationKeysDto : EntityDto
    {
        public int ActivationKeyId { get; set; }
        public string? key { get; set; }
        public DateTime date { get; set; }
    }

    public partial class ActivationKeysData 
    {
        public DateTime From { get; set; }
        public DateTime To { get; set; }
        public int MaxUsers { get; set; }
        public int appid { get; set; }
        public int custid { get; set; }

    }
}

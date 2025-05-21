using Core.DTOs;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.Core.DTOs.Sec
{

    public partial class SecTransactionLogDto : EntityDto
    {
        [Key]
        public int LogId { get; set; }

        public int UserId { get; set; }

        public int FormId { get; set; }

        public int FunctionId { get; set; }

        public int ItemId { get; set; }

        public int ItemNo { get; set; }

        public DateTime ActionDate { get; set; }

        public string ActionDetails { get; set; }

   
    }
}

using Core.DTOs;
using Core.Entities.LookUps;
using Core.Other;

using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.Clients
{
    public partial class ExAttachmentTypeDto : EntityDto
    {
        public int TypeId { get; set; }
        public Boolean IsDeleted { get; set; }

        public string TypeNameEn { get; set; }

        public string TypeNameAr { get; set; }
    }
}

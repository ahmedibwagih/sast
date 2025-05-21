using Core.DTOs;
using Core.Entities.LookUps;
using Core.Other;

using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.Clients
{
    public partial class ExClientsAttachmentDto : EntityDto
    {
        public int ClientAttachmentId { get; set; }
        public Boolean IsDeleted { get; set; }

        public int ClientId { get; set; }

        public int? AttachmentTypeId { get; set; }

        public bool IsOptimized { get; set; }

        public string AttachmentFilePath { get; set; }

        public string AttachmentName { get; set; }

        public bool HasAttachment { get; set; }

        public bool HasAttachmentPdf { get; set; }

    }
}

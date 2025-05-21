using Core.DTOs;
using Core.Entities.LookUps;
using Core.Other;

using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.Clients
{
    public partial class ExClientsRepresentativeDto : EntityDto
    {
        public int RepresentativeId { get; set; }
        public Boolean IsDeleted { get; set; }

        public int ClientId { get; set; }

        public string RepresentativeName { get; set; }
        public string path { get; set; }

        public bool IsOptimized { get; set; }

        public bool? HasAttachment { get; set; }

        public bool? HasAttachmentPdf { get; set; }

    }
}

using Core.DTOs;
using Core.Entities.LookUps;
using Core.Other;

using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.Clients
{
    public partial class ExClientsMembershipDto : EntityDto
    {
        public int MembershipId { get; set; }

        public Boolean IsDeleted { get; set; }

        public int ClientId { get; set; }

        public DateTime? CreationDate { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public string JobTitle { get; set; }

        public string path { get; set; }

        public decimal Salary { get; set; }

        public bool? HasAttachment { get; set; }

        public bool? HasAttachmentPdf { get; set; }

    }
}

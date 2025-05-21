using Core.DTOs;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Other;

using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.Clients
{
    public partial class ExClientsNoteDto : EntityDto
    {
        //public long Id { get; set; }
        public int ClientId { get; set; }
        public NoteTypeEnum NoteType { get; set; }
        public string Desc { get; set; }

        public DateTime? NoteDate { get; set; }

    }

    public partial class ExClientsNoteDto2 : EntityDto
    {
        public long Id { get; set; }
        public int ClientId { get; set; }
        public string NoteType { get; set; }
        public string Desc { get; set; }

        public DateTime? NoteDate { get; set; }

    }
}

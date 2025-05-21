using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.Sec;
using Core.Other;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities.Clients
{
    public  class ExClientsNote 
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Filter]
        public long Id { get; set; }

        public int ClientId { get; set; }
        [ForeignKey("ClientId")]
        public ExClient ExClient { get; set; }


        public NoteTypeEnum NoteType { get; set; }

        public string Desc { get; set; }

        public DateTime? NoteDate { get; set; }

    }
}

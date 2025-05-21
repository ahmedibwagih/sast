using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.Clients;

public partial class ExClientsRepresentative
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int RepresentativeId { get; set; }

    public Boolean IsDeleted { get; set; }

    public int ClientId { get; set; }

    public string RepresentativeName { get; set; }

    public bool IsOptimized { get; set; }

    public bool? HasAttachment { get; set; }

    public bool? HasAttachmentPdf { get; set; }

    public string path { get; set; }

    public virtual ExClient Client { get; set; }
}

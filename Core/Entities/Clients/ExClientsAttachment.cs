using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.Clients;

public partial class ExClientsAttachment
{

    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int ClientAttachmentId { get; set; }
    public Boolean IsDeleted { get; set; }

    public int ClientId { get; set; }

    public int? AttachmentTypeId { get; set; }

    public bool IsOptimized { get; set; }

    public string AttachmentFilePath { get; set; }

    public string AttachmentName { get; set; }

    public bool HasAttachment { get; set; }

    public bool HasAttachmentPdf { get; set; }

    public virtual ExAttachmentType AttachmentType { get; set; }

    public virtual ExClient Client { get; set; }
}

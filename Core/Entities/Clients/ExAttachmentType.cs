using System;
using System.Collections.Generic;

namespace Core.Entities.Clients;

public partial class ExAttachmentType
{
    public int TypeId { get; set; }
    public Boolean IsDeleted { get; set; }

    public string TypeNameEn { get; set; }

    public string TypeNameAr { get; set; }

    public virtual ICollection<ExClientsAttachment> ExClientsAttachments { get; set; } = new List<ExClientsAttachment>();
}

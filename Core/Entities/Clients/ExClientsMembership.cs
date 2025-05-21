using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.Clients;

public partial class ExClientsMembership
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int MembershipId { get; set; }

    public Boolean IsDeleted { get; set; }

    public int ClientId { get; set; }

    public DateTime? CreationDate { get; set; }

    public DateTime StartDate { get; set; }

    public DateTime EndDate { get; set; }

    public string JobTitle { get; set; }

    public decimal Salary { get; set; }

    public bool? HasAttachment { get; set; }

    public bool? HasAttachmentPdf { get; set; }

         public string path { get; set; }

    public virtual ExClient Client { get; set; }
}

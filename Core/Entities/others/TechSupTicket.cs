using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.others;

public partial class TechSupTicket
{
    [Key]
    public int Id { get; set; }

    public DateTime CreationDate { get; set; }

    public string Title { get; set; }

    public string Summary { get; set; }
}

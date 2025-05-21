using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Core.Entities.LookUps;
using Core.Entities.Sec;
using Core.Other;
using Core.Entities.TRN_Invoices;

namespace Core.Entities.Clients;

public partial class ClientSecurityFile
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Filter]
    public long ClientSecId { get; set; }

    public Boolean IsDeleted { get; set; }
    [Filter]
    public string Name { get; set; }
    [Filter]
    public string NatId { get; set; }
    [Filter]
    public string Country { get; set; }
    public string Add1 { get; set; }
    public string Add2 { get; set; }
    public string Add3 { get; set; }
    public string Add4 { get; set; }



}

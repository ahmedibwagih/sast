using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.TRN_Transfers;
using Core.Entities.Clients;
using Core.Entities.TRN_Invoices;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_WholeInvoices;
using Core.Other;
using Core.Entities.Account;

namespace Core.Entities.LookUps;

public partial class TreasuryDealers
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int TreasuryDealerId { get; set; }
    [Filter]

    public int TreasuryId { get; set; }
    [ForeignKey("TreasuryId")]
    public Treasury Treasury { get; set; }

    public int UserId { get; set; }
    [ForeignKey("UserId")]
    public SecUser SecUser { get; set; }


    public string Desc { get; set; }
    public DateTime Date { get; set; }

    public Boolean? IsDeleted { get; set; }



}

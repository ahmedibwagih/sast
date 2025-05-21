using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.DTOs;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;
using Core.Other;

namespace Core.DTOs.FinReports;

public partial class Kashf_TahlelyOutPut
{
    /// <summary>
    /// /////////
    /// </summary>
    public List<Kashf_TahlelyOutPut1> Kashf_TahlelyOutPut1 { get; set; }
    public List<Kashf_TahlelyOutPut2> Kashf_TahlelyOutPut2 { get; set; }


}

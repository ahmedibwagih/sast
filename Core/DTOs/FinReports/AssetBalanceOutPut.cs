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

public partial class AssetBalanceOutPut
{
    /// <summary>
    /// /////////
    /// </summary>
    public List<AssetBalanceOutPut1> AssetBalanceOutPut1 { get; set; }
    public List<AssetBalanceOutPut2> AssetBalanceOutPut2 { get; set; }
    public List<AssetBalanceOutPut3> AssetBalanceOutPut3 { get; set; }
    public List<AssetBalanceOutPut4> AssetBalanceOutPut4 { get; set; }


}

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

public partial class Central_statmentOutPut
{
    public int? AccountID { get; set; }
    public int? ParentID { get; set; }
    public string AccountName { get; set; }
    public decimal Value { get; set; }
    public decimal Value1 { get; set; }
    public decimal Value2 { get; set; }
    public decimal Value3 { get; set; }
    public decimal Value4 { get; set; }
}


public partial class Central_statmentOutPut_compare
{
    public int? AccountID { get; set; }
    public int? ParentID { get; set; }
    public string AccountName { get; set; }
    public decimal Value1 { get; set; }
    public decimal Value2 { get; set; }
}
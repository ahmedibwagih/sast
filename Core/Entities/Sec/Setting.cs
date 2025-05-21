using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.TRN_Invoices;
using Core.Entities.others;
using Core.Other;
using Core.Entities.Account;

namespace Core.Entities.Sec;

public partial class Setting
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Column(Order = 0)]
    public int SettingID { get; set; }
    [Filter]
    public string SettingName { get; set; }
    [Filter]
    public string DefaultValue { get; set; }
    public DateTime date { get; set; } = DateTime.Now;

}

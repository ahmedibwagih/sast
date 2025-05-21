using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.TRN_Invoices;
using Core.Entities.others;
using Core.Other;
using Core.Entities.Account;
using Core.DTOs;

namespace Core.Entities.Sec;

public partial class SettingDto : EntityDto
{

    public int SettingID { get; set; }
    public string SettingName { get; set; }
    public string DefaultValue { get; set; }
    public DateTime date { get; set; } = DateTime.Now;

}

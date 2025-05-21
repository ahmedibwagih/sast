using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.TRN_Invoices;
using Core.Entities.others;
using Core.Other;
using Core.Entities.Account;
using Core.Entities.LookUps;
using Core.DTOs;

namespace Core.Entities.Sec;


public partial class UserSettingDto : EntityDto
{

    public int UserSettingID { get; set; }
    public int SettingID { get; set; }

    public string SettingName { get; set; }
    public int UserId { get; set; }

    public string Value { get; set; }

}

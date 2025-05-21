using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.TRN_Invoices;
using Core.Entities.others;
using Core.Other;
using Core.Entities.Account;
using Core.Entities.LookUps;

namespace Core.Entities.Sec;


public partial class UserSetting
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Column(Order = 0)]
    public int UserSettingID { get; set; }
    public int SettingID { get; set; }
    [ForeignKey("SettingID")]
    public virtual Setting Setting { get; set; }
    public int UserId { get; set; }
    [ForeignKey("UserId")]
    public virtual SecUser SecUser { get; set; }
    public string Value { get; set; }

}

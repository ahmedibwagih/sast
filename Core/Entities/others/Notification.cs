using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.others;

public partial class Notification
{


    public long Id { get; set; }

    public string CreateUser { get; set; }

    public string CreateUserName { get; set; }

    public string UpdateUser { get; set; }

    public string UpdateUserName { get; set; }

    public DateTime? CreateDate { get; set; }

    public DateTime? UpdateDate { get; set; }

    public string UserId { get; set; }

    public string Message { get; set; }

    public int NotificationType { get; set; }

    public string DataId { get; set; }

    public string DataDesc { get; set; }

    public bool IsRead { get; set; }

    public bool IsPending { get; set; }


}

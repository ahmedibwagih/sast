using System;
using System.Collections.Generic;

namespace SecurityPermits.Server.Models;

public partial class AccessPermitDto
{
    public long Id { get; set; }

    public int EmpNumber { get; set; }

    /// <summary>
    /// نوع اصلاحيه   0 اعتماد التصاريح الامنية   
    /// </summary>
    public int? AccessType { get; set; }

    public Boolean? IsAllowed { get; set; }
    /// <summary>
    /// لفرع معين  0 تعني كل الفروع
    /// </summary>
    //public int? ForBranchId { get; set; }

    ///// <summary>
    ///// لاداره معنيه 0 تعني كل الادارات
    ///// </summary>
    //public int? FroDepartmentId { get; set; }

    ///// <summary>
    ///// لاداره فرعيه معينه 0 تعني الكل
    ///// </summary>
    //public int? ForDepartmentSectionId { get; set; }
}

using System;
using System.Collections.Generic;

namespace SecurityPermits.Server.Models;

public partial class Permit
{
    public long Id { get; set; }

    /// <summary>
    /// الفرع
    /// </summary>
    public int? BranchId { get; set; }

    /// <summary>
    /// الاداره
    /// </summary>
    public int? DepartmentId { get; set; }

    /// <summary>
    /// الاداره الفرعية
    /// </summary>
    public int? DepartmentSectionId { get; set; }

    /// <summary>
    /// المقاول
    /// </summary>
    public string? ContractorName { get; set; }

    /// <summary>
    /// الشركة
    /// </summary>
    public string? CompanyName { get; set; }

    /// <summary>
    /// التلفون الداخلي لموظف الادخال
    /// </summary>
    public string? EntryEmpPhone { get; set; }

    /// <summary>
    /// موظف الاعتماد
    /// </summary>
    public int? ApproveEmpNumber { get; set; }

    public DateTime? PermitFrom { get; set; }

    public DateTime? PermitTo { get; set; }

    /// <summary>
    /// موبايل موظف الادخال
    /// </summary>
    public string? EntryEmpMobile { get; set; }

    /// <summary>
    /// تاريخ الاعتماد
    /// </summary>
    public DateTime? ApproveEmpDate { get; set; }

    /// <summary>
    /// حاله الاعتماد -1 0  1 مرفوض جديد تم الاعتماد   المشرف  2 الاعتماد الرئيسي
    /// </summary>
    public int? Status { get; set; }

    /// <summary>
    /// موظف الادخال
    /// </summary>
    public int EntryEmpNumber { get; set; }

    /// <summary>
    /// تاريخ الادخال
    /// </summary>
    public DateTime? EntryEmpDate { get; set; }

    public int? SupervisorEmpNumber { get; set; }

    public DateTime? SupervisorEmpDate { get; set; }

    public int? HeadSerctorEmpNumber { get; set; }

    public string? BranchStatus { get; set; }

    public virtual ICollection<PermitDoc> PermitDocs { get; set; } = new List<PermitDoc>();

    public virtual ICollection<PermitPerson> PermitPeople { get; set; } = new List<PermitPerson>();

    public virtual ICollection<PermitWorkType> PermitWorkTypes { get; set; } = new List<PermitWorkType>();

    public virtual ICollection<PermitsDevice> PermitsDevices { get; set; } = new List<PermitsDevice>();
}

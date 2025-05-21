using System;
using System.Collections.Generic;

namespace SecurityPermits.Server.Models;

public partial class PermitDto
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
    /// موظف الادخال
    /// </summary>
    public int EntryEmpNumber { get; set; }

    /// <summary>
    /// تاريخ الادخال
    /// </summary>
    public DateTime EntryEmpDate { get; set; }

    /// <summary>
    /// موبايل موظف الادخال
    /// </summary>
    public string? EntryEmpMobile { get; set; }

    /// <summary>
    /// تاريخ الاعتماد
    /// </summary>
    public DateTime? ApproveEmpDate { get; set; }

    /// <summary>
    /// حاله الاعتماد -1 0  1 مرفوض جديد تم الاعتماد  
    /// </summary>
    public int? Status { get; set; }


    /// <summary>
    /// موظف المشرف
    /// </summary>
    public int supervisorEmpNumber { get; set; }

    /// <summary>
    /// تاريخ اعتماد الاشراف
    /// </summary>
    public DateTime? supervisorEmpDate { get; set; }

    /// <summary>
    /// رئيس القطاع
    /// </summary>
    public int HeadSerctorEmpNumber { get; set; }

    /// <summary>
    /// حاله الفرع
    /// </summary>

    public string? BranchStatus { get; set; }


    public List<PermitDocDto>? PermitDocs { get; set; }
    public List<PermitsDeviceDto>? PermitsDevices { get; set; }
    public  List<PermitPersonDto>? PermitPeople { get; set; } 
    public  List<PermitWorkTypeDto>? PermitWorkTypes { get; set; } 
  


}

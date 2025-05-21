using System;
using System.Collections.Generic;

namespace SecurityPermits.Server.Models;

public partial class PermitsDevice
{
    public long Id { get; set; }

    public long PermitId { get; set; }

    /// <summary>
    /// اسم الجهاز
    /// </summary>
    public string? DeviceName { get; set; }

    /// <summary>
    /// العدد
    /// </summary>
    public int? DeviceCount { get; set; }

    /// <summary>
    /// النوع
    /// </summary>
    public string? DeviceType { get; set; }

    /// <summary>
    /// سيريال 
    /// </summary>
    public string? DeviceSerialNo { get; set; }

    /// <summary>
    /// تاريخ سحب الجهاز
    /// </summary>
    public DateTime? OutDate { get; set; }

    /// <summary>
    /// تاريخ العوده المتوقع
    /// </summary>
    public DateTime? ExpectedReturnDate { get; set; }

    /// <summary>
    /// حاله الجهاز 1 تم سحبه 2 تم رجوعه 0 لم يتم سحبه
    /// </summary>
    public int? DeviceStatus { get; set; }

    /// <summary>
    /// تاريخ العوده الفعلي
    /// </summary>
    public DateTime? ReturnDate { get; set; }

    /// <summary>
    /// الموظف المسئول عن عوده الاجهزه
    /// </summary>
    public int? EmpNumberReturn { get; set; }

    public virtual Permit Permit { get; set; } = null!;


    /// <summary>
    /// ملاحظات الرجوع 
    /// </summary>
    public string? ReturnDeviceNote { get; set; }
}

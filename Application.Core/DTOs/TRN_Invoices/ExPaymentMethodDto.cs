using Core.DTOs;
using System;
using System.Collections.Generic;

namespace Application.Core.DTOs.TRN_Invoices;

public partial class ExPaymentMethodDto : EntityDto
{
    public int PaymentMethod { get; set; }

    public string PaymentMethodNameEn { get; set; }

    public string PaymentMethodNameAr { get; set; }
}

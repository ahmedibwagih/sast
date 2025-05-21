using System;
using System.Collections.Generic;

namespace Core.Entities.TRN_Invoices;

public partial class ExPaymentMethod
{
    public int PaymentMethod { get; set; }

    public string PaymentMethodNameEn { get; set; }

    public string PaymentMethodNameAr { get; set; }
}

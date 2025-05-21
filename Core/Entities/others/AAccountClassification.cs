using System;
using System.Collections.Generic;

namespace Core.Entities.others;

public partial class AAccountClassification
{
    public int ClassificationId { get; set; }

    public int ClassificationCode { get; set; }

    public string ClassificationNameEn { get; set; }

    public string ClassificationNameAr { get; set; }
}

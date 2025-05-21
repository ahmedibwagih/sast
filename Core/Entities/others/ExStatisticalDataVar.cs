using System;
using System.Collections.Generic;

namespace Core.Entities.others;

public partial class ExStatisticalDataVar
{
    public int Id { get; set; }

    public string VarCaption { get; set; }

    public int VarOrder { get; set; }

    public string CellRange { get; set; }

    public string CellValue { get; set; }
}

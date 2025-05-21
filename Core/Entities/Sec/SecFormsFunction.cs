using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities.Sec;

public partial class SecFormsFunction
{
    [Key]
    public int FormFunctionId { get; set; }

    public int FormId { get; set; }

    public int FunctionId { get; set; }

    public virtual SecForm Form { get; set; }

    public virtual SecFunction Function { get; set; }

    public virtual ICollection<SecUsersFunction> SecUsersFunctions { get; set; } = new List<SecUsersFunction>();
}

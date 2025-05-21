using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities.Sec;

public partial class SecPermissionTypeBranches
{
    [Key]
    public int ID { get; set; }
    public int PermissionTypeId { get; set; }
    [ForeignKey("PermissionTypeId")]
    public SecPermissionType SecPermissionType { get; set; }

    public int  BranchId { get; set; }
 
    [ForeignKey("BranchId")]
    public ExBranch ExBranch { get; set; }


    public bool Selected { get; set; }


    

}

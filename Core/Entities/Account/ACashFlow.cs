using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.Sec;
using Core.Other;
using Core.Entities.others;

namespace Core.Entities.Account;

public partial class ACashFlow
{
    [Filter]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int VoucherId { get; set; }

    public int VoucherNo { get; set; }

    public DateTime VoucherDate { get; set; }

    public DateTime VoucherTime { get; set; }
    //1 صرف
    //2 قبض
    public int VoucherTypeId { get; set; }

    public int? SupplierId { get; set; }
    //0 خزينة
    //1 بنك
    public int PaymentMethod { get; set; }

    public string CheckNo { get; set; }

    public int? BankId { get; set; }

    public decimal Amount { get; set; }

    public int CurrencyId { get; set; }

    public string Remarks { get; set; }

    public int UserId { get; set; }

    public int StatusId { get; set; }

    public int? BranchID { get; set; }
    [ForeignKey("BranchID")]
    public ExBranch ExBranch { get; set; }

    public Boolean IsDeleted { get; set; }

    public virtual ICollection<AJv> AJvs { get; set; } = new List<AJv>();

    public virtual Currency Currency { get; set; }

    public virtual ACashFlowStatus Status { get; set; }

    public virtual ExSupplier Supplier { get; set; }

    public virtual SecUser User { get; set; }

    public virtual ACashFlowType VoucherType { get; set; }
}

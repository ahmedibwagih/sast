using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using Core.Entities.Clients;
using Core.Entities.TRN_Invoices;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Other;
using System.ComponentModel.DataAnnotations;
using Core.DTOs;
using Application.Core.DTOs.Account;
using Core.Entities.Taswya;
using Core.Entities.TreasuryTransfere;

namespace Application.Core.DTOs;



public class UserActionsInputResult : EntityDto
{

    public int Jvid { get; set; }

    public int Jvno { get; set; }

    public DateTime Jvdate { get; set; }

    public DateTime Jvtime { get; set; }

    public int JvtypeId { get; set; }
    public string JvtypeName { get; set; }


    public int ActionID { get; set; }
    //public int? InvoiceId { get; set; }

    //public int? WholeInvoiceId { get; set; }

    //public int? CashFlowId { get; set; }

    //public int? BranchTransferId { get; set; }
    //public long? BanksTransfereId { get; set; }
    //public long? BanksTreasuryTransfereId { get; set; }
    //public int? TreasuryTransferId { get; set; }
    //public int? TaswyaTransferId { get; set; }


    public Boolean IsDeleted { get; set; }




    public int? BranchID { get; set; }
    public string BranchName { get; set; }


    public int? UserId { get; set; }
   // public string UserName { get; set; }

    public virtual List<AJvsDetailDto> AJvsDetails { get; set; } = new List<AJvsDetailDto>();



}
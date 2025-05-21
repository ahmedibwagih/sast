using Core.Entities.LookUps;
using Core.Entities.Sec;
using Core.Repositories.LookUps;


using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System;
using System.Threading.Tasks;
using System.Linq;
using System.Linq.Dynamic.Core;
using Core.DTOs;
using Core.Other;
using Core.Entities.Clients;
using Core.Repositories.Client;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
using System.Diagnostics.Eventing.Reader;
using Core.Entities.TRN_Invoices;
using Core.Repositories.TRN_Invoices;
using Core.Entities.TRN_WholeInvoices;
using Core.Entities.TRN_Transfers;
using Core.Repositories.TRN_Transfers;
using Core.Entities.Taswya;
using Core.Entities.TreasuryTransfere;

namespace Infrastructure.Repositories
{
    public class ExTreasuryTransfereDetailRepository : BaseRepository<ExTreasuryTransfereDetail>, IExTreasuryTransfereDetailRepository
    {


        public ExTreasuryTransfereDetailRepository(DBContext context) : base(context)
        {

        }

       


    }
}

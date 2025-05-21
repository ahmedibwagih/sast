using Core.Entities.Account;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Repositories.Account;
using Core.Repositories.LookUps;


using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using System;
using System.Linq.Dynamic.Core;
using Core.Entities.TRN_Invoices;
using Core.DTOs;
using System.Collections.Generic;
using System.Linq;
using Core.Other;

namespace Infrastructure.Repositories
{
    public class ACashFlowRepository : BaseRepository<ACashFlow>, IACashFlowRepository
    {


        public ACashFlowRepository(DBContext context) : base(context)
        {

        }

        public async Task<int> GetNextTrnNo(int brn)
        {

            var c = (_context.Set<ACashFlow>().Where(a => a.BranchID == brn).Count());
            if (c > 0)
                return (_context.Set<ACashFlow>().Where(a => a.BranchID == brn).Max(a => a.VoucherNo)) + 1;
            else return 1;

        }


    }
}

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
    public class ExTreasuryTransfereRepository : BaseRepository<ExTreasuryTransfere>, IExTreasuryTransfereRepository
    {


        public ExTreasuryTransfereRepository(DBContext context) : base(context)
        {

        }
        public async Task<int> GetNextTransferNo(int brn)
        {
            var c = (_context.Set<ExTreasuryTransfere>().Where(a => a.FromBranchID == brn).Count());
            if (c > 0)
                return (_context.Set<ExTreasuryTransfere>().Where(a => a.FromBranchID == brn).Max(a => a.TransferNo)) + 1;
            else return 1;
        }


        public override async Task<List<ExTreasuryTransfere>> GetAsync(string cond)
        {
            try
            {
                var query = DbSet.AsQueryable();
                //  query = query.Include(a=>a.Branch).Include(a=>a.PermissionType).Where(cond);

                if (HasIsDeleted())
                    return await query.Include(a => a.ExTreasuryTransfereDetail).Where(cond)

                    .Where("isdeleted == false  ").ToListAsync();
                else
                    return await query.Where(cond).Include(a => a.ExTreasuryTransfereDetail)

                    .ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return null;
        }





        public override async Task<ExTreasuryTransfere> GetByIdAsync(long id)
        {

            int newid = int.Parse(id.ToString());
            return await _context.Set<ExTreasuryTransfere>().Include(a => a.ExTreasuryTransfereDetail)


                     // .Include(a => a.PermissionType).Include(a => a.Branch)
                     .FirstOrDefaultAsync(e => e.TransferId == newid);

        }


    }
}

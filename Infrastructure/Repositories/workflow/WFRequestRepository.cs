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
using Core.Entities.Workflow;
using Core.Repositories.Workflow;

namespace Infrastructure.Repositories
{
    public class WFRequestRepository : BaseRepository<WFRequest>, IWFRequestRepository
    {


        public WFRequestRepository(DBContext context) : base(context)
        {

        }

        public override async Task<List<WFRequest>> GetAsync(string cond)
        {
            try
            {
                var query = DbSet.AsQueryable();
                //  query = query.Include(a=>a.Branch).Include(a=>a.PermissionType).Where(cond);

                if (HasIsDeleted())
                    return await query.Include(a => a.SecUser).Include(a => a.ExBranch).Include(a => a.WFRequestType)

                    .Where("isdeleted == false  and (" + cond + ")").ToListAsync();
                else
                    return await query.Include(a => a.SecUser).Include(a => a.ExBranch).Include(a => a.WFRequestType).Where(cond)

                    .ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return null;
        }





    }
}

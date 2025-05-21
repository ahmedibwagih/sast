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

namespace Infrastructure.Repositories
{
    public class ExInvoiceRepository : BaseRepository<ExInvoice>, IExInvoiceRepository
    {


        public ExInvoiceRepository(DBContext context) : base(context)
        {

        }



        public override async Task<List<ExInvoice>> GetAsync(string cond)
        {
            try
            {
                var query = DbSet.AsQueryable();
                //  query = query.Include(a=>a.Branch).Include(a=>a.PermissionType).Where(cond);

                if (HasIsDeleted())
                    return await query.Include(a => a.ExInvoicesDetails).Where(cond)
                    
                    .Where("isdeleted == false  ").ToListAsync();
                else
                    return await query.Where(cond).Include(a => a.ExInvoicesDetails)
                    
                    .ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return null;
        }


        public override async Task<List<ExInvoice>> GetAllAsync()
        {//.Include(a => a.PermissionType).Include(a => a.Branch)

            IQueryable<ExInvoice> query = GetQueryableForGetAllPaging();

            if (HasIsDeleted())
                return await query.Include(a => a.ExInvoicesDetails)
                    .Where("isdeleted == false  ").ToListAsync();
            else
                return await query.Include(a => a.ExInvoicesDetails).ToListAsync();
        }

        public override async Task<Tuple<ICollection<ExInvoice>, int>> GetAllPagingAsync(PagingInputDto pagingInputDto)
        {
            IQueryable<ExInvoice> query = GetQueryableForGetAllPaging();

            if (pagingInputDto.HiddenFilter != null)
            {
                query = query.Where(pagingInputDto.HiddenFilter);
            }

            if (pagingInputDto.Filter != null)
            {
                var props = typeof(ExInvoice).GetProperties().Where(prop => Attribute.IsDefined(prop, typeof(FilterAttribute)));
                var condition = "";
                foreach (var p in props)
                {
                    condition = (condition == "" ? condition : condition + " || ") + p.Name + ".ToString().Contains(@0)";
                }

                query = query.Where(condition, pagingInputDto.Filter);
            }
            if (HasIsDeleted())
                query = query.Where("isdeleted == false  ");

            var order = query;
            if (pagingInputDto.OrderByField != null)
                order = query.OrderBy(pagingInputDto.OrderByField + " " + pagingInputDto.OrderType);

            var page = order.Skip(pagingInputDto.PageNumber * pagingInputDto.PageSize - pagingInputDto.PageSize).Take(pagingInputDto.PageSize);
            var total = 0;
            try
            {
                total = await query.CountAsync();
            }
            catch (Exception ex)
            {
            }
            _context.Database.SetCommandTimeout(0);
            return new Tuple<ICollection<ExInvoice>, int>(await page.Include(a => a.ExInvoicesDetails)
                    
                    .ToListAsync(), total);
            //.Include(a => a.PermissionType).Include(a => a.Branch)
        }


        public override async Task<ExInvoice> GetByIdAsync(long id)
        {

            int newid = int.Parse(id.ToString());
            return await _context.Set<ExInvoice>().Include(a => a.ExInvoicesDetails)
                    
                    
                     // .Include(a => a.PermissionType).Include(a => a.Branch)
                     .FirstOrDefaultAsync(e => e.InvoiceId == newid);

        }


        public async Task<int> GetNextInvoiceNo(int brn)
        {

            var c = (_context.Set<ExInvoice>().Where(a => a.BranchID == brn).Count());
            if (c > 0)
                return (_context.Set<ExInvoice>().Where(a => a.BranchID == brn).Max(a => a.InvoiceNo)) + 1;
            else return 1;

        }


    }
}

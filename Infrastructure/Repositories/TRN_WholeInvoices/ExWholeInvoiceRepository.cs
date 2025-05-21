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
using Core.Repositories.TRN_Transfers;
using Core.Entities.Taswya;

namespace Infrastructure.Repositories
{
    public class ExWholeInvoiceRepository : BaseRepository<ExWholeInvoice>, IExWholeInvoiceRepository
    {


        public ExWholeInvoiceRepository(DBContext context) : base(context)
        {

        }



        public override async Task<List<ExWholeInvoice>> GetAsync(string cond)
        {
            try
            {
                var query = DbSet.AsQueryable();
                //  query = query.Include(a=>a.Branch).Include(a=>a.PermissionType).Where(cond);

                if (HasIsDeleted())
                    return await query.Include(a => a.ExWholeInvoicesDetails).Where(cond)

                    .Where("isdeleted == false  ").ToListAsync();
                else
                    return await query.Where(cond).Include(a => a.ExWholeInvoicesDetails)

                    .ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return null;
        }


        public override async Task<List<ExWholeInvoice>> GetAllAsync()
        {//.Include(a => a.PermissionType).Include(a => a.Branch)

            IQueryable<ExWholeInvoice> query = GetQueryableForGetAllPaging();

            if (HasIsDeleted())
                return await query.Include(a => a.ExWholeInvoicesDetails)
                    .Where("isdeleted == false  ").ToListAsync();
            else
                return await query.Include(a => a.ExWholeInvoicesDetails).ToListAsync();
        }

        public override async Task<Tuple<ICollection<ExWholeInvoice>, int>> GetAllPagingAsync(PagingInputDto pagingInputDto)
        {
            IQueryable<ExWholeInvoice> query = GetQueryableForGetAllPaging();

            if (pagingInputDto.HiddenFilter != null)
            {
                query = query.Where(pagingInputDto.HiddenFilter);
            }

            if (pagingInputDto.Filter != null)
            {
                var props = typeof(ExWholeInvoice).GetProperties().Where(prop => Attribute.IsDefined(prop, typeof(FilterAttribute)));
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
            return new Tuple<ICollection<ExWholeInvoice>, int>(await page.Include(a => a.ExWholeInvoicesDetails)

                    .ToListAsync(), total);
            //.Include(a => a.PermissionType).Include(a => a.Branch)
        }


        public override async Task<ExWholeInvoice> GetByIdAsync(long id)
        {

            int newid = int.Parse(id.ToString());
            return await _context.Set<ExWholeInvoice>().Include(a => a.ExWholeInvoicesDetails)


                     // .Include(a => a.PermissionType).Include(a => a.Branch)
                     .FirstOrDefaultAsync(e => e.InvoiceId == newid);

        }



        public  async Task<int> GetNextInvoiceNo(int brn)
        {

            var c = (_context.Set<ExWholeInvoice>().Where(a => a.BranchID == brn).Count());
            if (c > 0)
                return (_context.Set<ExWholeInvoice>().Where(a => a.BranchID == brn).Max(a => a.InvoiceNo)) + 1;
            else return 1;
        }




    }
}

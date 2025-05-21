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
    public class AJvRepository : BaseRepository<AJv>, IAJvRepository
    {


        public AJvRepository(DBContext context) : base(context)
        {

        }

        //public override async Task<AJv> GetByIdLightAsync(long id)
        //{
        //    try
        //    {
        //        //  return await Context.Set<AJv>().Include(a => a.AJvsDetails).Where(a=>a.).FindAsync(id);

        //        AJv AJv =(await Context.Set<AJv>().Include(a => a.AJvsDetails)

        //          .FirstOrDefaultAsync(e => e.Jvid == int.Parse( id.ToString())));
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //}



        public override async Task<List<AJv>> GetAsync(string cond)
        {
            try
            {
                var query = DbSet.AsQueryable();
                //  query = query.Include(a=>a.Branch).Include(a=>a.PermissionType).Where(cond);

                if (HasIsDeleted())
                    return await query.Include(a => a.AJvsDetails).Where(cond)

                    .Where("isdeleted == false  ").ToListAsync();
                else
                    return await query.Where(cond).Include(a => a.AJvsDetails)

                    .ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return null;
        }


        public override async Task<List<AJv>> GetAllAsync()
        {//.Include(a => a.PermissionType).Include(a => a.Branch)

            IQueryable<AJv> query = GetQueryableForGetAllPaging();

            if (HasIsDeleted())
                return await query.Include(a => a.AJvsDetails)
                    .Where("isdeleted == false  ").ToListAsync();
            else
                return await query.Include(a => a.AJvsDetails).ToListAsync();
        }

        public override async Task<Tuple<ICollection<AJv>, int>> GetAllPagingAsync(PagingInputDto pagingInputDto)
        {
            IQueryable<AJv> query = GetQueryableForGetAllPaging();

            if (pagingInputDto.HiddenFilter != null)
            {
                query = query.Where(pagingInputDto.HiddenFilter);
            }

            if (pagingInputDto.Filter != null)
            {
                var props = typeof(AJv).GetProperties().Where(prop => Attribute.IsDefined(prop, typeof(FilterAttribute)));
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
            return new Tuple<ICollection<AJv>, int>(await page.Include(a => a.AJvsDetails)

                    .ToListAsync(), total);
            //.Include(a => a.PermissionType).Include(a => a.Branch)
        }


        public override async Task<AJv> GetByIdAsync(long id)
        {

            int newid = int.Parse(id.ToString());
            return await _context.Set<AJv>().Include(a => a.AJvsDetails)


                     // .Include(a => a.PermissionType).Include(a => a.Branch)
                     .FirstOrDefaultAsync(e => e.Jvid == newid);

        }




        public async Task<int> GetNextTrnNo(int brn)
        {

            var c = (_context.Set<AJv>().Where(a => a.BranchID == brn).Count());
            if (c > 0)
                return (_context.Set<AJv>().Where(a => a.BranchID == brn).Max(a => a.Jvno)) + 1;
            else return 1;

        }

    }
}

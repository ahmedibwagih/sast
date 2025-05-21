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
    public class AAccountRepository : BaseRepository<AAccount>, IAAccountRepository
    {


        public AAccountRepository(DBContext context) : base(context)
        {

        }



        public override async Task<AAccount> GetByIdAsync(long id)
        {

            int newid = int.Parse(id.ToString());
            return await _context.Set<AAccount>().Include(a => a.Parent)
                     .FirstOrDefaultAsync(e => e.AccountId == newid);

        }

        public override async Task<List<AAccount>> GetAsync(string cond)
        {
            try
            {
                var query = DbSet.AsQueryable();
                //  query = query.Include(a=>a.Branch).Include(a=>a.PermissionType).Where(cond);

                if (HasIsDeleted())
                    return await query.Include(a => a.Parent)

                    .Where("isdeleted == false  ").Where(cond).ToListAsync();
                else
                    return await query.Include(a => a.Parent).Where(cond)

                    .ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return null;
        }


  

        public override async Task<Tuple<ICollection<AAccount>, int>> GetAllPagingAsync(PagingInputDto pagingInputDto)
        {
            IQueryable<AAccount> query = GetQueryableForGetAllPaging();

            if (pagingInputDto.HiddenFilter != null)
            {
                query = query.Where(pagingInputDto.HiddenFilter);
            }

            if (pagingInputDto.Filter != null)
            {
                var props = typeof(AAccount).GetProperties().Where(prop => Attribute.IsDefined(prop, typeof(FilterAttribute)));
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
            return new Tuple<ICollection<AAccount>, int>(await page.Include(a => a.Parent)

                    .ToListAsync(), total);
            //.Include(a => a.PermissionType).Include(a => a.Branch)
        }


    


    }
}

using Core.DTOs;
using Core.Entities.Clients;
using Core.Entities.LookUps;


using Core.Repositories.LookUps;


using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Threading.Tasks;
using System.Linq.Dynamic.Core;
using Core.Other;


namespace Infrastructure.Repositories
{
    public class TreasuryRepository : BaseRepository<Treasury>, ITreasuryRepository
    {


        public TreasuryRepository(DBContext context) : base(context)
        {

        }

        public override async Task<List<Treasury>> GetAsync(string cond)
        {
            try
            {
                var query = DbSet.AsQueryable();
                //  query = query.Include(a=>a.Branch).Include(a=>a.PermissionType).Where(cond);

                if (HasIsDeleted())
                    return await query
                   
                    .Include(a => a.TreasuryDealers).Where("isdeleted == false  ").Where(cond).ToListAsync();
                else
                    return await query.Where(cond)
                    .Include(a => a.TreasuryDealers).ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return null;
        }


        public override async Task<List<Treasury>> GetAllAsync()
        {//.Include(a => a.PermissionType).Include(a => a.Branch)

            IQueryable<Treasury> query = GetQueryableForGetAllPaging();

            if (HasIsDeleted())
                return await query.Include(a => a.TreasuryDealers)
                    .Where("isdeleted == false  ").ToListAsync();
            else
                return await query.Include(a => a.TreasuryDealers).ToListAsync();
        }

        public override async Task<Tuple<ICollection<Treasury>, int>> GetAllPagingAsync(PagingInputDto pagingInputDto)
        {
            IQueryable<Treasury> query = GetQueryableForGetAllPaging();

            if (pagingInputDto.HiddenFilter != null)
            {
                query = query.Where(pagingInputDto.HiddenFilter);
            }

            if (pagingInputDto.Filter != null)
            {
                var props = typeof(Treasury).GetProperties().Where(prop => Attribute.IsDefined(prop, typeof(FilterAttribute)));
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
            return new Tuple<ICollection<Treasury>, int>(await page.Include(a => a.TreasuryDealers).ToListAsync(), total);
        }


        public override async Task<Treasury> GetByIdAsync(long id)
        {

            int newid = int.Parse(id.ToString());
            return await _context.Set<Treasury>()
                    .Include(a => a.TreasuryDealers)
                     .FirstOrDefaultAsync(e => e.TreasuryId == newid);

        }




    }
}

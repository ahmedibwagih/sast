using Core.DTOs;
using Core.Entities.LookUps;


using Core.Repositories.LookUps;


using Infrastructure.Data;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System;
using System.Linq.Dynamic.Core;
using Microsoft.EntityFrameworkCore;
using Core.Other;

namespace Infrastructure.Repositories
{
    public class ExIdsourceRepository : BaseRepository<ExIdsource>, Core.Repositories.LookUps.IIdsourceRepository
    {


        public ExIdsourceRepository(DBContext context) : base(context)
        {

        }


        public override async Task<Tuple<ICollection<ExIdsource>, int>> GetAllPagingAsync(PagingInputDto pagingInputDto)
        {
            IQueryable<ExIdsource> query = GetQueryableForGetAllPaging();

            if (pagingInputDto.HiddenFilter != null)
            {
                query = query.Where(pagingInputDto.HiddenFilter);
            }

            if (pagingInputDto.Filter != null)
            {
                pagingInputDto.Filter = pagingInputDto.Filter.Trim();
                var props = typeof(ExIdsource).GetProperties().Where(prop => Attribute.IsDefined(prop, typeof(FilterAttribute)));
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

            var total = await query.CountAsync();

            return new Tuple<ICollection<ExIdsource>, int>(await page.Include(a=>a.Country).ToListAsync(), total);
        }


        public override async Task<ExIdsource> GetByIdAsync(long id)
        {

                int newid = int.Parse(id.ToString());
                return await _context.Set<ExIdsource>()
                         .Include(e => e.Country) 
                         .FirstOrDefaultAsync(e => e.IdsourceId == newid);
      
        }
    }
}

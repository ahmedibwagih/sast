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
using Core.Repositories.LookUps;
namespace Infrastructure.Repositories
{
    public class ExBranchRepository : BaseRepository<ExBranch>, IExBranchRepository
    {


        public ExBranchRepository(DBContext context) : base(context)
        {

        }


        public override async Task<Tuple<ICollection<ExBranch>, int>> GetAllPagingAsync(PagingInputDto pagingInputDto)
        {
            IQueryable<ExBranch> query = GetQueryableForGetAllPaging();

            if (pagingInputDto.HiddenFilter != null)
            {
                query = query.Where(pagingInputDto.HiddenFilter);
            }

            if (pagingInputDto.Filter != null)
            {
                pagingInputDto.Filter = pagingInputDto.Filter.Trim();
                var props = typeof(ExBranch).GetProperties().Where(prop => Attribute.IsDefined(prop, typeof(FilterAttribute)));
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

            return new Tuple<ICollection<ExBranch>, int>(await page.ToListAsync(), total);
        }

        public override IQueryable<ExBranch> GetQueryableForGetAllPaging()
        {
            return DbSet.AsQueryable();
        }

        public override async Task<List<ExBranch>> GetAllAsync()
        {
            try
            {
                IQueryable<ExBranch> query = GetQueryableForGetAllPaging();

                if (HasIsDeleted())
                    return await query.Where("isdeleted == false ").ToListAsync();
                else
                    return await query.ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return null;
        }

        public override async Task<List<ExBranch>> GetAllAsync_withDeleted()
        {
            try
            {
                IQueryable<ExBranch> query = GetQueryableForGetAllPaging();


                return await query.ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return null;
        }

        public override async Task<List<ExBranch>> GetAsync(string cond)
        {
            try
            {
                var query = DbSet.AsQueryable();
                query = query.Where(cond);
                if (HasIsDeleted())
                    return await query.Where("isdeleted == false  ").ToListAsync();
                else
                    return await query.ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return null;
        }

        public override async Task<ExBranch> GetByIdAsync(long id)
        {
            try
            {
                return await _context.Set<ExBranch>().FindAsync(id);
            }
            catch (Exception ex)
            {
                int newid = int.Parse(id.ToString());
                return await _context.Set<ExBranch>().FindAsync(newid);
            }
        }

        public override async Task<ExBranch> GetByIdLightAsync(long id)
        {
            try
            {
                return await _context.Set<ExBranch>().FindAsync(id);
            }
            catch (Exception ex)
            {
                int newid = int.Parse(id.ToString());
                return await _context.Set<ExBranch>().FindAsync(newid);
            }
        }



    }
}

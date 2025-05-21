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

namespace Infrastructure.Repositories
{
    public class SecUserRepository : BaseRepository<SecUser>, ISecUserRepository
    {


        public SecUserRepository(DBContext context) : base(context)
        {

        }


        public override async Task<Tuple<ICollection<SecUser>, int>> GetAllPagingAsync(PagingInputDto pagingInputDto)
        {
            IQueryable<SecUser> query = GetQueryableForGetAllPaging();

            if (pagingInputDto.HiddenFilter != null)
            {
                query = query.Where(pagingInputDto.HiddenFilter);
            }

            //if (pagingInputDto.Filter != null)
            //{
            //    pagingInputDto.Filter = pagingInputDto.Filter.Trim();
            //    var props = typeof(T).GetProperties().Where(prop => Attribute.IsDefined(prop, typeof(FilterAttribute)));
            //    var condition = "";
            //    foreach (var p in props)
            //    {
            //        condition = (condition == "" ? condition : condition + " || ") + p.Name + ".ToString().Contains(@0)";
            //    }

            //    query = query.Where(condition, pagingInputDto.Filter);
            //}
            if (HasIsDeleted())
                query = query.Where("isdeleted == false  ");



            var order = query;
            if (pagingInputDto.OrderByField != null)
                order = query.OrderBy(pagingInputDto.OrderByField + " " + pagingInputDto.OrderType);
            var page = order.Skip(pagingInputDto.PageNumber * pagingInputDto.PageSize - pagingInputDto.PageSize).Take(pagingInputDto.PageSize);
            var total = await query.CountAsync();
            return new Tuple<ICollection<SecUser>, int>(await page.Include(a => a.PermissionType).Include(a => a.Branch).ToListAsync(), total);


        }



        public override async Task<List<SecUser>> GetAllAsync()
        {
            IQueryable<SecUser> query = GetQueryableForGetAllPaging();

            if (HasIsDeleted())
                return await query.Include(a => a.PermissionType).Include(a => a.Branch).Where("isdeleted == false  ").ToListAsync();
            else
                return await query.Include(a => a.PermissionType).Include(a => a.Branch).ToListAsync();
        }
        public override async Task<List<SecUser>> GetAsync(string cond)
        {
            try
            {
                var query = DbSet.AsQueryable();
                query = query.Include(a => a.Branch).Include(a => a.PermissionType).Where(cond);
                if (HasIsDeleted())
                    return await query.Include(a => a.Branch).Include(a => a.PermissionType).Where("isdeleted == false  ").ToListAsync();
                else
                    return await query.Include(a => a.Branch).Include(a => a.PermissionType).ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return null;
        }



        //public override async Task<List<SecUser>> GetAsync(string cond)
        //{
        //    try
        //    {
        //        var query = DbSet.AsQueryable();
        //        query = query.Include(a=>a.Branch).Include(a=>a.PermissionType).Where(cond);
        //        return await query.ToListAsync();
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    return null;
        //}


        //public override async Task<List<SecUser>> GetAllAsync()
        //{
        //    return await DbSet.Include(a => a.PermissionType).Include(a => a.Branch).ToListAsync();
        //}

        //public override async Task<Tuple<ICollection<SecUser>, int>> GetAllPagingAsync(PagingInputDto pagingInputDto)
        //{
        //    IQueryable<SecUser> query = GetQueryableForGetAllPaging();

        //    if (pagingInputDto.HiddenFilter != null)
        //    {
        //        query = query.Where(pagingInputDto.HiddenFilter);
        //    }

        //    //if (pagingInputDto.Filter != null)
        //    //{
        //    //    var props = typeof(SecUser).GetProperties().Where(prop => Attribute.IsDefined(prop, typeof(FilterAttribute)));
        //    //    var condition = "";
        //    //    foreach (var p in props)
        //    //    {
        //    //        condition = (condition == "" ? condition : condition + " || ") + p.Name + ".Contains(@0)";
        //    //    }

        //    //    query = query.Where(condition, pagingInputDto.Filter);
        //    //}
        //    var order = query;
        //    if (pagingInputDto.OrderByField != null)
        //        order = query.OrderBy(pagingInputDto.OrderByField + " " + pagingInputDto.OrderType);

        //    var page = order.Skip(pagingInputDto.PageNumber * pagingInputDto.PageSize - pagingInputDto.PageSize).Take(pagingInputDto.PageSize);

        //    var total = await query.CountAsync();

        //    return new Tuple<ICollection<SecUser>, int>(await page.Include(a => a.PermissionType).Include(a => a.Branch).ToListAsync(), total);
        //}




        public override async Task<SecUser> GetByIdAsync(long id)
        {

            int newid = int.Parse(id.ToString());
            return await _context.Set<SecUser>()
                     .Include(a => a.PermissionType).Include(a => a.Branch)
                     .Include(a => a.UserSettings)
                     .FirstOrDefaultAsync(e => e.UserId == newid);

        }


    }
}

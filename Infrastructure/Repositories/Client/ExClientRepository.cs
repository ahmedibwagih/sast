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

namespace Infrastructure.Repositories
{
    public class ExClientRepository : BaseRepository<ExClient>, IExClientRepository
    {


        public ExClientRepository(DBContext context) : base(context)
        {

        }




        public override async Task<List<ExClient>> GetAsync(string cond)
        {
            try
            {
                var query = DbSet.AsQueryable();
                //  query = query.Include(a=>a.Branch).Include(a=>a.PermissionType).Where(cond);

                if (HasIsDeleted())
                    return await query.Include(a => a.ExClientsRepresentatives)
                    .Include(a => a.ExClientsAttachments).Include(a => a.ExClientsNote)
                    .Include(a => a.ExClientsMemberships).Where("isdeleted == false  ").Where(cond).ToListAsync();
                else
                    return await query.Where(cond).Include(a => a.ExClientsRepresentatives)
                    .Include(a => a.ExClientsAttachments)
                    .Include(a => a.ExClientsMemberships).ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return null;
        }


        public override async Task<List<ExClient>> GetAllAsync()
        {//.Include(a => a.PermissionType).Include(a => a.Branch)

            IQueryable<ExClient> query = GetQueryableForGetAllPaging();

            if (HasIsDeleted())
                return await query.Include(a => a.ExClientsRepresentatives).Include(a => a.ExClientsAttachments).Include(a => a.ExClientsMemberships).Include(a => a.ExClientsNote)
                    .Where("isdeleted == false  ").ToListAsync();
            else
                return await query.Include(a => a.ExClientsRepresentatives).Include(a => a.ExClientsAttachments).Include(a => a.ExClientsMemberships).ToListAsync();
        }

        public override async Task<Tuple<ICollection<ExClient>, int>> GetAllPagingAsync(PagingInputDto pagingInputDto)
        {
            IQueryable<ExClient> query = GetQueryableForGetAllPaging();

            if (pagingInputDto.HiddenFilter != null)
            {
                query = query.Where(pagingInputDto.HiddenFilter);
            }

            if (pagingInputDto.Filter != null)
            {
                var props = typeof(ExClient).GetProperties().Where(prop => Attribute.IsDefined(prop, typeof(FilterAttribute)));
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
            return new Tuple<ICollection<ExClient>, int>(await page.Include(a => a.ExClientsRepresentatives)
                    .Include(a => a.ExClientsAttachments).Include(a => a.ExClientsNote)
                    .Include(a => a.ExClientsMemberships).ToListAsync(), total);
            //.Include(a => a.PermissionType).Include(a => a.Branch)
        }


        public override async Task<ExClient> GetByIdAsync(long id)
        {

            int newid = int.Parse(id.ToString());
            return await _context.Set<ExClient>().Include(a => a.ExClientsRepresentatives)
                    .Include(a => a.ExClientsAttachments)
                    .Include(a => a.ExClientsMemberships).Include(a => a.ExClientsNote)
                     // .Include(a => a.PermissionType).Include(a => a.Branch)
                     .FirstOrDefaultAsync(e => e.ClientId == newid);

        }


    }
}

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

namespace Infrastructure.Repositories
{
    public class SecFormsFunctionRepository : BaseRepository<SecFormsFunction>, ISecFormsFunctionRepository
    {


        public SecFormsFunctionRepository(DBContext context) : base(context)
        {

        }




        //public override async Task<List<SecFormsFunction>> GetAsync(string cond)
        //{
        //    try
        //    {
        //        var query = DbSet.AsQueryable();
        //        query = query.Include(a=>a.Form).Include(a=>a.Function).Where(cond);
        //        return await query.ToListAsync();
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    return null;
        //}

        public override async Task<List<SecFormsFunction>> GetAsync(string cond)
        {
            try
            {
                var query = DbSet.AsQueryable();
                query = query.Include(a => a.Form).Include(a => a.Function).Where(cond);
                if (HasIsDeleted())
                    return await query.Include(a => a.Form).Include(a => a.Function).Where("isdeleted == false  ").ToListAsync();
                else
                    return await query.ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return null;
        }




    }
}

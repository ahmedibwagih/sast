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
using Core.Entities.TRN_Transfers;
using Core.Repositories.TRN_Transfers;

namespace Infrastructure.Repositories
{
    public class ExInternalTransferRepository : BaseRepository<ExInternalTransfer>, IExInternalTransferRepository
    {


        public ExInternalTransferRepository(DBContext context) : base(context)
        {

        }

        public async Task<int> GetNextTransferNo()
        {
            return (_context.Set<ExInternalTransfer>().Max(a => a.TransferNo)) + 1;
        }


        public override async Task<List<ExInternalTransfer>> GetAsync(string cond)
        {
            try
            {
                var query = DbSet.AsQueryable();
                //  query = query.Include(a=>a.Branch).Include(a=>a.PermissionType).Where(cond);

                if (HasIsDeleted())
                    return await query.Include(a => a.ExInternalTransfersDetails).Where(cond)

                    .Where("isdeleted == false  ").ToListAsync();
                else
                    return await query.Where(cond).Include(a => a.ExInternalTransfersDetails)

                    .ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return null;
        }


        //public override async Task<List<ExInternalTransfer>> GetAllAsync()
        //{//.Include(a => a.PermissionType).Include(a => a.Branch)

        //    IQueryable<ExInternalTransfer> query = GetQueryableForGetAllPaging();

        //    if (HasIsDeleted())
        //        return await query.Include(a => a.ExInternalTransfersDetails)
        //            .Where("isdeleted == false  ").ToListAsync();
        //    else
        //        return await query.Include(a => a.ExInternalTransfersDetails).ToListAsync();
        //}

        //public override async Task<Tuple<ICollection<ExInternalTransfer>, int>> GetAllPagingAsync(PagingInputDto pagingInputDto)
        //{
        //    IQueryable<ExInternalTransfer> query = GetQueryableForGetAllPaging();

        //    if (pagingInputDto.HiddenFilter != null)
        //    {
        //        query = query.Where(pagingInputDto.HiddenFilter);
        //    }

        //    if (pagingInputDto.Filter != null)
        //    {
        //        var props = typeof(ExInternalTransfer).GetProperties().Where(prop => Attribute.IsDefined(prop, typeof(FilterAttribute)));
        //        var condition = "";
        //        foreach (var p in props)
        //        {
        //            condition = (condition == "" ? condition : condition + " || ") + p.Name + ".ToString().Contains(@0)";
        //        }

        //        query = query.Where(condition, pagingInputDto.Filter);
        //    }
        //    if (HasIsDeleted())
        //        query = query.Where("isdeleted == false  ");

        //    var order = query;
        //    if (pagingInputDto.OrderByField != null)
        //        order = query.OrderBy(pagingInputDto.OrderByField + " " + pagingInputDto.OrderType);

        //    var page = order.Skip(pagingInputDto.PageNumber * pagingInputDto.PageSize - pagingInputDto.PageSize).Take(pagingInputDto.PageSize);
        //    var total = 0;
        //    try
        //    {
        //        total = await query.CountAsync();
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    Context.Database.SetCommandTimeout(0);


        //    //var re = new Tuple<ICollection<ExInternalTransfer>, int>(await page.Include(a => a.ExInternalTransfersDetails)

        //    //        .ToListAsync(), total);
        //    var re = new Tuple<ICollection<ExInternalTransfer>, int>(await page.ToListAsync(), total);

        //    return re;
        //    //.Include(a => a.PermissionType).Include(a => a.Branch)
        //}


        public override async Task<ExInternalTransfer> GetByIdAsync(long id)
        {

            int newid = int.Parse(id.ToString());
            return await _context.Set<ExInternalTransfer>().Include(a => a.ExInternalTransfersDetails)


                     // .Include(a => a.PermissionType).Include(a => a.Branch)
                     .FirstOrDefaultAsync(e => e.TransferId == newid);

        }



    }
}

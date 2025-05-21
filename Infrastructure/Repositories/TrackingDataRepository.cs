using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

using System.Threading.Tasks;
using Core.DTOs;
using Core.Repositories.Base;
using System.Data;
using Infrastructure.Data;
using System.Linq.Dynamic.Core;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
using Core.Other;
using Core.Entities.Clients;
using System.Reflection;
using Core.Entities.TRN_WholeInvoices;
using Core.Repositories.Workflow;


namespace Infrastructure.Repositories
{
    public class TrackingDataRepository : BaseRepository<TrackingData>, ITrackingDataRepository
    {


        public TrackingDataRepository(DBContext context) : base(context)
        {

        }

        public  async Task<List<TrackingData>> GetTracking(string tableName,DateTime from ,DateTime to,int actionType)
        {
            try
            {
                IQueryable<TrackingData> query = GetQueryableForGetAllPaging();

                    return await query.Where(a=>a.TableName== tableName && a.date >= from && a.date <= to && a.ActionType == actionType).ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return null;
        }


    }
}

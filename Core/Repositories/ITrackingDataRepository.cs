using Core.Entities.LookUps;
using Core.Entities.Taswya;
using Core.Entities.TRN_Transfers;
using Core.Entities.TRN_WholeInvoices;
using Core.Entities.Workflow;
using Core.Repositories.Base;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;


namespace Core.Repositories.Workflow
{
    public interface ITrackingDataRepository : IRepository<TrackingData>
    {
        Task<List<TrackingData>> GetTracking(string tableName, DateTime from, DateTime to, int actionType);
    }
}

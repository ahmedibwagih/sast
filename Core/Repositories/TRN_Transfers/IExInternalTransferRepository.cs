using Core.Entities.LookUps;
using Core.Entities.TRN_Transfers;
using Core.Repositories.Base;
using System.Threading.Tasks;


namespace Core.Repositories.TRN_Transfers
{
    public interface IExInternalTransferRepository : IRepository<ExInternalTransfer>
    {
        Task<int> GetNextTransferNo();
    }
}

using Core.Entities.LookUps;
using Core.Entities.Taswya;
using Core.Entities.TreasuryTransfere;
using Core.Entities.TRN_Transfers;
using Core.Repositories.Base;
using System.Threading.Tasks;


namespace Core.Repositories.TRN_Transfers
{
    public interface IExTreasuryTransfereRepository : IRepository<ExTreasuryTransfere>
    {
        Task<int> GetNextTransferNo(int brn);
    }
}

using Core.Entities.Account;
using Core.Entities.LookUps;
using Core.Entities.Taswya;
using Core.Entities.TRN_Transfers;
using Core.Repositories.Base;
using System.Threading.Tasks;


namespace Core.Repositories.Account
{
    public interface IACashFlowRepository : IRepository<ACashFlow>
    {
        Task<int> GetNextTrnNo(int brn);
    }
}

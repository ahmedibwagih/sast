using Core.Entities.Account;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Taswya;
using Core.Entities.TRN_Transfers;
using Core.Repositories.Base;
using System.Threading.Tasks;


namespace Core.Repositories.Account
{
    public interface IAJvRepository : IRepository<AJv>
    {

        Task<int> GetNextTrnNo(int brn);
    }
}

using Core.Entities.LookUps;
using Core.Entities.Taswya;
using Core.Entities.TRN_Transfers;
using Core.Repositories.Base;
using System.Threading.Tasks;


namespace Core.Repositories.TRN_Transfers
{
    public interface IExTaswyaRepository : IRepository<ExTaswya>
    {
        Task<int> GetNextTransferNo(int brn);
    }
}

using Core.Entities.LookUps;
using Core.Entities.TRN_WholeInvoices;
using Core.Repositories.Base;
using System.Threading.Tasks;


namespace Core.Repositories.TRN_Transfers
{
    public interface IExWholeInvoiceRepository : IRepository<ExWholeInvoice>
    {
        Task<int> GetNextInvoiceNo(int brn);
    }
}

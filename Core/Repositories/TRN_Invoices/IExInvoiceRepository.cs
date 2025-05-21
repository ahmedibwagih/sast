using Core.Entities.LookUps;
using Core.Entities.TRN_Invoices;
using Core.Repositories.Base;
using System.Threading.Tasks;


namespace Core.Repositories.TRN_Invoices
{
    public interface IExInvoiceRepository : IRepository<ExInvoice>
    {
        Task<int> GetNextInvoiceNo(int brn);
    }
}

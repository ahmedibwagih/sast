using Core.Entities.LookUps;
using Core.Entities.TRN_Invoices;
using Core.Repositories.LookUps;
using Core.Repositories.TRN_Invoices;
using Infrastructure.Data;

namespace Infrastructure.Repositories
{
    public class ExInvoicesDetailRepository : BaseRepository<ExInvoicesDetail>, IExInvoicesDetailRepository
    {


        public ExInvoicesDetailRepository(DBContext context) : base(context)
        {

        }

    }
}

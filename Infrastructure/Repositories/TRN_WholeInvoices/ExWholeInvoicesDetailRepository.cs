using Core.Entities.LookUps;
using Core.Entities.TRN_WholeInvoices;
using Core.Repositories.LookUps;
using Core.Repositories.TRN_Transfers;
using Infrastructure.Data;

namespace Infrastructure.Repositories
{
    public class ExWholeInvoicesDetailRepository : BaseRepository<ExWholeInvoicesDetail>, IExWholeInvoicesDetailRepository
    {


        public ExWholeInvoicesDetailRepository(DBContext context) : base(context)
        {

        }

    }
}

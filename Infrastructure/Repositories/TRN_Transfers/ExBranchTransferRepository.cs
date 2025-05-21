using Core.Entities.LookUps;
using Core.Entities.TRN_Transfers;
using Core.Repositories.LookUps;
using Core.Repositories.TRN_Transfers;
using Infrastructure.Data;

namespace Infrastructure.Repositories
{
    public class ExBranchTransferRepository : BaseRepository<ExBranchTransfer>, IExBranchTransferRepository
    {


        public ExBranchTransferRepository(DBContext context) : base(context)
        {

        }

    }
}

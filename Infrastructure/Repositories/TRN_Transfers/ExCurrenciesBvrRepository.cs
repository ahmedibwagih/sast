using Core.Entities.LookUps;
using Core.Entities.TRN_Transfers;
using Core.Repositories.LookUps;
using Core.Repositories.TRN_Transfers;
using Infrastructure.Data;

namespace Infrastructure.Repositories
{
    public class ExCurrenciesBvrRepository : BaseRepository<ExCurrenciesBvr>, IExCurrenciesBvrRepository
    {


        public ExCurrenciesBvrRepository(DBContext context) : base(context)
        {

        }

    }
}

using Core.Entities.LookUps;


using Core.Repositories.LookUps;


using Infrastructure.Data;

namespace Infrastructure.Repositories
{
    public class TreasuryDealersRepository : BaseRepository<TreasuryDealers>, ITreasuryDealersRepository
    {


        public TreasuryDealersRepository(DBContext context) : base(context)
        {

        }

    }
}

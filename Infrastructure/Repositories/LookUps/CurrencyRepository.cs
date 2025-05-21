using Core.Entities.LookUps;


using Core.Repositories.LookUps;


using Infrastructure.Data;

namespace Infrastructure.Repositories
{
    public class CurrencyRepository : BaseRepository<Currency>, ICurrencyRepository
    {


        public CurrencyRepository(DBContext context) : base(context)
        {

        }

    }
}

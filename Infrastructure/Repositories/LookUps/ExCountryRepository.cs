using Core.Entities.LookUps;


using Core.Repositories.LookUps;


using Infrastructure.Data;

namespace Infrastructure.Repositories
{
    public class ExCountryRepository : BaseRepository<ExCountry>, IExCountryRepository
    {


        public ExCountryRepository(DBContext context) : base(context)
        {

        }

    }
}

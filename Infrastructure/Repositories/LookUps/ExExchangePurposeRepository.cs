using Core.Entities.LookUps;


using Core.Repositories.LookUps;


using Infrastructure.Data;

namespace Infrastructure.Repositories
{
    public class ExExchangePurposeRepository : BaseRepository<ExExchangePurpose>, Core.Repositories.LookUps.IExchangePurposeRepository
    {


        public ExExchangePurposeRepository(DBContext context) : base(context)
        {

        }

    }
}

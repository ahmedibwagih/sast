using Core.Entities.LookUps;


using Core.Repositories.LookUps;


using Infrastructure.Data;

namespace Infrastructure.Repositories
{
    public class ExBankRepository : BaseRepository<ExBank>, IExBankRepository
    {


        public ExBankRepository(DBContext context) : base(context)
        {

        }

    }
}

using Core.Entities.LookUps;


using Core.Repositories.LookUps;


using Infrastructure.Data;

namespace Infrastructure.Repositories
{
    public class ExIncomeSourceRepository : BaseRepository<ExIncomeSource>, Core.Repositories.LookUps.IExIncomeSourceRepository
    {


        public ExIncomeSourceRepository(DBContext context) : base(context)
        {

        }

    }
}

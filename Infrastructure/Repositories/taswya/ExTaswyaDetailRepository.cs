using Core.Entities.LookUps;
using Core.Entities.Taswya;
using Core.Entities.TRN_Transfers;
using Core.Repositories.LookUps;
using Core.Repositories.TRN_Transfers;
using Infrastructure.Data;

namespace Infrastructure.Repositories
{
    public class ExTaswyaDetailRepository : BaseRepository<ExTaswyaDetail>, IExTaswyaDetailRepository
    {


        public ExTaswyaDetailRepository(DBContext context) : base(context)
        {

        }

    }
}

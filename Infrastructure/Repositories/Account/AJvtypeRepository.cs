using Core.Entities.Account;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Repositories.Account;
using Core.Repositories.LookUps;


using Infrastructure.Data;

namespace Infrastructure.Repositories
{
    public class AJvtypeRepository : BaseRepository<AJvtype>, IAJvtypeRepository
    {


        public AJvtypeRepository(DBContext context) : base(context)
        {

        }

    }
}

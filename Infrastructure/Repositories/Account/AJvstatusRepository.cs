using Core.Entities.Account;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Repositories.Account;
using Core.Repositories.LookUps;


using Infrastructure.Data;

namespace Infrastructure.Repositories
{
    public class AJvstatusRepository : BaseRepository<AJvstatus>, IAJvstatusRepository
    {


        public AJvstatusRepository(DBContext context) : base(context)
        {

        }

    }
}

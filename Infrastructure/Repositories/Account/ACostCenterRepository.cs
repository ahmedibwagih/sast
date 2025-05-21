using Core.Entities.Account;
using Core.Entities.LookUps;
using Core.Repositories.Account;
using Core.Repositories.LookUps;


using Infrastructure.Data;

namespace Infrastructure.Repositories
{
    public class ACostCenterRepository : BaseRepository<ACostCenter>, IACostCenterRepository
    {


        public ACostCenterRepository(DBContext context) : base(context)
        {

        }

    }
}

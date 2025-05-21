using Core.Entities.LookUps;


using Core.Repositories.LookUps;


using Infrastructure.Data;

namespace Infrastructure.Repositories
{
    public class ClientActivitiesRepository : BaseRepository<ClientActivities>, IClientActivitiesRepository
    {


        public ClientActivitiesRepository(DBContext context) : base(context)
        {

        }

    }
}

using Core.Entities.LookUps;


using Core.Repositories.LookUps;


using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace Infrastructure.Repositories
{
    public class ExClientJobRepository : BaseRepository<ExClientJob>, IExClientJobRepository
    {

        DBContext context;
        public ExClientJobRepository(DBContext context) : base(context)
        {
            this.context = context;
        }

        //public override Task<ExClientJob> AddAsync(ExClientJob entity)
        //{
             
        //    var x = base.AddAsync(entity);
        //   // context.Database.ExecuteSqlRawAsync("EXEC fill_Privilage");
        //    return x;
        //}
    }
}

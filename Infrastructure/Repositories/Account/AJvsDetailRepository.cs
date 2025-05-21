using Core.Entities.Account;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Repositories.Account;
using Core.Repositories.LookUps;


using Infrastructure.Data;
using System.Threading.Tasks;
using System;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class AJvsDetailRepository : BaseRepository<AJvsDetail>, IAJvsDetailRepository
    {


        public AJvsDetailRepository(DBContext context) : base(context)
        {

        }

       

    }
}

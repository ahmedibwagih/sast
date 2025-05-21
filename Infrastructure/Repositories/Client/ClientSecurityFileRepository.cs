using Core.Entities.LookUps;
using Core.Entities.Sec;
using Core.Repositories.LookUps;


using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System;
using System.Threading.Tasks;
using System.Linq;
using System.Linq.Dynamic.Core;
using Core.DTOs;
using Core.Other;
using Core.Entities.Clients;
using Core.Repositories.Client;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
using System.Diagnostics.Eventing.Reader;

namespace Infrastructure.Repositories
{
    public class ClientSecurityFileRepository : BaseRepository<ClientSecurityFile>, IClientSecurityFileRepository
    {


        public ClientSecurityFileRepository(DBContext context) : base(context)
        {

        }


    }
}

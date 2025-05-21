using Core.DTOs;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Other;

using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.Clients
{
    public  class ClientSecDto 
    {
        //public long Id { get; set; }
        public List<ClientSecItem>  SecurityResult { get; set; }
     

    }

    public  class ClientSecItem 
    {
        public string NatId { get; set; }
        public string Name { get; set; }
        public string Percenage { get; set; }


    }
}

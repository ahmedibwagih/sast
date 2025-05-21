using Application.Core.DTOs.LookUps;
using Core.DTOs;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Other;

using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.Clients
{
    public partial class ClientOrSuppliersDto3 : EntityDto
    {

   

            public string clientCode { get; set; }
            public string clientNameAr { get; set; }
            public string clientNameEn { get; set; }
            public int clientTypeId { get; set; }
            public string countryId { get; set; }
            public int birthCityId { get; set; }
            public int birthCountryId { get; set; }
            public int capital { get; set; }
            public double currencyExRate { get; set; }
            public string currencyId { get; set; }
            public int idtypeId { get; set; }
            public int income { get; set; }
            public int jobId { get; set; }
            public int incomeSourceId { get; set; }
            public int exchangePurposeId { get; set; }
            public bool isSuspended { get; set; }
           
            public string fax { get; set; }
            public string email { get; set; }
            public string wholesaleClientTyp { get; set; }
            public string accountNumber { get; set; }
            public int licenseNumber { get; set; }
            public string crnumber { get; set; }
            public string licenseExpirateDate { get; set; }
            public string crexpiredDate { get; set; }
            public int unifiedNumber { get; set; }
            public int creditlimit { get; set; }
        public int? ClientActivityID { get; set; }
    }
    }






using Application.Core.DTOs.LookUps;
using Core.DTOs;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Other;

using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.Clients
{
    public partial class ClientOrSuppliersDto2 : EntityDto
    {
      
        public string clientCode { get; set; }
        public string clientNameAr { get; set; }
        public string clientNameEn { get; set; }
        public string clientTypeId { get; set; }
        public string countryId { get; set; }
        public string branchID { get; set; }
        public string birthCityId { get; set; }
        public string birthCountryId { get; set; }
        public int capital { get; set; }
        public int currencyExRate { get; set; }
        public int currencyId { get; set; }
        public int clientId { get; set; }
        public int idsourceId { get; set; }
        public string idtypeId { get; set; }
        public int income { get; set; }
        public int suspiciousCount { get; set; }
        public int suspiciousCountLocal { get; set; }
        public string jobId { get; set; }
        public string incomeSourceId { get; set; }
        public string exchangePurposeId { get; set; }
        public bool isSuspended { get; set; }
        public string mobile { get; set; }
        public string birthdate { get; set; }
        public string address { get; set; }
        public string idnumber { get; set; }
        public string jobAuthority { get; set; }
        public string jobTitle { get; set; }
        public string sector { get; set; }
        public string idexpiryDate { get; set; }
        public int? ClientActivityID { get; set; }

        public virtual ICollection<ExClientsAttachmentDto> ExClientsAttachments { get; set; } = new List<ExClientsAttachmentDto>();

        public virtual ICollection<ExClientsMembershipDto> ExClientsMemberships { get; set; } = new List<ExClientsMembershipDto>();

        public virtual ICollection<ExClientsRepresentativeDto> ExClientsRepresentatives { get; set; } = new List<ExClientsRepresentativeDto>();
        public virtual ICollection<ExClientsNoteDto2> ExClientsNote { get; set; } = new List<ExClientsNoteDto2>();


    }




}

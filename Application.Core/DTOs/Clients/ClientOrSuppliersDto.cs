using Application.Core.DTOs.LookUps;
using Core.DTOs;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Other;

using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.Clients
{
    public partial class ClientOrSuppliersDto : EntityDto
    {
        public int ClientId { get; set; }
        public Boolean IsDeleted { get; set; }

        //added
        public int? AccountId { get; set; }
        public string? Sector { get; set; }
        public int? BranchID { get; set; }
        public int wholesaleClientTyp { get; set; }
        public string ClientCode { get; set; }
        public string Fax { get; set; }
        public string Email { get; set; }
        public string AccountNumber { get; set; }
        public DateTime? LicenseExpirateDate { get; set; }
        public string Creditlimit { get; set; }
        public string LicenseNumber { get; set; }
        public int CurrencyId { get; set; }
        public decimal CurrencyExRate { get; set; }
        /// //   / /// // /// // /// // /// // /// //

        public int? ClientActivityID { get; set; }
        public string ClientNameEn { get; set; }

        public string ClientNameAr { get; set; }

        public int ClientTypeId { get; set; }

        public int? CountryId { get; set; }

        public int? IdtypeId { get; set; }

        public string Idnumber { get; set; }

        public string Idsource { get; set; }

        public string IdexpiryDate { get; set; }

        public string Mobile { get; set; }

        public string Sponsor { get; set; }

        public int SuspiciousCount { get; set; }

        public bool SuspiciousUpdated { get; set; }

        public string JobTitle { get; set; }

        public decimal? Income { get; set; }

        public string IncomeSource { get; set; }

        public string PurposeOfExchange { get; set; }

        public decimal? Capital { get; set; }

        public string Specialty { get; set; }

      //  public string CrexpiryDate { get; set; }

        public string Address { get; set; }

        public int? JobId { get; set; }

        public int SuspiciousCountLocal { get; set; }

        public bool HasFullData { get; set; }

        public DateTime? Birthdate { get; set; }

        public DateTime? IdexpiredDate { get; set; }

        public DateTime? CrexpiredDate { get; set; }

        public string JobAuthority { get; set; }

        public string OthrePhone { get; set; }

        public string OtherMobile { get; set; }

        public string Crnumber { get; set; }

        public string UnifiedNumber { get; set; }

        public DateTime? CreationDate { get; set; }

        public int? IdsourceId { get; set; }

        public int? IncomeSourceId { get; set; }

        public int? ExchangePurposeId { get; set; }

        public bool IsSuspended { get; set; }

        public int? BirthCountryId { get; set; }

        public int? BirthCityId { get; set; }



        public virtual ICollection<ExClientsAttachmentDto> ExClientsAttachments { get; set; } = new List<ExClientsAttachmentDto>();

        public virtual ICollection<ExClientsMembershipDto> ExClientsMemberships { get; set; } = new List<ExClientsMembershipDto>();

        public virtual ICollection<ExClientsRepresentativeDto> ExClientsRepresentatives { get; set; } = new List<ExClientsRepresentativeDto>();
        public virtual ICollection<ExClientsNoteDto> ExClientsNote { get; set; } = new List<ExClientsNoteDto>();


    }
}

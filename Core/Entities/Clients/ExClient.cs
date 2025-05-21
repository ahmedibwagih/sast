using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Core.Entities.LookUps;
using Core.Entities.Sec;
using Core.Other;
using Core.Entities.TRN_Invoices;

namespace Core.Entities.Clients;

public partial class ExClient
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Filter]
    public int ClientId { get; set; }

    ////added
    //public int wholesaleClientTyp { get; set; }
    //[Filter]
    //public string Fax { get; set; }
    //[Filter]
    //public string Email { get; set; }
    //[Filter]
    //public string AccountNumber { get; set; }
    //[Filter]
    //public string LicenseExpirateDate { get; set; }
    //[Filter]
    //public string Creditlimit { get; set; }
    //[Filter]
    //public string LicenseNumber { get; set; }
    //public int CurrencyId { get; set; }
    //public decimal CurrencyExRate { get; set; }

    ////////////

    //public int? AccountId { get; set; }
    public Boolean IsDeleted { get; set; }
    [Filter]
    public string ClientCode { get; set; }
    [Filter]
    public string ClientNameEn { get; set; }
    [Filter]
    public string ClientNameAr { get; set; }

    public int ClientTypeId { get; set; }

    public string? Sector { get; set; }
    public int? BranchID { get; set; }
    [ForeignKey("BranchID")]
    public ExBranch ExBranch { get; set; }


    
    public int? ClientSectorId { get; set; }
    [ForeignKey("ClientSectorId")]
    public ExClientSectors ExClientSectors { get; set; }
    public int? CountryId { get; set; }

    public int? IdtypeId { get; set; }

    public string Idnumber { get; set; }

    public string Idsource { get; set; }

    public string IdexpiryDate { get; set; }

    public string Mobile { get; set; }

    public string Sponsor { get; set; }

    public int SuspiciousCount { get; set; }

    public bool SuspiciousUpdated { get; set; }
    [Filter]
    public string JobTitle { get; set; }

    public decimal? Income { get; set; }

    public string IncomeSource { get; set; }

    public string PurposeOfExchange { get; set; }

    public decimal? Capital { get; set; }

    public string Specialty { get; set; }

   // public string CrexpiryDate { get; set; }
    [Filter]
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

    public int? ClientActivityID { get; set; }

    public virtual ExIdsource BirthCity { get; set; }


    public virtual ExCountry BirthCountry { get; set; }


    public virtual ExCountry Country { get; set; }


    public virtual ExExchangePurpose ExchangePurpose { get; set; }

    public virtual ExIdsource IdsourceNavigation { get; set; }

    public virtual ExIncomeSource IncomeSourceNavigation { get; set; }

    public virtual ICollection<ExClientsAttachment> ExClientsAttachments { get; set; } = new List<ExClientsAttachment>();

    public virtual ICollection<ExClientsMembership> ExClientsMemberships { get; set; } = new List<ExClientsMembership>();

    public virtual ICollection<ExClientsRepresentative> ExClientsRepresentatives { get; set; } = new List<ExClientsRepresentative>();

    public virtual ICollection<ExInvoice> ExInvoices { get; set; } = new List<ExInvoice>();

    public virtual ICollection<ExClientsNote> ExClientsNote { get; set; } = new List<ExClientsNote>();



}

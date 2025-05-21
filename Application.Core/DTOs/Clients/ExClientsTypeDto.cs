using Core.DTOs;
using Core.Entities.LookUps;
using Core.Other;

using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.Clients
{
    public partial class ExClientsTypeDto : EntityDto
    {
        public int ClientTypeId { get; set; }

        public string ClientTypeNameEn { get; set; }

        public string ClientTypeNameAr { get; set; }

        public int? MonetaryAgencyReportId { get; set; }
    }
}

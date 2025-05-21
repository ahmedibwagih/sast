using Application.Core.DTOs.LookUps;
using Core.DTOs;
using Core.Entities.LookUps;

using Core.Other;

using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.LookUps
{
    public class ExIdsourceDto : EntityDto
    {

        public int IdsourceId { get; set; }
        public Boolean IsDeleted { get; set; }

        public string IdsourceNameEn { get; set; }

        public string IdsourceNameAr { get; set; }

        public int CountryId { get; set; }

        public string CountryName { get; set; }
    }
}

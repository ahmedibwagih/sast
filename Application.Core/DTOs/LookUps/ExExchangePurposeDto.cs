using Core.DTOs;
using Core.Other;


namespace Application.Core.DTOs.LookUps
{
    public class ExExchangePurposeDto : EntityDto
    {
        public int ExchangePurposeId { get; set; }
        public Boolean IsDeleted { get; set; }

        public string ExchangePurposeNameEn { get; set; }

        public string ExchangePurposeNameAr { get; set; }
    }
}

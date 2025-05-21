using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.Sec;
using Core.Other;

using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Core.DTOs.LookUps
{
    public class CurrencyDto : EntityDto
    {
        public int CurrencyId { get; set; }
        public int BranchID { get; set; }
        public int TreasuryId { get; set; }

        public Boolean IsDeleted { get; set; }

        public int CurrencyCode { get; set; }

        public string CurrencyNameEn { get; set; }

        public string CurrencyNameAr { get; set; }

        public string Sign { get; set; }

        public decimal SalePrice { get; set; }

        public decimal BuyPrice { get; set; }

        public decimal ValuationPrice { get; set; }

        public bool IsActive { get; set; }

        public Boolean? IsDefault { get; set; }

        public decimal OpeningBalance { get; set; }

        public decimal OpeningPrice { get; set; }

        public bool ShowInPricesScreen { get; set; }
        public DateTime? OpenningBalanceDate { get; set; }
    }
}

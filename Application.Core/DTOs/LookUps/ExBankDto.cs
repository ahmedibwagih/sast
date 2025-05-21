using Core.DTOs;
using Core.Other;


namespace Application.Core.DTOs.LookUps
{
    public class ExBankDto : EntityDto
    {

        public int BankId { get; set; }
        public Boolean IsDeleted { get; set; }

        public string BankAccountNameEn { get; set; }

        public string BankAccountNameAr { get; set; }

        public int? AccountId { get; set; }
        public int RiskRate { get; set; }
        public int IsActve { get; set; } = 1;
    }
}

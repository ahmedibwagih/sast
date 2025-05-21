using Application.Core.DTOs;
using Application.Core.DTOs.Account;
using Application.Core.DTOs.Clients;
using Application.Core.DTOs.LookUps;

using Core.DTOs;
using Core.Entities.Account;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.others;

namespace Application.Core.Services.Account
{
    public interface IJvsService : IService<AJv, AJvDto, AJvDto, AJvDto, AJvDto>
    {
        Task<int> GetNextTrnNo(int brn);
        Task<List<AJvAccountSettingDto>> GetStaticAccount();
        Task<bool> UpdateStaticAccount(String AccountName, int accountId);
        Task<bool> UpdateSupplierAccount(int entityid, int accountId);
        Task<bool> UpdatebankAccount(int entityid, int accountId);
        Task<bool> UpdateTreasuryAccount(int entityid, int accountId);
        Task<int> GetDefaultBankAccountBRV(int bankId);
        Task<string> GetAccount_setting(string accountName);

        Task<int?> GetTreasury_Account(int treasuryId, int currencyId);
        Task<int?> GetDefaultTreasury_Account(int treasuryId);
        Task<int> GetNestedAccountsettingByCurency(int accountId, int currencyId);
        Task<Boolean> AddGeneratedAJV(int internalType, int entityNo, int jvtypeId, decimal Fromval1, decimal Fromval2, decimal Fromval3, decimal Toval1, decimal Toval2, decimal Toval3, int entityId, int branchId, int FromAccountId1, int FromAccountId2, int FromAccountId3, int ToAccountId1, int ToAccountId2, int ToAccountId3, int currencyId);
        Task<int?> GetSupplier_Account(int supplierId);
        Task<Boolean> DeleteAJV(int jvtypeId, int entityId);
        Task<Boolean> SaveBuildAJV(AJv created);
        Task<AJv> BuildAJV(AJv created, int jvtypeId, int branchId, int entityId, string Desc, int AccountId, decimal DebitVal, decimal CreditVal, int currencyId,decimal rate, int? userid);
        Task<int?> GetRiyal_currencyId(int treasuryId);
        Task<int> GetBank_AJVAccount(int bankId, int currencyId);
        Task<int> GetCurrencyId(long BankAccountId);
        Task<int> GetBankAJVAccountFrom_bankAccountId(int bankAccountId, int currencyId);
        Task<ExchangeResponse<List<UserActionsInputResult>>> GetUserActions(UserActionsInputDto input);
        Task<int> GetBankaccount_AJVAccount(int bankAccountId);
        Task<bool> UpdatebankAccount_forbankaccount(int entityid, int accountId);

    }
}

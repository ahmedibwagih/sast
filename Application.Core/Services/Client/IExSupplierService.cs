using Application.Core.DTOs.Clients;
using Application.Core.DTOs.LookUps;

using Core.DTOs;
using Core.Entities.Clients;
using Core.Entities.LookUps;

namespace Application.Core.Services.Client
{
    public interface IExSupplierService : IService<ExSupplier, ClientOrSuppliersDto, ClientOrSuppliersDto, ClientOrSuppliersDto, ClientOrSuppliersDto>
    {
        Task<List<ExSuppliersTypeDto>> GetSuppliersType();
        Task<ClientOrSuppliersDto> Create2(ClientOrSuppliersDto3 data);
    }
}

using Application.Core.DTOs.Clients;
using Application.Core.DTOs.LookUps;

using Core.DTOs;
using Core.Entities.Clients;
using Core.Entities.LookUps;

namespace Application.Core.Services.Client
{
    public interface IExClientService : IService<ExClient, ClientOrSuppliersDto, ClientOrSuppliersDto, ClientOrSuppliersDto, ClientOrSuppliersDto>
    {
        Task<List<ExClientsTypeDto>> GetExClientsType();
        Task<List<ExAttachmentTypeDto>> GetExAttachmentType();
        Task<List<ExSuppliersTypeDto>> GetSuppliersType();
        Task<ClientOrSuppliersDto> Create2(ClientOrSuppliersDto2 data);
        Task<ClientOrSuppliersDto> Update2(ClientOrSuppliersDto2 data);
        Task<ClientSecDto> CheckSecurityFile( string name);

    }
}

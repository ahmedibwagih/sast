using Application.Core.DTOs;
using Core.DTOs;

namespace Application.Core.Services
{
    //public interface IService<TEntity, TDto, TUpdateDto, TGetAllDto>
    //where TEntity : class
    //where TDto : class
    //where TUpdateDto : class
    //where TGetAllDto : class
    //{
    //    Task<PagingResultDto<TGetAllDto>> GetAllPaging(PagingInputDto pagingInputDto);
    //    Task<TDto> GetById(long id);
    //    Task Delete(long id);
    //    Task<TDto> Create(TDto input);
    //    Task<TDto> Update(TUpdateDto input);
    //    Task<IList<TGetAllDto>> GetAll();
    //}

    public interface IService<TEntity, TDto, TCreateDto, TUpdateDto, TGetAllDto>
        where TEntity : class
        where TDto : class
        where TCreateDto : class
        where TUpdateDto : class
        where TGetAllDto : class
    {
        Task DeleteTrn(long id);
        Task<PagingResultDto<TGetAllDto>> GetAllPaging(PagingInputDto pagingInputDto);
        Task<TDto> GetById(long id);
        Task Delete(long id);
        Task<TDto> Create(TCreateDto input);
        Task<TDto> Update(TUpdateDto input);
        Task<IList<TGetAllDto>> GetAll();
        Task<List<TDto>> GetByCond(string cond);
        Task<TDto> LightUpdate(TUpdateDto input);

        Task<TDto> LightCreate(TCreateDto input);
        Task<ExchangeResponse<List<TDto>>> LightCreateRange_ExResponse(List<TCreateDto> input);

        Task<ExchangeResponse<PagingResultDto<TGetAllDto>>> GetAllPaging_ExResponse(PagingInputDto pagingInputDto);
        Task<ExchangeResponse<IList<TGetAllDto>>> GetAll_ExResponse();
        Task<ExchangeResponse<List<TDto>>> GetByCond_ExResponse(string cond);
        Task<ExchangeResponse<TDto>> GetById_ExResponse(long id);
        Task<ExchangeResponse<TDto>> Create_ExResponse(TCreateDto input);
        Task<ExchangeResponse<TDto>> LightCreate_ExResponse(TCreateDto input);
        Task<ExchangeResponse<TDto>> Update_ExResponse(TUpdateDto input);
        Task<ExchangeResponse<TDto>> LightUpdate_ExResponse(TUpdateDto input);
    }
}

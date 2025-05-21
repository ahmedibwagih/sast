using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.TRN_Invoices;
using Application.Core.Services;
using Azure;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Other;
using Core.Repositories.Base;
using Core.UnitOfWork;
using static Google.Apis.Requests.BatchRequest;



namespace Application.Services
{
    public class BaseService<TEntity, TDto, TCreateDto, TUpdateDto, TGetAllDto> : IService<TEntity, TDto, TCreateDto, TUpdateDto, TGetAllDto>
        where TEntity : class
        where TDto : EntityDto
        where TCreateDto : EntityDto
        where TUpdateDto : EntityDto
        where TGetAllDto : class
    {
        protected readonly IUnitOfWork UnitOfWork;
        protected readonly IRepository<TEntity> Repository;

        public BaseService(IUnitOfWork unitOfWork)
        {
            this.UnitOfWork = unitOfWork;
            Repository = (IRepository<TEntity>)this.UnitOfWork.GetRepositoryByName(typeof(TEntity).Name);

        }

        public virtual async Task<PagingResultDto<TGetAllDto>> GetAllPaging(PagingInputDto pagingInputDto)
        {
            var result = await Repository.GetAllPagingAsync(pagingInputDto);

            var list = Mapper.MapperObject.Mapper.Map<IList<TGetAllDto>>(result.Item1);

            var response = new PagingResultDto<TGetAllDto>
            {
                Result = list,
                Total = result.Item2
            };

            return response;
        }

        public virtual async Task<IList<TGetAllDto>> GetAll()
        {
            var list = await Repository.GetAllAsync();
            var result = Mapper.MapperObject.Mapper.Map<IList<TGetAllDto>>(list);

            return result;
        }

        public virtual async Task<List<TDto>> GetByCond(string cond)
        {
            var entity = await Repository.GetAsync(cond);

            var response = Mapper.MapperObject.Mapper.Map<List<TDto>>(entity);

            return response;
        }


        public virtual async Task<TDto> GetById(long id)
        {
            var entity = await Repository.GetByIdAsync(id);

            var response = Mapper.MapperObject.Mapper.Map<TDto>(entity);

            return response;
        }

        public virtual async Task Delete(long id)
        {

      
            var entity = await Repository.GetByIdAsync(id);
            if ((await Repository.HasRelationalDependenciesAsync(entity)) == true)
                throw new Exception("لا يمكن الحذف");
            if (entity == null)
                throw new System.Exception(AppMessages.RecordNotExisted);

                Repository.Delete(entity);

            await UnitOfWork.CompleteAsync();
        }


        public virtual async Task DeleteTrn(long id)
        {
            UnitOfWork.BeginTran();
            var entity = await Repository.GetByIdAsync(id);
            if ((await Repository.HasRelationalDependenciesAsync(entity)) == true)
                throw new Exception("لا يمكن الحذف");
            if (entity == null)
                throw new System.Exception(AppMessages.RecordNotExisted);

            // var isSoftDelete = typeof(TEntity).GetInterfaces().Any(x => x == typeof(ISoftDelete));

            //if (isSoftDelete)
            //{
            //    ((ISoftDelete)entity).IsDeleted = true;
            //}
            //else
            //{
            await OnDeleting(entity);
            Repository.Delete(entity);
            //  }

            await UnitOfWork.CompleteAsync();
            UnitOfWork.CommitTran();
        }


        public virtual async Task<TDto> Create(TCreateDto input)
        {


            try
            {
                var entity = Mapper.MapperObject.Mapper.Map<TEntity>(input);
                if (entity is null)
                {
                    throw new System.Exception(AppMessages.InternalError);
                }

                await OnCreating(entity, input);

            
                UnitOfWork.BeginTran();

                var newEntity = await Repository.AddAsync(entity);

                await UnitOfWork.CompleteAsync();

                await OnCreated(newEntity, input);


              
                UnitOfWork.CommitTran();

                try
                {
                    if (typeof(TCreateDto) == typeof(TreasuryDto))
                    {
                        var entitydto = Mapper.MapperObject.Mapper.Map<TCreateDto>(newEntity);
                        UnitOfWork.Sp_Exchange_after_add_treasury(int.Parse(entitydto.Id.ToString()));
                    }
                    else
                    if (typeof(TCreateDto) == typeof(CurrencyBaseDto))
                    {
                        var entitydto = Mapper.MapperObject.Mapper.Map<TCreateDto>(newEntity);
                        UnitOfWork.Sp_Exchange_after_add_CurrencyBase(int.Parse(entitydto.Id.ToString()));
                    }
                }
                catch { }



                var response = Mapper.MapperObject.Mapper.Map<TDto>(newEntity);
                return response;
            }
            catch (System.Exception ex)
            {

                throw new System.Exception(AppMessages.InternalError + " :" + ex.Message.ToString());
            }
        
        }


        public virtual async Task<TDto> LightCreate(TCreateDto input)
        {


            try
            {
                var entity = Mapper.MapperObject.Mapper.Map<TEntity>(input);
                if (entity is null)
                {
                    throw new System.Exception(AppMessages.InternalError);
                }

                var newEntity = await Repository.AddAsync(entity);

                await UnitOfWork.CompleteAsync();

                var response = Mapper.MapperObject.Mapper.Map<TDto>(newEntity);
                return response;
            }
            catch (System.Exception ex)
            {

                throw new System.Exception(AppMessages.InternalError + " :" + ex.Message.ToString());
            }
            return null;
        }


        public virtual async Task<TDto> Update(TUpdateDto input)
        {

            try
            {
                var entity = await Repository.GetByIdLightAsync(input.Id);
     
                if (entity == null)
                    throw new System.Exception(AppMessages.RecordNotExisted);

                UnitOfWork.BeginTran();
                await TrackingUpdate(entity, input);
      


                input = await BeforeUpdate(entity, input);

                Mapper.MapperObject.Mapper.Map(input, entity, typeof(TDto), typeof(TEntity));

                await OnUpdating(entity, input);

                await UnitOfWork.CompleteAsync();

                await OnUpdated(entity, input);

                UnitOfWork.CommitTran();


                var result = await Repository.GetByIdAsync(input.Id);

                var response = Mapper.MapperObject.Mapper.Map<TDto>(result);

           
                return response;
            }
            catch (System.Exception ex) {
                UnitOfWork.RollbackTran();

                throw new System.Exception(AppMessages.InternalError + " :" +ex.Message.ToString());
            
            }
        }


        public virtual async Task<TDto> LightUpdate(TUpdateDto input)
        {

            try
            {
                var entity = await Repository.GetByIdLightAsync(input.Id);

                await TrackingUpdate(entity, input);
                if (entity == null)
                    throw new System.Exception(AppMessages.RecordNotExisted);

                Mapper.MapperObject.Mapper.Map(input, entity, typeof(TDto), typeof(TEntity));

                await UnitOfWork.CompleteAsync();


                var response = Mapper.MapperObject.Mapper.Map<TDto>(entity);

                return response;
            }
            catch (System.Exception ex)
            {

                throw new System.Exception(AppMessages.InternalError + " :" + ex.Message.ToString());

            }
        }






        /// <summary>
        /// //////////////////////
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="dto"></param>
        /// <returns></returns>
        /// 
        public virtual async Task<ExchangeResponse<PagingResultDto<TGetAllDto>>> GetAllPaging_ExResponse(PagingInputDto pagingInputDto)
        {
            try
            {
                var result = await Repository.GetAllPagingAsync(pagingInputDto);

            var list = Mapper.MapperObject.Mapper.Map<IList<TGetAllDto>>(result.Item1);

            var response = new PagingResultDto<TGetAllDto>
            {
                Result = list,
                Total = result.Item2
            };

            return new ExchangeResponse<PagingResultDto<TGetAllDto>> { Status = ResponseEnum.Ok, Result = response };
                // return response;
            }
            catch (System.Exception ex)
            {
                return new ExchangeResponse<PagingResultDto<TGetAllDto>> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء التعامل مع البيانات" };
            }
        }

        public virtual async Task<ExchangeResponse<IList<TGetAllDto>>> GetAll_ExResponse()
        {
            try
            {
                var list = await Repository.GetAllAsync();
            var result = Mapper.MapperObject.Mapper.Map<IList<TGetAllDto>>(list);

            return new ExchangeResponse<IList<TGetAllDto>> { Status = ResponseEnum.Ok, Result = result };
            }
            catch (System.Exception ex)
            {
                return new ExchangeResponse<IList<TGetAllDto>> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء التعامل مع البيانات" };
            }
        }

        public virtual async Task<ExchangeResponse<List<TDto>>> GetByCond_ExResponse(string cond)
        {
            try
            {
                var entity = await Repository.GetAsync(cond);

                var response = Mapper.MapperObject.Mapper.Map<List<TDto>>(entity);

                return new ExchangeResponse<List<TDto>> { Status = ResponseEnum.Ok, Result = response };
            }
            catch (System.Exception ex) {
                return new ExchangeResponse<List<TDto>> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء التعامل مع البيانات" };
            }
        }


        public virtual async Task<ExchangeResponse<TDto>> GetById_ExResponse(long id)
        {
            try
            {
                var entity = await Repository.GetByIdAsync(id);

                var response = Mapper.MapperObject.Mapper.Map<TDto>(entity);

                return new ExchangeResponse<TDto> { Status = ResponseEnum.Ok, Result = response };
            }
            catch(System.Exception ex)
            {
                return new ExchangeResponse<TDto> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء التعامل مع البيانات" };
            }
        }


        public virtual async Task<ExchangeResponse<TDto>> Create_ExResponse(TCreateDto input)
        {


            try
            {
                var entity = Mapper.MapperObject.Mapper.Map<TEntity>(input);
                //if (entity is null)
                //{
                //    throw new System.Exception(AppMessages.InternalError);
                //}

                await OnCreating(entity, input);


                UnitOfWork.BeginTran();

                var newEntity = await Repository.AddAsync(entity);

                await UnitOfWork.CompleteAsync();

                await OnCreated(newEntity, input);

                UnitOfWork.CommitTran();

                var response = Mapper.MapperObject.Mapper.Map<TDto>(newEntity);
                return new ExchangeResponse<TDto> { Status = ResponseEnum.Ok, Result = response };
            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<TDto> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء حفظ البيانات" };
            }

        }


        public virtual async Task<ExchangeResponse<TDto>> LightCreate_ExResponse(TCreateDto input)
        {


            try
            {
                var entity = Mapper.MapperObject.Mapper.Map<TEntity>(input);
                if (entity is null)
                {
                    throw new System.Exception(AppMessages.InternalError);
                }

                var newEntity = await Repository.AddAsync(entity);

                await UnitOfWork.CompleteAsync();

                var response = Mapper.MapperObject.Mapper.Map<TDto>(newEntity);
                return new ExchangeResponse<TDto> { Status = ResponseEnum.Ok, Result = response };
            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<TDto> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء حفظ البيانات" };
            }
            return null;
        }


        public virtual async Task<ExchangeResponse<List<TDto>>> LightCreateRange_ExResponse(List<TCreateDto> input)
        {


            try
            {
                var entity = Mapper.MapperObject.Mapper.Map<List<TEntity>>(input);
                if (entity is null)
                {
                    throw new System.Exception(AppMessages.InternalError);
                }

                var newEntity = await Repository.AddRangeAsync(entity);

                await UnitOfWork.CompleteAsync();

                var response = Mapper.MapperObject.Mapper.Map< List<TDto>>(newEntity);
                return new ExchangeResponse<List<TDto>> { Status = ResponseEnum.Ok, Result = response };
            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<List<TDto>> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء حفظ البيانات" };
            }
            return null;
        }


        public virtual async Task<ExchangeResponse<TDto>> Update_ExResponse(TUpdateDto input)
        {

            try
            {
                var entity = await Repository.GetByIdLightAsync(input.Id);

                if (entity == null)
                    throw new System.Exception(AppMessages.RecordNotExisted);

                UnitOfWork.BeginTran();
                await TrackingUpdate(entity, input);
                input = await BeforeUpdate(entity, input);

                Mapper.MapperObject.Mapper.Map(input, entity, typeof(TDto), typeof(TEntity));

                await OnUpdating(entity, input);

                await UnitOfWork.CompleteAsync();

                await OnUpdated(entity, input);

                UnitOfWork.CommitTran();


                var result = await Repository.GetByIdAsync(input.Id);

                var response = Mapper.MapperObject.Mapper.Map<TDto>(result);

         

                return new ExchangeResponse<TDto> { Status = ResponseEnum.Ok, Result = response };
            }
            catch (System.Exception ex)
            {
                UnitOfWork.RollbackTran();
                return new ExchangeResponse<TDto> { Status = ResponseEnum.Fail, Error_Desc = ex.Message, Notes = "حدث خطا اثناء حفظ البيانات" };

            }
        }


        public virtual async Task<ExchangeResponse<TDto>> LightUpdate_ExResponse(TUpdateDto input)
        {

            try
            {
                var entity = await Repository.GetByIdLightAsync(input.Id);

                if (entity == null)
                    throw new System.Exception(AppMessages.RecordNotExisted);

                Mapper.MapperObject.Mapper.Map(input, entity, typeof(TDto), typeof(TEntity));

                await UnitOfWork.CompleteAsync();


                var response = Mapper.MapperObject.Mapper.Map<TDto>(entity);

                return new ExchangeResponse<TDto> { Status = ResponseEnum.Ok, Result = response };
            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<TDto> { Status = ResponseEnum.Fail ,Error_Desc=ex.Message ,Notes = "حدث خطا اثناء حفظ البيانات" };

            }
        }



        /// <summary>
        /// ///////////////////
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="dto"></param>
        /// <returns></returns>
        protected async virtual Task<bool> OnCreating(TEntity entity, TCreateDto dto)
        {
            return true;

        }



        protected async virtual Task<bool> OnDeleting(TEntity entity)
        {
            return true;

        }



        protected async virtual Task<bool> OnUpdating(TEntity entity, TUpdateDto dto)
        {
            return true;
        }

        protected async virtual Task<TUpdateDto> BeforeUpdate(TEntity entity, TUpdateDto dto)
        {
            return dto;
        }

        protected async virtual Task<bool> OnCreated(TEntity entity, TCreateDto dto)
        {
            return true;
        }

      

        protected async virtual Task<bool> OnUpdated(TEntity entity, TUpdateDto dto)
        {
            return true;
        }

        public async virtual Task<bool> TrackingUpdate(TEntity entity, TUpdateDto dto)
        {
            return true;
        }
    }
}

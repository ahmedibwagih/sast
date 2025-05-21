using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.IO;
using System.Linq;

using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Application.Core.DTOs.Clients;
using Application.Core.DTOs.LookUps;
using Application.Core.Services;
using Application.Core.Services.Client;
using Application.Core.Services.LookUps;
using Core;
using Core.DTOs;
using Core.Entities.Clients;
using Core.Entities.LookUps;
using Core.Entities.Sec;
using Core.Other;
using Core.UnitOfWork;
using Infrastructure.Migrations;
using Infrastructure.UnitOfWork;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using static Google.Apis.Requests.BatchRequest;
using FuzzySharp;

namespace Application.Services.LookUps
{
    public class ExClientService : BaseService<ExClient, ClientOrSuppliersDto, ClientOrSuppliersDto, ClientOrSuppliersDto, ClientOrSuppliersDto>, IExClientService
    {
   
        IService<ExClientsAttachment, ExClientsAttachmentDto, ExClientsAttachmentDto, ExClientsAttachmentDto, ExClientsAttachmentDto> ExClientsAttachmentService;
        IService<ExClientsMembership, ExClientsMembershipDto, ExClientsMembershipDto, ExClientsMembershipDto, ExClientsMembershipDto> ExClientsMembershipService;
        IService<ExClientsRepresentative, ExClientsRepresentativeDto, ExClientsRepresentativeDto, ExClientsRepresentativeDto, ExClientsRepresentativeDto> ExClientsRepresentativeService;
        IService<ExClientsNote, ExClientsNoteDto, ExClientsNoteDto, ExClientsNoteDto, ExClientsNoteDto> ExClientsNoteService;
        public ExClientService(IUnitOfWork unitOfWork, IService<ExClientsAttachment, ExClientsAttachmentDto, ExClientsAttachmentDto, ExClientsAttachmentDto, ExClientsAttachmentDto> exClientsAttachmentService,
            IService<ExClientsMembership, ExClientsMembershipDto, ExClientsMembershipDto, ExClientsMembershipDto, ExClientsMembershipDto> exClientsMembershipService,
             IService<ExClientsRepresentative, ExClientsRepresentativeDto, ExClientsRepresentativeDto, ExClientsRepresentativeDto, ExClientsRepresentativeDto> exClientsRepresentativeService
            
            , IService<ExClientsNote, ExClientsNoteDto, ExClientsNoteDto, ExClientsNoteDto, ExClientsNoteDto> exClientsNoteService) : base(unitOfWork)
        {
            this.ExClientsAttachmentService = exClientsAttachmentService;
            this.ExClientsMembershipService = exClientsMembershipService;
            this.ExClientsRepresentativeService = exClientsRepresentativeService;
            this.ExClientsNoteService= exClientsNoteService;
     
        }


        public async Task<ClientSecDto> CheckSecurityFile( string name)
        {
            ClientSecDto r = new ClientSecDto();
            r.SecurityResult = new List<ClientSecItem>();
            //urityResult.Add(new ClientSecItem() { NatId = "123456", Name = name, Percenage = "80" });
            var resulr =(await UnitOfWork.ClientSecurityFile.GetAllAsync()).ToList();

            foreach (var item in resulr)
            {
                int per = Fuzz.Ratio(name, item.Name);
                if (per > 70)
                r.SecurityResult.Add(new ClientSecItem() { NatId = item.NatId, Name = item.Name , Percenage = per.ToString() });
            }
            return r;
        }
        //private  int CalculateLevenshteinDistance(string source, string target)
        //{
        //    if (string.IsNullOrEmpty(source)) return target?.Length ?? 0;
        //    if (string.IsNullOrEmpty(target)) return source.Length;

        //    int sourceLength = source.Length;
        //    int targetLength = target.Length;

        //    var distanceMatrix = new int[sourceLength + 1, targetLength + 1];

        //    // Initialize the distance matrix
        //    for (int i = 0; i <= sourceLength; i++) distanceMatrix[i, 0] = i;
        //    for (int j = 0; j <= targetLength; j++) distanceMatrix[0, j] = j;

        //    for (int i = 1; i <= sourceLength; i++)
        //    {
        //        for (int j = 1; j <= targetLength; j++)
        //        {
        //            int cost = source[i - 1] == target[j - 1] ? 0 : 1;

        //            distanceMatrix[i, j] = Math.Min(
        //                Math.Min(distanceMatrix[i - 1, j] + 1,     // Deletion
        //                         distanceMatrix[i, j - 1] + 1),    // Insertion
        //                distanceMatrix[i - 1, j - 1] + cost);      // Substitution
        //        }
        //    }

        //    return distanceMatrix[sourceLength, targetLength];
        //}

        public override async Task<ClientOrSuppliersDto> GetById(long id)
        {
            var response = filterDelails( await base.GetById(id));
            return response;
        }


        ClientOrSuppliersDto filterDelails(ClientOrSuppliersDto client)
        {
            client.ExClientsAttachments = client.ExClientsAttachments.Where(a => a.IsDeleted == false || a.IsDeleted == null).ToList();
            client.ExClientsMemberships = client.ExClientsMemberships.Where(a => a.IsDeleted == false || a.IsDeleted == null).ToList();
            client.ExClientsRepresentatives = client.ExClientsRepresentatives.Where(a => a.IsDeleted == false || a.IsDeleted == null).ToList();
           
            return client;
        }

        List<ClientOrSuppliersDto> filterDelails(List<ClientOrSuppliersDto> clients)
        {

            for (int i = 0; i < clients.Count(); i++)
            {
                clients[i] = filterDelails(clients[i]);
            }
             return clients;
        }

        public override async Task<ClientOrSuppliersDto> Create(ClientOrSuppliersDto input)
        {


            try
            {
               
                var entity = Mapper.MapperObject.Mapper.Map<ExClient>(input);

                //  entity.ClientId = (await UnitOfWork.ExClient.GetAllAsync()).Max(a => a.ClientId) + 1;
                entity.ClientId = 0;
                if (entity is null)
                {
                    throw new System.Exception(AppMessages.InternalError);
                }

                await OnCreating(entity, input);


                UnitOfWork.BeginTran();

                var newEntity = await Repository.AddAsync(entity);

                await UnitOfWork.CompleteAsync();

                newEntity.ClientCode = newEntity.ClientId.ToString();
                await OnCreated(newEntity, input);

                await UnitOfWork.CompleteAsync();

                UnitOfWork.CommitTran();

                var response = Mapper.MapperObject.Mapper.Map<ClientOrSuppliersDto>(newEntity);
                return response;
            }
            catch (System.Exception ex)
            {

                throw;
            }
            return null;
        }



        public  async Task<ClientOrSuppliersDto> Create2(ClientOrSuppliersDto2 data)
        {


            try
            {

                var input = Mapper.MapperObject.Mapper.Map<ClientOrSuppliersDto>(data);

               
                foreach (var i in input.ExClientsAttachments) {
                    i.AttachmentTypeId = 1;
                }

                var entity = Mapper.MapperObject.Mapper.Map<ExClient>(input);

                //  entity.ClientId = (await UnitOfWork.ExClient.GetAllAsync()).Max(a => a.ClientId) + 1;
                entity.ClientId = 0;
                if (entity is null)
                {
                    throw new System.Exception(AppMessages.InternalError);
                }

                await OnCreating(entity, input);


                UnitOfWork.BeginTran();

                var newEntity = await Repository.AddAsync(entity);

                await UnitOfWork.CompleteAsync();

                newEntity.ClientCode = newEntity.ClientId.ToString();
                await OnCreated(newEntity, input);

                await UnitOfWork.CompleteAsync();

                UnitOfWork.CommitTran();

                var response = Mapper.MapperObject.Mapper.Map<ClientOrSuppliersDto>(newEntity);
                return response;
            }
            catch (System.Exception ex)
            {

                throw;
            }
            return null;
        }



        public  async Task<ClientOrSuppliersDto> Update2(ClientOrSuppliersDto2 data)
        {

            var input = Mapper.MapperObject.Mapper.Map<ClientOrSuppliersDto>(data);
            foreach (var i in input.ExClientsAttachments)
            {
                i.AttachmentTypeId = 1;
            }
            try
            {
                var entity = await Repository.GetByIdLightAsync(input.Id);

                if (entity == null)
                    throw new System.Exception(AppMessages.RecordNotExisted);

                UnitOfWork.BeginTran();
                input = await BeforeUpdate(entity, input);

                Mapper.MapperObject.Mapper.Map(input, entity, typeof(ClientOrSuppliersDto), typeof(ExClient));

                await OnUpdating(entity, input);

                await UnitOfWork.CompleteAsync();

                await OnUpdated(entity, input);

                UnitOfWork.CommitTran();


                var result = await Repository.GetByIdAsync(input.Id);

                var response = Mapper.MapperObject.Mapper.Map<ClientOrSuppliersDto>(result);

                return response;
            }
            catch (System.Exception ex)
            {
                UnitOfWork.RollbackTran();

                throw new System.Exception(AppMessages.InternalError + " :" + ex.Message.ToString());

            }
        }





        public async Task<List<ExAttachmentTypeDto>> GetExAttachmentType()
        {
            try
            {
                var ExAttachmentType = await UnitOfWork.ExAttachmentType.GetAllAsync();
                var entityDto = Mapper.MapperObject.Mapper.Map<List<ExAttachmentTypeDto>>(ExAttachmentType);
                return entityDto;
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }

        public async Task<List<ExClientsTypeDto>> GetExClientsType()
        {
            try
            {
                var ExAttachmentType = await UnitOfWork.ExClientsType.GetAllAsync();
                List<ExClientsTypeDto> entityDto = new List<ExClientsTypeDto>();
                entityDto.Add(new ExClientsTypeDto() { ClientTypeId = 0, ClientTypeNameAr = "", ClientTypeNameEn = "", Id = 0 });
                entityDto.AddRange(  Mapper.MapperObject.Mapper.Map<List<ExClientsTypeDto>>(ExAttachmentType));
                
                return entityDto;
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }

        public async Task<List<ExSuppliersTypeDto>> GetSuppliersType()
        {
            try
            {
                var ExAttachmentType = await UnitOfWork.ExSuppliersType.GetAllAsync();
                var entityDto = Mapper.MapperObject.Mapper.Map<List<ExSuppliersTypeDto>>(ExAttachmentType);
                return entityDto;
            }
            catch (System.Exception ex)
            {

                throw new ExchangeException(ex.Message);
            }
        }

        


        public override async Task<PagingResultDto<ClientOrSuppliersDto>> GetAllPaging(PagingInputDto PagingInputDto)
        {
            var result = await Repository.GetAllPagingAsync(PagingInputDto);

            var list = Mapper.MapperObject.Mapper.Map<List<ClientOrSuppliersDto>>(result.Item1);

            var response = new PagingResultDto<ClientOrSuppliersDto>
            {
                Result = filterDelails( list),
                Total = result.Item2
            };

            return response;
        }

        public override async Task<IList<ClientOrSuppliersDto>> GetAll()
        {
            var list = await Repository.GetAllAsync();
            var result =  Mapper.MapperObject.Mapper.Map<List<ClientOrSuppliersDto>>(list);

            return filterDelails( result);
        }

        public override async Task<List<ClientOrSuppliersDto>> GetByCond(string cond)
        {
            var entity = await Repository.GetAsync(cond);

            var response = Mapper.MapperObject.Mapper.Map<List<ClientOrSuppliersDto>>(entity);

            return filterDelails(response);
        }

        protected async override Task<ClientOrSuppliersDto> BeforeUpdate(ExClient entity, ClientOrSuppliersDto dto)
        {

            for (int i = 0; i < dto.ExClientsAttachments.Count(); i++)
            {
                var item = dto.ExClientsAttachments.ToList()[i];
                if (item.ClientAttachmentId == 0 && item.IsDeleted == false)
                    item = await ExClientsAttachmentService.LightCreate(item);
                else if (item.IsDeleted == true)
                    await ExClientsAttachmentService.Delete(item.ClientAttachmentId);
                else
                    item = await ExClientsAttachmentService.LightUpdate(item);

                dto.ExClientsAttachments.ToList()[i] = item;
                //dto.ExClientsAttachments.ToList()[i].ClientAttachmentId = item.ClientAttachmentId;
                //dto.ExClientsAttachments.ToList()[i].Id=item.Id;
            }

            for (int i = 0; i < dto.ExClientsRepresentatives.Count(); i++)
            {
                var item = dto.ExClientsRepresentatives.ToList()[i];
                if (item.RepresentativeId == 0 && item.IsDeleted == false)
                    item = await ExClientsRepresentativeService.LightCreate(item);
                else if (item.IsDeleted == true)
                    await ExClientsRepresentativeService.Delete(item.RepresentativeId);
                else
                    item = await ExClientsRepresentativeService.LightUpdate(item);

                dto.ExClientsRepresentatives.ToList()[i] = item;
            }


            for (int i = 0; i < dto.ExClientsMemberships.Count(); i++)
            {
                var item = dto.ExClientsMemberships.ToList()[i];
                if (item.MembershipId == 0 && item.IsDeleted == false)
                    item = await ExClientsMembershipService.LightCreate(item);
                else if (item.IsDeleted == true)
                    await ExClientsMembershipService.Delete(item.MembershipId);
                else
                    item = await ExClientsMembershipService.LightUpdate(item);

                dto.ExClientsMemberships.ToList()[i] = item;
            }


            for (int i = 0; i < dto.ExClientsNote.Count(); i++)
            {
                var item = dto.ExClientsNote.ToList()[i];
                if (item.Id == 0)
                    item = await ExClientsNoteService.LightCreate(item);
                //else if (item.IsDeleted == true)
                //    await ExClientsMembershipService.Delete(item.MembershipId);
                else
                    item = await ExClientsNoteService.LightUpdate(item);

                dto.ExClientsNote.ToList()[i] = item;
            }

            return dto;
        }


        private async Task DownloadFileAsync(string fileUrl, string destinationPath)
        {
            try
            {
            HttpClient httpClient = new HttpClient();
                // Send GET request to the file URL
                using (HttpResponseMessage response = await httpClient.GetAsync(fileUrl))
                {
                    // Ensure the request was successful
                    response.EnsureSuccessStatusCode();

                    // Open a file stream to save the file to the specified path
                    using (Stream fileStream = await response.Content.ReadAsStreamAsync())
                    using (FileStream fs = new FileStream(destinationPath, FileMode.Create, FileAccess.Write))
                    {
                        // Copy the response stream (file content) to the destination file stream
                        await fileStream.CopyToAsync(fs);
                        Console.WriteLine($"File downloaded successfully to {destinationPath}");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error downloading file: {ex.Message}");
            }
        }

    }
}

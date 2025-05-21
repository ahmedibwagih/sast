using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;

using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.Taswya;
using Application.Core.DTOs.TRN_Invoices;
using Application.Core.DTOs.TRN_Transfers;
using Application.Core.DTOs.TRN_WholeInvoices;
using Application.Core.DTOs.Workflow;
using Application.Core.DTOs.WorkFlow;
using Application.Core.Services;
using Application.Core.Services.LookUps;
using Application.Core.Services.WorkFlow;
using Azure;
using Core;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.Taswya;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;
using Core.Entities.TRN_WholeInvoices;
using Core.Entities.Workflow;
using Core.Other;
using Core.UnitOfWork;



using Infrastructure.UnitOfWork;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using NetTopologySuite.Index.HPRtree;
using Org.BouncyCastle.Ocsp;
using static Google.Apis.Requests.BatchRequest;

namespace Application.Services.LookUps
{
    public class WorkFlowService : BaseService<WFRequest, WFRequestDto, WFRequestDto, WFRequestDto, WFRequestDto>, IWorkFlowService
    {
        //  private readonly DynamoSession session;

        IService<WFListOfApprovals, WFListOfApprovalsDto, WFListOfApprovalsDto, WFListOfApprovalsDto, WFListOfApprovalsDto> WFListOfApprovalsService;
        IService<WFRequestDetails, WFRequestDetailsDto, WFRequestDetailsDto, WFRequestDetailsDto, WFRequestDetailsDto> WFRequestDetailsService;
        IService<WFRequestType, WFRequestTypeDto, WFRequestTypeDto, WFRequestTypeDto, WFRequestTypeDto> WFRequestTypeSevice;
        IExInvoiceService ExInvoiceService;
        IExWholeInvoiceService ExWholeInvoiceService;
        ITreasuryTransfereService TreasuryTransfereService;
        public WorkFlowService(IUnitOfWork unitOfWork,
             IService<WFListOfApprovals, WFListOfApprovalsDto, WFListOfApprovalsDto, WFListOfApprovalsDto, WFListOfApprovalsDto> wFListOfApprovalsService,
        IService<WFRequestDetails, WFRequestDetailsDto, WFRequestDetailsDto, WFRequestDetailsDto, WFRequestDetailsDto> wFRequestDetailsService,
        IService<WFRequestType, WFRequestTypeDto, WFRequestTypeDto, WFRequestTypeDto, WFRequestTypeDto> wFRequestTypeSevice
            , IExInvoiceService exInvoiceService
            , IExWholeInvoiceService exWholeInvoiceService
            , ITreasuryTransfereService treasuryTransfereService
            ) : base(unitOfWork)
        {
            WFListOfApprovalsService = wFListOfApprovalsService;
            WFRequestDetailsService = wFRequestDetailsService;
            WFRequestTypeSevice = wFRequestTypeSevice;

            ExInvoiceService = exInvoiceService;
            ExWholeInvoiceService = exWholeInvoiceService;
            TreasuryTransfereService = treasuryTransfereService;
        }

        #region Work Flow Setting
        public async Task<ExchangeResponse<List<WFRequestTypeDto>>> GetRequestTypes()
        {
            try
            {
                var entity = await WFRequestTypeSevice.GetAll();
                var entityDto = Mapper.MapperObject.Mapper.Map<List<WFRequestTypeDto>>(entity);
                return new ExchangeResponse<List<WFRequestTypeDto>> { Status = ResponseEnum.Ok, Result = entityDto.ToList() };
            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<List<WFRequestTypeDto>> { Status = ResponseEnum.Fail, Error_Desc = ex.Message };
            }
        }

        public async Task<ExchangeResponse<List<WFListOfApprovalsDto>>> GetListApprovals(int requestTypeId, int branchID)
        {
            try
            {
                var entity = (await WFListOfApprovalsService.GetAll()).Where(a => a.BranchID == branchID && a.RequestTypeId == requestTypeId);
                var entityDto = Mapper.MapperObject.Mapper.Map<List<WFListOfApprovalsDto>>(entity);
                return new ExchangeResponse<List<WFListOfApprovalsDto>> { Status = ResponseEnum.Ok, Result = entityDto.ToList() };
            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<List<WFListOfApprovalsDto>> { Status = ResponseEnum.Fail,Error_Desc= ex.Message };
            }
        }

        public  async Task<ExchangeResponse<List<WFListOfApprovalsDto>>>  CreateListApprovals(List<WFListOfApprovalsDto>  input)
        {
            return await WFListOfApprovalsService.LightCreateRange_ExResponse(input);
        }


        public async Task<ExchangeResponse<WFListOfApprovalsDto>> UpdateListApproval(WFListOfApprovalsDto input)
        {
            return await WFListOfApprovalsService.Update_ExResponse(input);
        }

        public async Task DeleteListApproval(int ListOfApprovalId)
        {
            await WFListOfApprovalsService.Delete(ListOfApprovalId);
        }
        #endregion

        #region inbox outbox

        public async Task<ExchangeResponse<List<RequestResult>>> GetInBoxRequest(int userId)
        {
            try
            {
                var result =  UnitOfWork.Sp_Exchange_WF_GetInputRequest(userId);

                return new ExchangeResponse<List<RequestResult>> { Status = ResponseEnum.Ok, Result = result.ToList() };
            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<List<RequestResult>> { Status = ResponseEnum.Fail, Error_Desc = ex.Message };
            }
        }

        public async Task<ExchangeResponse<List<WFRequestDto>>> GetOutBoxRequest(int userId)
        {
            try
            {
                var result = await this.GetByCond("userId ==" + userId.ToString() + " and IsCompleted == false");

                return new ExchangeResponse<List<WFRequestDto>> { Status = ResponseEnum.Ok, Result = result.ToList() };
            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<List<WFRequestDto>> { Status = ResponseEnum.Fail, Error_Desc = ex.Message };
            }
        }

        public async Task<ExchangeResponse<List<WFRequestDto>>> GetArchiveRequest(int userId,DateTime from,DateTime to)
        {
            try
            {
                var result = (await this.GetByCond("userId ==" + userId.ToString() + " and IsCompleted == true")).Where(a=>a.RegisterDate >= from && a.RegisterDate <= to );

                return new ExchangeResponse<List<WFRequestDto>> { Status = ResponseEnum.Ok, Result = result.ToList() };
            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<List<WFRequestDto>> { Status = ResponseEnum.Fail, Error_Desc = ex.Message };
            }
        }

        protected async override Task<bool> OnCreated(WFRequest entity, WFRequestDto dto)
        {
            //اضافه مستخدم
            if (entity.RequestTypeId == 4)
            {
                var u = await UnitOfWork.SecUser.GetByIdAsync(int.Parse(dto.EntityId));
                u.Enabled = false;
                await UnitOfWork.CompleteAsync();
            }
            return true;
        }

        
            public async Task<ExchangeResponse<List<WFRequestDetailsDto>>> GetRequestDetails(int requestId)
        {
            try
            {
                var entity = (await WFRequestDetailsService.GetByCond("RequestId == " + requestId)).ToList();
                var entityDto = Mapper.MapperObject.Mapper.Map<List<WFRequestDetailsDto>>(entity);
                return new ExchangeResponse<List<WFRequestDetailsDto>> { Status = ResponseEnum.Ok, Result = entityDto.ToList() };
            }
            catch (System.Exception ex)
            {

                return new ExchangeResponse<List<WFRequestDetailsDto>> { Status = ResponseEnum.Fail, Error_Desc = ex.Message };
            }
        }

        public async Task<Boolean> RejectRequest(int requestId,int userid)
        {
            
            var req = await this.GetById(requestId);
           

            //var approve = (await WFListOfApprovalsService.GetByCond("RequestTypeId =="+ req.RequestTypeId.ToString() + " and BranchID ==" +req.BranchID.ToString() + " and UserId =="+ userid.ToString())).FirstOrDefault();
            var Allapproves = (await WFListOfApprovalsService.GetByCond("RequestTypeId ==" + req.RequestTypeId.ToString() + " and BranchID ==" + req.BranchID.ToString())).OrderBy(a => a.ActionOrder).ToList(); ;
            Allapproves = await ChangeApprovals(Allapproves, requestId);
            var approves = Allapproves.Where(a => a.UserId == userid);
            var approve = approves.FirstOrDefault();

            if (approves.Count() > 1)
            {
                int nextorder = 1;
                try
                {
                    nextorder = (await WFRequestDetailsService.GetByCond("RequestId == " + req.Id.ToString())).Max(a => a.ActionOrder) + 1;
                    if (approves.Where(a => a.ActionOrder == nextorder).FirstOrDefault() != null)
                        approve = approves.Where(a => a.ActionOrder == nextorder).FirstOrDefault();
                }
                catch { }

            }

            //if (approve.Islast) {
               // req.IsCompleted = true;
            //}

            await WFRequestDetailsService.LightCreate(new WFRequestDetailsDto()
            {
                ActionType=0,ActionOrder=approve.ActionOrder,RegisterDate=DateTime.Now,RequestId=req.RequestId,UserId=userid
            });

             var req1 = await UnitOfWork.WFRequest.GetByIdAsync(requestId);
            req1.IsCompleted = true;
            await this.UnitOfWork.CompleteAsync();
            //اضافه مستخدم
            if (req.RequestTypeId == 4)
            {
                var u = await UnitOfWork.SecUser.GetByIdAsync(int.Parse(req.EntityId));
                u.Enabled = false;
                await UnitOfWork.CompleteAsync();
            }
            //فاتوره افراد
            if (req.RequestTypeId == 1)
            {
                var u = await UnitOfWork.ExInvoice.GetByIdAsync(int.Parse(req.EntityId));
                u.IsPendingWorkflow = false;
                u.IsDeleted = true;
                await UnitOfWork.CompleteAsync();
                await ExInvoiceService.CreateCurrencyBvr(u);

            }
            //فاتوره جملة
            if (req.RequestTypeId == 2)
            {
                var u2 = await UnitOfWork.ExWholeInvoice.GetByIdAsync(int.Parse(req.EntityId));
                u2.IsPendingWorkflow = false;
                u2.IsDeleted = true;
                await UnitOfWork.CompleteAsync();
                await ExWholeInvoiceService.CreateCurrencyBvr(u2);

            }
            //تحويل بين الخزن
            if (req.RequestTypeId == 5 || req.RequestTypeId == 6)
            {
                var u2 = await UnitOfWork.ExTreasuryTransfere.GetByIdAsync(int.Parse(req.EntityId));
                u2.IsPendingWorkflow = false;
                u2.IsDeleted = true;
                await UnitOfWork.CompleteAsync();
                await TreasuryTransfereService.CreateCurrencyBvr(u2);

            }
            
            return true;
        }

        private async Task<List<WFListOfApprovalsDto>> ChangeApprovals(List<WFListOfApprovalsDto> Allapproves, int requestId)
        {
            if (Allapproves.Where(a => a.UserId == 9999990 || a.UserId == 9999991 || a.UserId == 9999992 || a.UserId == 9999993).ToList().Count() > 0)
            {
                var req = await this.GetById(requestId);

                var transfere = await UnitOfWork.ExTreasuryTransfere.GetByIdAsync(int.Parse(req.EntityId));
                foreach (var item in Allapproves)
                {
                    if (item.UserId == 9999990)
                    {
                        var treasury = await UnitOfWork.Treasury.GetByIdAsync(long.Parse(transfere.FromTreasuryId.ToString()));
                        item.UserId = treasury.OwnerId;
                    }
                    if (item.UserId == 9999991)
                    {
                        var treasury = await UnitOfWork.Treasury.GetByIdAsync(long.Parse(transfere.ToTreasuryId.ToString()));
                        item.UserId = treasury.OwnerId;
                    }
                    if (item.UserId == 9999992)
                    {
                        var branch = await UnitOfWork.ExBranch.GetByIdAsync(long.Parse(transfere.FromBranchID.ToString()));
                        item.UserId = branch.ManagerId;
                    }
                    if (item.UserId == 9999993)
                    {
                        var branch = await UnitOfWork.ExBranch.GetByIdAsync(long.Parse(transfere.ToBranchID.ToString()));
                        item.UserId = branch.ManagerId;
                    }
                }
            }

            return Allapproves;
        }

        public async Task<Boolean> ApproveRequest(int requestId, int userid)
        {

            var req = await this.GetById(requestId);
            //req.IsCompleted = true;

            var Allapproves = (await WFListOfApprovalsService.GetByCond("RequestTypeId ==" + req.RequestTypeId.ToString() + " and BranchID ==" + req.BranchID.ToString() )).OrderBy(a=>a.ActionOrder).ToList();
            Allapproves = await ChangeApprovals(Allapproves, requestId);
            var approves = Allapproves.Where(a => a.UserId == userid);
            var approve = approves.FirstOrDefault();
            
            if (approves.Count() > 1)
            {
              int   nextorder = 1;
                try
                {
                    nextorder = (await WFRequestDetailsService.GetByCond("RequestId == " + req.Id.ToString())).Max(a => a.ActionOrder) + 1;
                    if (approves.Where(a => a.ActionOrder == nextorder).FirstOrDefault() != null)
                    approve = approves.Where(a => a.ActionOrder == nextorder).FirstOrDefault();
                }
                catch { }

            }
            if (approve.Islast)
            {
                var req1 = await UnitOfWork.WFRequest.GetByIdAsync(requestId);
                req1.IsCompleted = true;
                //اضافه مستخدم
                if (req.RequestTypeId == 4)
                {
                    var u = await UnitOfWork.SecUser.GetByIdAsync(int.Parse(req.EntityId));
                    u.Enabled = true;
                    await UnitOfWork.CompleteAsync();
                }
                //فاتوره افراد
                if (req.RequestTypeId == 1)
                {
                    var u = await UnitOfWork.ExInvoice.GetByIdAsync(int.Parse(req.EntityId));
                    u.IsPendingWorkflow = false;
                    await UnitOfWork.CompleteAsync();
                    await ExInvoiceService.CreateCurrencyBvr(u);
                   
                }
                //فاتوره جملة
                if (req.RequestTypeId == 2)
                {
                    var u2 = await UnitOfWork.ExWholeInvoice.GetByIdAsync(int.Parse(req.EntityId));
                    u2.IsPendingWorkflow = false;
                    await UnitOfWork.CompleteAsync();
                    await ExWholeInvoiceService.CreateCurrencyBvr(u2);

                }
                //تحويل بين الخزن
                if (req.RequestTypeId == 5 || req.RequestTypeId == 6)
                {
                    var u2 = await UnitOfWork.ExTreasuryTransfere.GetByIdAsync(int.Parse(req.EntityId));
                    u2.IsPendingWorkflow = false;
                    await UnitOfWork.CompleteAsync();
                    await TreasuryTransfereService.CreateCurrencyBvr(u2);

                }
               


                await this.Update(req);
            }

         
            await WFRequestDetailsService.LightCreate(new WFRequestDetailsDto()
            {
                ActionType = 1,
                ActionOrder = approve.ActionOrder,
                RegisterDate = DateTime.Now,
                RequestId = req.RequestId,
                UserId = userid
            });

           
            return true;
        }

        public async Task<Boolean> AddCommentRequest(int requestId, int userid,string Comment)
        {

            var req = await this.GetById(requestId);
           // req.IsCompleted = true;

           // var approve = (await WFListOfApprovalsService.GetByCond("RequestTypeId ==" + req.RequestTypeId.ToString() + " and BranchID ==" + req.BranchID.ToString() + " and UserId ==" + userid.ToString())).FirstOrDefault();

            var Allapproves = (await WFListOfApprovalsService.GetByCond("RequestTypeId ==" + req.RequestTypeId.ToString() + " and BranchID ==" + req.BranchID.ToString())).OrderBy(a => a.ActionOrder).ToList(); ;
            Allapproves = await ChangeApprovals(Allapproves, requestId);
            var approves = Allapproves.Where(a => a.UserId == userid);
            var approve = approves.FirstOrDefault();

            if (approves.Count() > 1)
            {
                int nextorder = 1;
                try
                {
                    nextorder = (await WFRequestDetailsService.GetByCond("RequestId == " + req.Id.ToString())).Max(a => a.ActionOrder) + 1;
                    if (approves.Where(a => a.ActionOrder == nextorder).FirstOrDefault() != null)
                        approve = approves.Where(a => a.ActionOrder == nextorder).FirstOrDefault();
                }
                catch { }

            }

            //if (approve.Islast) {
            //    req.IsCompleted = true;
            //}
            await WFRequestDetailsService.LightCreate(new WFRequestDetailsDto()
            {
                ActionType = 2,
                ActionOrder = approve.ActionOrder,
                RegisterDate = DateTime.Now,
                RequestId = req.RequestId,
                UserId = userid,
                Notes = Comment
            });

            await this.UnitOfWork.CompleteAsync();

            return true;

        }

        public async Task<Boolean> ReturnRequest(int requestId, int userid)
        {

            var req = await this.GetById(requestId);
            req.IsCompleted = true;

           // var approve = (await WFListOfApprovalsService.GetByCond("RequestTypeId ==" + req.RequestTypeId.ToString() + " and BranchID ==" + req.BranchID.ToString() + " and UserId ==" + userid.ToString())).FirstOrDefault();
            var Allapproves = (await WFListOfApprovalsService.GetByCond("RequestTypeId ==" + req.RequestTypeId.ToString() + " and BranchID ==" + req.BranchID.ToString())).OrderBy(a => a.ActionOrder).ToList(); ;
            Allapproves = await ChangeApprovals(Allapproves, requestId);
            var approves = Allapproves.Where(a => a.UserId == userid);
            var approve = approves.FirstOrDefault();

            if (approves.Count() > 1)
            {
                int nextorder = 1;
                try
                {
                    nextorder = (await WFRequestDetailsService.GetByCond("RequestId == " + req.Id.ToString())).Max(a => a.ActionOrder) + 1;
                    if (approves.Where(a => a.ActionOrder == nextorder).FirstOrDefault() != null)
                        approve = approves.Where(a => a.ActionOrder == nextorder).FirstOrDefault();
                }
                catch { }

            }
            //if (approve.Islast) {
            //    req.IsCompleted = true;
            //}
            await WFRequestDetailsService.LightCreate(new WFRequestDetailsDto()
            {
                ActionType = -1,
                ActionOrder = approve.ActionOrder,
                RegisterDate = DateTime.Now,
                RequestId = req.RequestId,
                UserId = userid
            });

            await this.UnitOfWork.CompleteAsync();
            return true;
        }


        #endregion


    }
}

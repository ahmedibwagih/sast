using System.Threading.Tasks;
using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.Sec;
using Application.Core.DTOs.Taswya;
using Application.Core.DTOs.TRN_Invoices;
using Application.Core.DTOs.TRN_Transfers;
using Application.Core.DTOs.Workflow;
using Application.Core.DTOs.WorkFlow;
using Application.Core.Services;
using Application.Core.Services.LookUps;
using Application.Core.Services.WorkFlow;
using Application.Services;
using Application.Services.LookUps;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Other;
using Infrastructure.Migrations;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers.workFlow
{
    [Route("api/[controller]")]
    [ApiController]
    public class WorkFlowController : ControllerBase
    {

        private readonly IWorkFlowService service;
        private readonly ISecurityService service2;

        public WorkFlowController(IWorkFlowService service, ISecurityService service2)
        {
            this.service = service;
            this.service2 = service2;
        }


        
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<SecUserDto>>> GetUsersForWorkFlow(int RequestTypeId)
        {
            return await service2.GetUsersForWorkFlow(RequestTypeId);
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<WFRequestTypeDto>>> GetRequestTypes() { 
        return await service.GetRequestTypes();
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<WFListOfApprovalsDto>>> GetListApprovals(int requestTypeId, int branchID)
        {
            return await service.GetListApprovals(requestTypeId, branchID);
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<WFListOfApprovalsDto>>> CreateListApprovals(List<WFListOfApprovalsDto> input)
        {
            return await service.CreateListApprovals(input);
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<WFListOfApprovalsDto>> UpdateListApproval(WFListOfApprovalsDto input)
        {
            return await service.UpdateListApproval(input);
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task DeleteListApproval(int ListOfApprovalId)
        {
           await   service.DeleteListApproval(ListOfApprovalId);
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<RequestResult>>> GetInBoxRequest(int userId)
        {
            return await service.GetInBoxRequest(userId);
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<WFRequestDto>>> GetOutBoxRequest(int userId)
        {
            return await service.GetOutBoxRequest(userId);
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<WFRequestDto>>> GetArchiveRequest(int userId, DateTime from, DateTime to)
        {
            return await service.GetArchiveRequest(userId, from, to);
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse<List<WFRequestDetailsDto>>> GetRequestDetails(int requestId)
        {
            return await service.GetRequestDetails(requestId);
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<Boolean> RejectRequest(int requestId, int userid)
        {
            return await service.RejectRequest(requestId, userid);
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<Boolean> ApproveRequest(int requestId, int userid)
        {
            return await service.ApproveRequest(requestId, userid);
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<Boolean> AddCommentRequest(int requestId, int userid, string Comment)
        {
            return await service.AddCommentRequest(requestId, userid, Comment);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Route("[action]")]
        public async Task<ExchangeResponse< WFRequestDto>> CreateRequest(WFRequestDto request)
        {
            if (request.EntityId == null)
                request.EntityId = "";
            return await service.Create_ExResponse(request);
        }



    }
}

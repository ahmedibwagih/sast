using Application.Core.DTOs;
using Application.Core.DTOs.LookUps;
using Application.Core.DTOs.Taswya;
using Application.Core.DTOs.TRN_Invoices;
using Application.Core.DTOs.TRN_Transfers;
using Application.Core.DTOs.Workflow;
using Application.Core.DTOs.WorkFlow;
using Core.DTOs;
using Core.Entities.LookUps;
using Core.Entities.Taswya;
using Core.Entities.TRN_Invoices;
using Core.Entities.TRN_Transfers;
using Core.Entities.Workflow;

namespace Application.Core.Services.WorkFlow
{
    public interface IWorkFlowService : IService<WFRequest, WFRequestDto, WFRequestDto, WFRequestDto, WFRequestDto>
    {

        Task<ExchangeResponse<List<WFRequestTypeDto>>> GetRequestTypes();
        Task<ExchangeResponse<List<WFListOfApprovalsDto>>> GetListApprovals(int requestTypeId, int branchID);
        Task<ExchangeResponse<List<WFListOfApprovalsDto>>> CreateListApprovals(List<WFListOfApprovalsDto> input);

        Task<ExchangeResponse<WFListOfApprovalsDto>> UpdateListApproval(WFListOfApprovalsDto input);
        Task DeleteListApproval(int ListOfApprovalId);
        Task<ExchangeResponse<List<RequestResult>>> GetInBoxRequest(int userId);
        Task<ExchangeResponse<List<WFRequestDto>>> GetOutBoxRequest(int userId);
        Task<ExchangeResponse<List<WFRequestDto>>> GetArchiveRequest(int userId, DateTime from, DateTime to);
        Task<ExchangeResponse<List<WFRequestDetailsDto>>> GetRequestDetails(int requestId);
        Task<Boolean> RejectRequest(int requestId, int userid);
        Task<Boolean> ApproveRequest(int requestId, int userid);
        Task<Boolean> AddCommentRequest(int requestId, int userid, string Comment);


    }
}

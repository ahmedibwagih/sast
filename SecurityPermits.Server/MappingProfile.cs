using AutoMapper;
using SecurityPermits.Server.Models;
namespace SecurityPermits.Server
{


    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<AccessPermit, AccessPermitDto>().ReverseMap();
            CreateMap<Branch, BranchDto>().ReverseMap();
            CreateMap<Department, DepartmentDto>().ReverseMap();
            CreateMap<DepartmentSection, DepartmentSectionDto>().ReverseMap();
            CreateMap<Employee, EmployeeDto>().ReverseMap();
            CreateMap<Permit, PermitDto>().ReverseMap();
            CreateMap<PermitDoc, PermitDocDto>().ReverseMap();
            CreateMap<PermitPerson, PermitPersonDto>().ReverseMap();
            CreateMap<PermitsDevice, PermitsDeviceDto>().ReverseMap();
            CreateMap<PermitWorkType, PermitWorkTypeDto>().ReverseMap();
            CreateMap<WorkType, WorkTypeDto>().ReverseMap();
            CreateMap<DeviceStatus, DeviceStatusDto>().ReverseMap();


            //CreateMap<PermitDoc, PermitDocDto>().ForMember(m => m.DocPath, op => op.MapFrom(mp => Path.Combine(Directory.GetCurrentDirectory(), "uploads",mp.DocPath)));

            CreateMap<PermitDocDto, PermitDoc>();
            // Add other mappings as needed
        }
    }

}

using System;
using System.Collections.Generic;

namespace SecurityPermits.Server.Models;

public partial class EmployeeDto
{
    public string Name { get; set; } = null!;

    public int Number { get; set; }

    public string? AccountNumber { get; set; }

    public int? BranchId { get; set; }

    public int? DepartmentId { get; set; }

    public int? DepartmentSectionId { get; set; }

    public int? JobPositionId { get; set; }

    public string? Remarks { get; set; }

    public string? Password { get; set; }

    public bool? Active { get; set; }

    public int? QualificationStudyId { get; set; }

    public int? MaritalStatusId { get; set; }

    public int? MilitaryStatusId { get; set; }

    public long? NationalityId { get; set; }

    public int? EmploymentStatusId { get; set; }

    public DateTime? HiringDate { get; set; }

    public string? GraduationYear { get; set; }

    public string? GraduationGrade { get; set; }

    public DateTime? BirthDate { get; set; }

    public string? BirthPlace { get; set; }

    public int? ChlidernNumbers { get; set; }

    public string? IdorPassport { get; set; }

    public string? Religion { get; set; }

    public string? Gender { get; set; }

    public bool? IsSectionLeader { get; set; }

    public DateTime? JobHiringDate { get; set; }

    public string? Address { get; set; }

    public int? GovernorateId { get; set; }

    public string? Telephone { get; set; }

    public string? Mobile { get; set; }

    public string? SchoolOrinstituteOrFaculty { get; set; }

    public string? LearningSection { get; set; }

    public string? PostGraduate { get; set; }

    public string? AdminLevel { get; set; }

    public string? Email { get; set; }

    public bool? BirthDateIsPublished { get; set; }

    public string? Image { get; set; }
}

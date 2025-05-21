using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace SecurityPermits.Server.Models;

public partial class SecurityPermitsContext : DbContext
{
    public SecurityPermitsContext()
    {
    }

    public SecurityPermitsContext(DbContextOptions<SecurityPermitsContext> options)
        : base(options)
    {
    }

    public virtual DbSet<AccessPermit> AccessPermits { get; set; }

    public virtual DbSet<Branch> Branches { get; set; }

    public virtual DbSet<Department> Departments { get; set; }

    public virtual DbSet<DepartmentSection> DepartmentSections { get; set; }

    public virtual DbSet<Employee> Employees { get; set; }

    public virtual DbSet<Permit> Permits { get; set; }

    public virtual DbSet<PermitDoc> PermitDocs { get; set; }

    public virtual DbSet<PermitPerson> PermitPersons { get; set; }

    public virtual DbSet<PermitWorkType> PermitWorkTypes { get; set; }

    public virtual DbSet<PermitsDevice> PermitsDevices { get; set; }

    public virtual DbSet<WorkType> WorkTypes { get; set; }

//    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
//        => optionsBuilder.UseSqlServer("Data Source=HOITL-22837\\SQLEXPRESS;Initial Catalog=SecurityPermits;User ID=ahmed;Password=123456;TrustServerCertificate=true;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        try
        {
            modelBuilder.Entity<AccessPermit>(entity =>
            {
                entity.ToTable("Access_Permits");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");
                entity.Property(e => e.AccessType)
                    //.HasDefaultValue((int)0)
                    .HasComment("نوع اصلاحيه   0 اعتماد التصاريح الامنية   ");
                entity.Property(e => e.EmpNumber).ValueGeneratedOnAdd();
                entity.Property(e => e.ForBranchId)
                    .HasComment("لفرع معين  0 تعني كل الفروع")
                    .HasColumnName("ForBranch_ID");
                entity.Property(e => e.ForDepartmentSectionId)
                    .HasComment("لاداره فرعيه معينه 0 تعني الكل")
                    .HasColumnName("ForDepartmentSectionID");
                entity.Property(e => e.FroDepartmentId)
                    .HasComment("لاداره معنيه 0 تعني كل الادارات")
                    .HasColumnName("FroDepartment_ID");
            });

            modelBuilder.Entity<Branch>(entity =>
            {
                entity
                    .HasNoKey()
                    .ToView("Branches");

                entity.Property(e => e.Address).HasMaxLength(300);
                entity.Property(e => e.AddressEn)
                    .HasMaxLength(300)
                    .HasColumnName("Address_EN");
                entity.Property(e => e.Box).HasColumnName("box");
                entity.Property(e => e.Email).HasMaxLength(50);
                entity.Property(e => e.Fax).HasMaxLength(100);
                entity.Property(e => e.GlId).HasColumnName("GL_ID");
                entity.Property(e => e.GovId).HasColumnName("Gov_ID");
                entity.Property(e => e.Id).HasColumnName("ID");
                entity.Property(e => e.Mobile).HasMaxLength(100);
                entity.Property(e => e.NameAr).HasColumnName("Name_AR");
                entity.Property(e => e.NameEn).HasColumnName("Name_EN");
                entity.Property(e => e.PostCode)
                    .HasMaxLength(100)
                    .HasColumnName("Post_Code");
                entity.Property(e => e.ZoneId).HasColumnName("Zone_id");
            });

            modelBuilder.Entity<Department>(entity =>
            {
                entity
                    .HasNoKey()
                    .ToView("Department");

                entity.Property(e => e.BranchId).HasColumnName("Branch_ID");
                entity.Property(e => e.Id)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");
                entity.Property(e => e.Name).HasMaxLength(50);
            });

            modelBuilder.Entity<DepartmentSection>(entity =>
            {
                entity
                    .HasNoKey()
                    .ToView("Department_Sections");

                entity.Property(e => e.BranchId).HasColumnName("Branch_ID");
                entity.Property(e => e.DepartmentId).HasColumnName("Department_ID");
                entity.Property(e => e.Id)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");
                entity.Property(e => e.Name).HasMaxLength(150);
            });

            modelBuilder.Entity<Employee>(entity =>
            {
                entity
                    .HasNoKey()
                    .ToView("Employee");

                entity.Property(e => e.AccountNumber).HasMaxLength(150);
                entity.Property(e => e.Address).HasMaxLength(150);
                entity.Property(e => e.AdminLevel).HasMaxLength(50);
                entity.Property(e => e.BirthDate).HasColumnType("datetime");
                entity.Property(e => e.BirthDateIsPublished).HasColumnName("BirthDate_Is_Published");
                entity.Property(e => e.BirthPlace).HasMaxLength(50);
                entity.Property(e => e.BranchId).HasColumnName("Branch_ID");
                entity.Property(e => e.DepartmentId).HasColumnName("Department_ID");
                entity.Property(e => e.DepartmentSectionId).HasColumnName("DepartmentSectionID");
                entity.Property(e => e.Email).HasMaxLength(150);
                entity.Property(e => e.EmploymentStatusId).HasColumnName("EmploymentStatus_ID");
                entity.Property(e => e.Gender).HasMaxLength(50);
                entity.Property(e => e.GovernorateId).HasColumnName("GovernorateID");
                entity.Property(e => e.GraduationGrade).HasMaxLength(50);
                entity.Property(e => e.GraduationYear).HasMaxLength(50);
                entity.Property(e => e.HiringDate)
                    .HasColumnType("datetime")
                    .HasColumnName("Hiring_Date");
                entity.Property(e => e.IdorPassport)
                    .HasMaxLength(50)
                    .HasColumnName("IDOrPassport");
                entity.Property(e => e.Image).HasMaxLength(50);
                entity.Property(e => e.JobHiringDate).HasColumnType("datetime");
                entity.Property(e => e.JobPositionId).HasColumnName("JobPosition_ID");
                entity.Property(e => e.LearningSection).HasMaxLength(50);
                entity.Property(e => e.MaritalStatusId).HasColumnName("MaritalStatus_ID");
                entity.Property(e => e.MilitaryStatusId).HasColumnName("MilitaryStatus_ID");
                entity.Property(e => e.Mobile).HasMaxLength(50);
                entity.Property(e => e.Name).HasMaxLength(255);
                entity.Property(e => e.NationalityId).HasColumnName("Nationality_ID");
                entity.Property(e => e.Password).HasMaxLength(50);
                entity.Property(e => e.QualificationStudyId).HasColumnName("QualificationStudy_ID");
                entity.Property(e => e.Religion).HasMaxLength(50);
                entity.Property(e => e.Remarks).HasMaxLength(255);
                entity.Property(e => e.SchoolOrinstituteOrFaculty).HasMaxLength(150);
                entity.Property(e => e.Telephone).HasMaxLength(50);
            });

            modelBuilder.Entity<Permit>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");
                entity.Property(e => e.ApproveEmpDate)
                    .HasComment("تاريخ الاعتماد")
                    .HasColumnType("datetime");
                entity.Property(e => e.ApproveEmpNumber).HasComment("موظف الاعتماد");
                entity.Property(e => e.BranchId)
                    .HasComment("الفرع")
                    .HasColumnName("Branch_ID");
                entity.Property(e => e.CompanyName)
                    .HasMaxLength(150)
                    .HasComment("الشركة");
                entity.Property(e => e.ContractorName)
                    .HasMaxLength(150)
                    .HasComment("المقاول");
                entity.Property(e => e.DepartmentId)
                    .HasComment("الاداره")
                    .HasColumnName("Department_ID");
                entity.Property(e => e.DepartmentSectionId)
                    .HasComment("الاداره الفرعية")
                    .HasColumnName("DepartmentSectionID");
                entity.Property(e => e.EntryEmpDate)
                    .HasDefaultValueSql("(getdate())")
                    .HasComment("تاريخ الادخال")
                    .HasColumnType("datetime");
                entity.Property(e => e.EntryEmpMobile)
                    .HasMaxLength(150)
                    .HasComment("موبايل موظف الادخال");
                entity.Property(e => e.EntryEmpNumber).HasComment("موظف الادخال");
                entity.Property(e => e.EntryEmpPhone)
                    .HasMaxLength(150)
                    .HasComment("التلفون الداخلي لموظف الادخال");
                entity.Property(e => e.PermitFrom).HasColumnType("datetime");
                entity.Property(e => e.PermitTo).HasColumnType("datetime");
                entity.Property(e => e.Status).HasComment("حاله الاعتماد -1 0  1 مرفوض جديد تم الاعتماد  ");
            });

            modelBuilder.Entity<PermitDoc>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");
                entity.Property(e => e.DocName).HasMaxLength(150);
                entity.Property(e => e.DocPath).HasMaxLength(250);
                entity.Property(e => e.PermitId).HasColumnName("PermitID");

                entity.HasOne(d => d.Permit).WithMany(p => p.PermitDocs)
                    .HasForeignKey(d => d.PermitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PermitDocs_Permits");
            });

            modelBuilder.Entity<PermitPerson>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");
                entity.Property(e => e.NationalId)
                    .HasMaxLength(14)
                    .HasColumnName("NationalID");
                entity.Property(e => e.PermitId).HasColumnName("PermitID");
                entity.Property(e => e.PersonName).HasMaxLength(250);

                entity.HasOne(d => d.Permit).WithMany(p => p.PermitPeople)
                    .HasForeignKey(d => d.PermitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PermitPersons_Permits");
            });

            modelBuilder.Entity<PermitWorkType>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");
                entity.Property(e => e.PermitId).HasColumnName("PermitID");
                entity.Property(e => e.WorkTypeId).HasColumnName("WorkTypeID");

                entity.HasOne(d => d.Permit).WithMany(p => p.PermitWorkTypes)
                    .HasForeignKey(d => d.PermitId)
                    .HasConstraintName("FK_PermitWorkTypes_Permits");

                entity.HasOne(d => d.WorkType).WithMany(p => p.PermitWorkTypes)
                    .HasForeignKey(d => d.WorkTypeId)
                    .HasConstraintName("FK_PermitWorkTypes_WorkTypes");
            });

            modelBuilder.Entity<PermitsDevice>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");
                entity.Property(e => e.DeviceCount).HasComment("العدد");
                entity.Property(e => e.DeviceName)
                    .HasMaxLength(100)
                    .HasComment("اسم الجهاز");
                entity.Property(e => e.DeviceSerialNo)
                    .HasMaxLength(100)
                    .HasComment("سيريال ");
                entity.Property(e => e.DeviceStatus).HasComment("حاله الجهاز 1 تم سحبه 2 تم رجوعه 0 لم يتم سحبه");
                entity.Property(e => e.DeviceType)
                    .HasMaxLength(100)
                    .HasComment("النوع");
                entity.Property(e => e.EmpNumberReturn).HasComment("الموظف المسئول عن عوده الاجهزه");
                entity.Property(e => e.ExpectedReturnDate)
                    .HasComment("تاريخ العوده المتوقع")
                    .HasColumnType("datetime");
                entity.Property(e => e.OutDate)
                    .HasComment("تاريخ سحب الجهاز")
                    .HasColumnType("datetime");
                entity.Property(e => e.PermitId).HasColumnName("PermitID");
                entity.Property(e => e.ReturnDate)
                    .HasComment("تاريخ العوده الفعلي")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.Permit).WithMany(p => p.PermitsDevices)
                    .HasForeignKey(d => d.PermitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PermitsDevices_Permits");
            });

            modelBuilder.Entity<WorkType>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");
                entity.Property(e => e.WorkTypeName)
                    .HasMaxLength(250)
                    .HasComment("انواع الاعمال المطلوبة");
            });
        }
        catch (Exception ex) { }
        
        { 
        
        }

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}

using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddPermissionType : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Sec_UsersForms_Sec_Users",
                table: "Sec_UsersForms");

            migrationBuilder.DropForeignKey(
                name: "FK_Sec_UsersFunctions_Sec_Users",
                table: "Sec_UsersFunctions");

            //migrationBuilder.DropTable(
            //    name: "RolePermission");

            //migrationBuilder.DropTable(
            //    name: "RoleUser");

            //migrationBuilder.DropTable(
            //    name: "Permission");

            //migrationBuilder.DropTable(
            //    name: "Role");

            //migrationBuilder.DropTable(
            //    name: "User");

            migrationBuilder.RenameColumn(
                name: "UserID",
                table: "Sec_UsersFunctions",
                newName: "PermissionTypeId");

            migrationBuilder.RenameColumn(
                name: "UserID",
                table: "Sec_UsersForms",
                newName: "PermissionTypeId");

            migrationBuilder.AddColumn<int>(
                name: "SecUserUserId",
                table: "Sec_UsersFunctions",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SecUserUserId",
                table: "Sec_UsersForms",
                type: "int",
                nullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "UserID",
                table: "Sec_Users",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int")
                .OldAnnotation("Relational:ColumnOrder", 0);

            migrationBuilder.AddColumn<int>(
                name: "PermissionTypeId",
                table: "Sec_Users",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "EX_PermissionTypes",
                columns: table => new
                {
                    PermissionTypeId = table.Column<int>(type: "int", nullable: false),
                    PermissionTypeNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    PermissionTypeNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PermissionTypes", x => x.PermissionTypeId);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Sec_UsersFunctions_SecUserUserId",
                table: "Sec_UsersFunctions",
                column: "SecUserUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sec_UsersForms_SecUserUserId",
                table: "Sec_UsersForms",
                column: "SecUserUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sec_Users_PermissionTypeId",
                table: "Sec_Users",
                column: "PermissionTypeId");

           
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
      

            migrationBuilder.DropTable(
                name: "EX_PermissionTypes");

            migrationBuilder.DropIndex(
                name: "IX_Sec_UsersFunctions_SecUserUserId",
                table: "Sec_UsersFunctions");

            migrationBuilder.DropIndex(
                name: "IX_Sec_UsersForms_SecUserUserId",
                table: "Sec_UsersForms");

            migrationBuilder.DropIndex(
                name: "IX_Sec_Users_PermissionTypeId",
                table: "Sec_Users");

            migrationBuilder.DropColumn(
                name: "SecUserUserId",
                table: "Sec_UsersFunctions");

            migrationBuilder.DropColumn(
                name: "SecUserUserId",
                table: "Sec_UsersForms");

            migrationBuilder.DropColumn(
                name: "PermissionTypeId",
                table: "Sec_Users");

            migrationBuilder.RenameColumn(
                name: "PermissionTypeId",
                table: "Sec_UsersFunctions",
                newName: "UserID");

            migrationBuilder.RenameColumn(
                name: "PermissionTypeId",
                table: "Sec_UsersForms",
                newName: "UserID");

            migrationBuilder.AlterColumn<int>(
                name: "UserID",
                table: "Sec_Users",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int")
                .Annotation("Relational:ColumnOrder", 0);

            migrationBuilder.CreateTable(
                name: "Permission",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Desc = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
                    Name = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Permission", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Role",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CreateUser = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreateUserName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DeleteUserId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsAdmin = table.Column<bool>(type: "bit", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NormalizedName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UpdateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    UpdateUser = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UpdateUserName = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Role", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "User",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    AccessFailedCount = table.Column<int>(type: "int", nullable: false),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CreateUser = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreateUserName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DeleteUserId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    EmailConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    FullName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    JobId = table.Column<long>(type: "bigint", nullable: true),
                    LockoutEnabled = table.Column<bool>(type: "bit", nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: true),
                    NormalizedEmail = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NormalizedUserName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PasswordHash = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    ResturantId = table.Column<long>(type: "bigint", nullable: true),
                    SecurityStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TwoFactorEnabled = table.Column<bool>(type: "bit", nullable: false),
                    Type = table.Column<int>(type: "int", nullable: true),
                    TypeId = table.Column<long>(type: "bigint", nullable: true),
                    UpdateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    UpdateUser = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UpdateUserName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserName = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_User", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "RolePermission",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PermissionId = table.Column<long>(type: "bigint", nullable: false),
                    RoleId = table.Column<string>(type: "nvarchar(450)", nullable: true),
                    PermissionName = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RolePermission", x => x.Id);
                    table.ForeignKey(
                        name: "FK_RolePermission_Permission_PermissionId",
                        column: x => x.PermissionId,
                        principalTable: "Permission",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_RolePermission_Role_RoleId",
                        column: x => x.RoleId,
                        principalTable: "Role",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "RoleUser",
                columns: table => new
                {
                    RolesId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    UsersId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RoleUser", x => new { x.RolesId, x.UsersId });
                    table.ForeignKey(
                        name: "FK_RoleUser_Role_RolesId",
                        column: x => x.RolesId,
                        principalTable: "Role",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_RoleUser_User_UsersId",
                        column: x => x.UsersId,
                        principalTable: "User",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_RolePermission_PermissionId",
                table: "RolePermission",
                column: "PermissionId");

            migrationBuilder.CreateIndex(
                name: "IX_RolePermission_RoleId",
                table: "RolePermission",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "IX_RoleUser_UsersId",
                table: "RoleUser",
                column: "UsersId");

            migrationBuilder.AddForeignKey(
                name: "FK_Sec_UsersForms_Sec_Users",
                table: "Sec_UsersForms",
                column: "UserID",
                principalTable: "Sec_Users",
                principalColumn: "UserID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Sec_UsersFunctions_Sec_Users",
                table: "Sec_UsersFunctions",
                column: "UserID",
                principalTable: "Sec_Users",
                principalColumn: "UserID",
                onDelete: ReferentialAction.Cascade);
        }
    }
}

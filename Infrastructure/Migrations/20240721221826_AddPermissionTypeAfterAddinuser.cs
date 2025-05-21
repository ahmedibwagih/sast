using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddPermissionTypeAfterAddinuser : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql(@"INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(1,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(2,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(3,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(4,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(5,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(6,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(7,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(8,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(9,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(10,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(11,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(12,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(13,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(14,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(15,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(16,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(17,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(18,'1','1')
            INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(19,'1','1')
            INSERT INTO[dbo].[EX_PermissionTypes] ([PermissionTypeId], [PermissionTypeNameEn], [PermissionTypeNameAr]) VALUES(20, '1', '1')
INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(21,'1','1')
INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(22,'1','1')
INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(23,'1','1')
INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(24,'1','1')
INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(25,'1','1')
INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(26,'1','1')
INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(27,'1','1')
INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(28,'1','1')
INSERT INTO [dbo].[EX_PermissionTypes]([PermissionTypeId],[PermissionTypeNameEn],[PermissionTypeNameAr] ) VALUES(29,'1','1')


            update [EX_PermissionTypes] set [PermissionTypeNameEn] = 'صلاحيه'+ CONVERT(nvarchar(50),[PermissionTypeId])

 update [EX_PermissionTypes] set [PermissionTypeNamear] = 'صلاحيه'+ CONVERT(nvarchar(50),[PermissionTypeId])", true);
            migrationBuilder.AddForeignKey(
               name: "FK_Sec_Users_PermissionTypes",
               table: "Sec_Users",
               column: "PermissionTypeId",
               principalTable: "EX_PermissionTypes",
               principalColumn: "PermissionTypeId");

            migrationBuilder.AddForeignKey(
                name: "FK_Sec_UsersForms_Sec_Users11",
                table: "Sec_UsersForms",
                column: "PermissionTypeId",
                principalTable: "EX_PermissionTypes",
                principalColumn: "PermissionTypeId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Sec_UsersForms_Sec_Users1121_SecUserUserId",
                table: "Sec_UsersForms",
                column: "SecUserUserId",
                principalTable: "Sec_Users",
                principalColumn: "UserID");

            migrationBuilder.AddForeignKey(
                name: "FK_Sec_UsersFunctions_Sec1112_Users",
                table: "Sec_UsersFunctions",
                column: "PermissionTypeId",
                principalTable: "EX_PermissionTypes",
                principalColumn: "PermissionTypeId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Sec_UsersFunctions_Sec_Users21321_SecUserUserId",
                table: "Sec_UsersFunctions",
                column: "SecUserUserId",
                principalTable: "Sec_Users",
                principalColumn: "UserID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
          name: "FK_Sec_Users_PermissionTypes",
          table: "Sec_Users");

            migrationBuilder.DropForeignKey(
                name: "FK_Sec_UsersForms_Sec_Users",
                table: "Sec_UsersForms");

            migrationBuilder.DropForeignKey(
                name: "FK_Sec_UsersForms_Sec_Users_SecUserUserId",
                table: "Sec_UsersForms");

            migrationBuilder.DropForeignKey(
                name: "FK_Sec_UsersFunctions_Sec_Users",
                table: "Sec_UsersFunctions");

            migrationBuilder.DropForeignKey(
                name: "FK_Sec_UsersFunctions_Sec_Users_SecUserUserId",
                table: "Sec_UsersFunctions");
        }
    }
}

using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addPermissionTypeBranch : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "SecPermissionTypeBranches",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PermissionTypeId = table.Column<int>(type: "int", nullable: false),
                    BranchId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SecPermissionTypeBranches", x => x.ID);
                    table.ForeignKey(
                        name: "FK_SecPermissionTypeBranches_EX_Branches_BranchId",
                        column: x => x.BranchId,
                        principalTable: "EX_Branches",
                        principalColumn: "BranchID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SecPermissionTypeBranches_SecPermissionType_PermissionTypeId",
                        column: x => x.PermissionTypeId,
                        principalTable: "SecPermissionType",
                        principalColumn: "PermissionTypeId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_SecPermissionTypeBranches_BranchId",
                table: "SecPermissionTypeBranches",
                column: "BranchId");

            migrationBuilder.CreateIndex(
                name: "IX_SecPermissionTypeBranches_PermissionTypeId",
                table: "SecPermissionTypeBranches",
                column: "PermissionTypeId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SecPermissionTypeBranches");
        }
    }
}

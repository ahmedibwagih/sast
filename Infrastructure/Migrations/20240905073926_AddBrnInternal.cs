using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddBrnInternal : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "BranchID",
                table: "EX_InternalTransfers",
                type: "int",
                nullable: true,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_EX_InternalTransfers_BranchID",
                table: "EX_InternalTransfers",
                column: "BranchID");

            migrationBuilder.AddForeignKey(
                name: "FK_EX_InternalTransfers_EX_Branches_BranchID",
                table: "EX_InternalTransfers",
                column: "BranchID",
                principalTable: "EX_Branches",
                principalColumn: "BranchID",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_EX_InternalTransfers_EX_Branches_BranchID",
                table: "EX_InternalTransfers");

            migrationBuilder.DropIndex(
                name: "IX_EX_InternalTransfers_BranchID",
                table: "EX_InternalTransfers");

            migrationBuilder.DropColumn(
                name: "BranchID",
                table: "EX_InternalTransfers");
        }
    }
}

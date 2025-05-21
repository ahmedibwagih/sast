using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class eddhhit2t : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_WFListOfApprovals_Sec_Users_UserId",
                table: "WFListOfApprovals");

            migrationBuilder.DropIndex(
                name: "IX_WFListOfApprovals_UserId",
                table: "WFListOfApprovals");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_WFListOfApprovals_UserId",
                table: "WFListOfApprovals",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_WFListOfApprovals_Sec_Users_UserId",
                table: "WFListOfApprovals",
                column: "UserId",
                principalTable: "Sec_Users",
                principalColumn: "UserID");
        }
    }
}

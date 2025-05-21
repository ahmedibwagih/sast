using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class edit1236 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "CostCenterId",
                table: "A_JVsDetails",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_A_JVsDetails_CostCenterId",
                table: "A_JVsDetails",
                column: "CostCenterId");

            migrationBuilder.AddForeignKey(
                name: "FK_A_JVsDetails_ACostCenter_CostCenterId",
                table: "A_JVsDetails",
                column: "CostCenterId",
                principalTable: "ACostCenter",
                principalColumn: "CostCenterId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_A_JVsDetails_ACostCenter_CostCenterId",
                table: "A_JVsDetails");

            migrationBuilder.DropIndex(
                name: "IX_A_JVsDetails_CostCenterId",
                table: "A_JVsDetails");

            migrationBuilder.DropColumn(
                name: "CostCenterId",
                table: "A_JVsDetails");
        }
    }
}

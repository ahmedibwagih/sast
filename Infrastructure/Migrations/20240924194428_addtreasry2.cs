using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addtreasry2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "TreasuryId",
                table: "Currencies",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Currencies_TreasuryId",
                table: "Currencies",
                column: "TreasuryId");

            migrationBuilder.AddForeignKey(
                name: "FK_Currencies_Treasury_TreasuryId",
                table: "Currencies",
                column: "TreasuryId",
                principalTable: "Treasury",
                principalColumn: "TreasuryId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Currencies_Treasury_TreasuryId",
                table: "Currencies");

            migrationBuilder.DropIndex(
                name: "IX_Currencies_TreasuryId",
                table: "Currencies");

            migrationBuilder.DropColumn(
                name: "TreasuryId",
                table: "Currencies");
        }
    }
}

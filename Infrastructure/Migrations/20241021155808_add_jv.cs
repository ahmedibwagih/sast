using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class add_jv : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "TaswyaTransferId",
                table: "A_JVs",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "TreasuryTransferId",
                table: "A_JVs",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_A_JVs_TaswyaTransferId",
                table: "A_JVs",
                column: "TaswyaTransferId");

            migrationBuilder.CreateIndex(
                name: "IX_A_JVs_TreasuryTransferId",
                table: "A_JVs",
                column: "TreasuryTransferId");

            migrationBuilder.AddForeignKey(
                name: "FK_A_JVs_ExTaswya_TaswyaTransferId",
                table: "A_JVs",
                column: "TaswyaTransferId",
                principalTable: "ExTaswya",
                principalColumn: "TransferId");

            migrationBuilder.AddForeignKey(
                name: "FK_A_JVs_ExTreasuryTransfere_TreasuryTransferId",
                table: "A_JVs",
                column: "TreasuryTransferId",
                principalTable: "ExTreasuryTransfere",
                principalColumn: "TransferId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_A_JVs_ExTaswya_TaswyaTransferId",
                table: "A_JVs");

            migrationBuilder.DropForeignKey(
                name: "FK_A_JVs_ExTreasuryTransfere_TreasuryTransferId",
                table: "A_JVs");

            migrationBuilder.DropIndex(
                name: "IX_A_JVs_TaswyaTransferId",
                table: "A_JVs");

            migrationBuilder.DropIndex(
                name: "IX_A_JVs_TreasuryTransferId",
                table: "A_JVs");

            migrationBuilder.DropColumn(
                name: "TaswyaTransferId",
                table: "A_JVs");

            migrationBuilder.DropColumn(
                name: "TreasuryTransferId",
                table: "A_JVs");
        }
    }
}

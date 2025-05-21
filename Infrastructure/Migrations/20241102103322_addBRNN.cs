using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addBRNN : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "BranchID",
                table: "A_JVs",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "BranchID",
                table: "A_CashFlow",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_A_JVs_BranchID",
                table: "A_JVs",
                column: "BranchID");

            migrationBuilder.CreateIndex(
                name: "IX_A_CashFlow_BranchID",
                table: "A_CashFlow",
                column: "BranchID");

            migrationBuilder.AddForeignKey(
                name: "FK_A_CashFlow_EX_Branches_BranchID",
                table: "A_CashFlow",
                column: "BranchID",
                principalTable: "EX_Branches",
                principalColumn: "BranchID");

            migrationBuilder.AddForeignKey(
                name: "FK_A_JVs_EX_Branches_BranchID",
                table: "A_JVs",
                column: "BranchID",
                principalTable: "EX_Branches",
                principalColumn: "BranchID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_A_CashFlow_EX_Branches_BranchID",
                table: "A_CashFlow");

            migrationBuilder.DropForeignKey(
                name: "FK_A_JVs_EX_Branches_BranchID",
                table: "A_JVs");

            migrationBuilder.DropIndex(
                name: "IX_A_JVs_BranchID",
                table: "A_JVs");

            migrationBuilder.DropIndex(
                name: "IX_A_CashFlow_BranchID",
                table: "A_CashFlow");

            migrationBuilder.DropColumn(
                name: "BranchID",
                table: "A_JVs");

            migrationBuilder.DropColumn(
                name: "BranchID",
                table: "A_CashFlow");
        }
    }
}

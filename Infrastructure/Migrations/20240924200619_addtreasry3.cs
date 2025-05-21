using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addtreasry3 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "TreasuryId",
                table: "EX_WholeInvoices",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "TreasuryId",
                table: "EX_Invoices",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "TreasuryId",
                table: "EX_InternalTransfers",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_EX_WholeInvoices_TreasuryId",
                table: "EX_WholeInvoices",
                column: "TreasuryId");

            migrationBuilder.CreateIndex(
                name: "IX_EX_Invoices_TreasuryId",
                table: "EX_Invoices",
                column: "TreasuryId");

            migrationBuilder.CreateIndex(
                name: "IX_EX_InternalTransfers_TreasuryId",
                table: "EX_InternalTransfers",
                column: "TreasuryId");

            migrationBuilder.AddForeignKey(
                name: "FK_EX_InternalTransfers_Treasury_TreasuryId",
                table: "EX_InternalTransfers",
                column: "TreasuryId",
                principalTable: "Treasury",
                principalColumn: "TreasuryId");

            migrationBuilder.AddForeignKey(
                name: "FK_EX_Invoices_Treasury_TreasuryId",
                table: "EX_Invoices",
                column: "TreasuryId",
                principalTable: "Treasury",
                principalColumn: "TreasuryId");

            migrationBuilder.AddForeignKey(
                name: "FK_EX_WholeInvoices_Treasury_TreasuryId",
                table: "EX_WholeInvoices",
                column: "TreasuryId",
                principalTable: "Treasury",
                principalColumn: "TreasuryId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_EX_InternalTransfers_Treasury_TreasuryId",
                table: "EX_InternalTransfers");

            migrationBuilder.DropForeignKey(
                name: "FK_EX_Invoices_Treasury_TreasuryId",
                table: "EX_Invoices");

            migrationBuilder.DropForeignKey(
                name: "FK_EX_WholeInvoices_Treasury_TreasuryId",
                table: "EX_WholeInvoices");

            migrationBuilder.DropIndex(
                name: "IX_EX_WholeInvoices_TreasuryId",
                table: "EX_WholeInvoices");

            migrationBuilder.DropIndex(
                name: "IX_EX_Invoices_TreasuryId",
                table: "EX_Invoices");

            migrationBuilder.DropIndex(
                name: "IX_EX_InternalTransfers_TreasuryId",
                table: "EX_InternalTransfers");

            migrationBuilder.DropColumn(
                name: "TreasuryId",
                table: "EX_WholeInvoices");

            migrationBuilder.DropColumn(
                name: "TreasuryId",
                table: "EX_Invoices");

            migrationBuilder.DropColumn(
                name: "TreasuryId",
                table: "EX_InternalTransfers");
        }
    }
}

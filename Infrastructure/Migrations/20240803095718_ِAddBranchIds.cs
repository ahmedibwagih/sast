using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class _ِAddBranchIds : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "BranchID",
                table: "EX_WholeInvoices",
                type: "int",
                nullable: true,
                defaultValue: 1);

            migrationBuilder.AddColumn<int>(
                name: "BranchID",
                table: "EX_Invoices",
                type: "int",
                nullable: true,
                defaultValue: 1);

            migrationBuilder.AddColumn<int>(
                name: "BranchID1",
                table: "EX_BranchTransfers",
                type: "int",
                nullable: true,
                defaultValue: 1);

            migrationBuilder.AddColumn<int>(
                name: "BranchID",
                table: "Currencies",
                type: "int",
                nullable: true,
                defaultValue: 1);

            //migrationBuilder.CreateIndex(
            //    name: "IX_EX_WholeInvoices_BranchID",
            //    table: "EX_WholeInvoices",
            //    column: "BranchID");

            //migrationBuilder.CreateIndex(
            //    name: "IX_EX_Invoices_BranchI",
            //    table: "EX_Invoices",
            //    column: "BranchID");

            //migrationBuilder.CreateIndex(
            //    name: "IX_EX_BranchTransfers_BranchID1",
            //    table: "EX_BranchTransfers",
            //    column: "BranchID1");

            //migrationBuilder.CreateIndex(
            //    name: "IX_Currencies_BranchID",
            //    table: "Currencies",
            //    column: "BranchID");

            migrationBuilder.AddForeignKey(
                name: "FK_Currencies_EX_Branches_BranchID",
                table: "Currencies",
                column: "BranchID",
                principalTable: "EX_Branches",
                principalColumn: "BranchID",
                onDelete: ReferentialAction.NoAction);

            migrationBuilder.AddForeignKey(
                name: "FK_EX_BranchTransfers_EX_Branches_BranchID1",
                table: "EX_BranchTransfers",
                column: "BranchID1",
                principalTable: "EX_Branches",
                principalColumn: "BranchID",
                onDelete: ReferentialAction.NoAction);

            migrationBuilder.AddForeignKey(
                name: "FK_EX_Invoices_EX_Branches_BranchID",
                table: "EX_Invoices",
                column: "BranchID",
                principalTable: "EX_Branches",
                principalColumn: "BranchID",
                onDelete: ReferentialAction.NoAction);

            migrationBuilder.AddForeignKey(
                name: "FK_EX_WholeInvoices_EX_Branches_BranchID",
                table: "EX_WholeInvoices",
                column: "BranchID",
                principalTable: "EX_Branches",
                principalColumn: "BranchID",
                onDelete: ReferentialAction.NoAction);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Currencies_EX_Branches_BranchID",
                table: "Currencies");

            migrationBuilder.DropForeignKey(
                name: "FK_EX_BranchTransfers_EX_Branches_BranchID1",
                table: "EX_BranchTransfers");

            migrationBuilder.DropForeignKey(
                name: "FK_EX_Invoices_EX_Branches_BranchID",
                table: "EX_Invoices");

            migrationBuilder.DropForeignKey(
                name: "FK_EX_WholeInvoices_EX_Branches_BranchID",
                table: "EX_WholeInvoices");

            //migrationBuilder.DropIndex(
            //    name: "IX_EX_WholeInvoices_BranchID",
            //    table: "EX_WholeInvoices");

            //migrationBuilder.DropIndex(
            //    name: "IX_EX_Invoices_BranchI",
            //    table: "EX_Invoices");

            //migrationBuilder.DropIndex(
            //    name: "IX_EX_BranchTransfers_BranchID1",
            //    table: "EX_BranchTransfers");

            //migrationBuilder.DropIndex(
            //    name: "IX_Currencies_BranchID",
            //    table: "Currencies");

            migrationBuilder.DropColumn(
                name: "BranchID",
                table: "EX_WholeInvoices");

            migrationBuilder.DropColumn(
                name: "BranchID",
                table: "EX_Invoices");

            migrationBuilder.DropColumn(
                name: "BranchID1",
                table: "EX_BranchTransfers");

            migrationBuilder.DropColumn(
                name: "BranchID",
                table: "Currencies");
        }
    }
}

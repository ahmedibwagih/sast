using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class RemoveCashier : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_EX_BranchTransfers_EX_Cashiers",
                table: "EX_BranchTransfers");

            migrationBuilder.DropForeignKey(
                name: "FK_EX_InternalTransfers_EX_Cashiers",
                table: "EX_InternalTransfers");

            migrationBuilder.DropForeignKey(
                name: "FK_EX_Invoices_EX_Cashiers",
                table: "EX_Invoices");

            migrationBuilder.DropForeignKey(
                name: "FK_EX_WholeInvoices_EX_Cashiers",
                table: "EX_WholeInvoices");

            migrationBuilder.DropTable(
                name: "EX_Cashiers");

            //migrationBuilder.DropIndex(
            //    name: "IX_EX_WholeInvoices_CashierID",
            //    table: "EX_WholeInvoices");

            //migrationBuilder.DropIndex(
            //    name: "IX_EX_Invoices_CashierID",
            //    table: "EX_Invoices");

            //migrationBuilder.DropIndex(
            //    name: "IX_EX_InternalTransfers_CashierID",
            //    table: "EX_InternalTransfers");

            //migrationBuilder.DropIndex(
            //    name: "IX_EX_BranchTransfers_CashierID",
            //    table: "EX_BranchTransfers");

            migrationBuilder.DropColumn(
                name: "CashierID",
                table: "EX_WholeInvoices");

            migrationBuilder.DropColumn(
                name: "CashierID",
                table: "EX_Invoices");

            migrationBuilder.DropColumn(
                name: "CashierID",
                table: "EX_InternalTransfers");

            migrationBuilder.DropColumn(
                name: "CashierID",
                table: "EX_BranchTransfers");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "CashierID",
                table: "EX_WholeInvoices",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "CashierID",
                table: "EX_Invoices",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "CashierID",
                table: "EX_InternalTransfers",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "CashierID",
                table: "EX_BranchTransfers",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "EX_Cashiers",
                columns: table => new
                {
                    CashierID = table.Column<int>(type: "int", nullable: false),
                    BranchID = table.Column<int>(type: "int", nullable: true),
                    CashierNameAr = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    CashierNameEn = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EX_Cashiers", x => x.CashierID);
                });

            //migrationBuilder.CreateIndex(
            //    name: "IX_EX_WholeInvoices_CashierID",
            //    table: "EX_WholeInvoices",
            //    column: "CashierID");

            //migrationBuilder.CreateIndex(
            //    name: "IX_EX_Invoices_CashierID",
            //    table: "EX_Invoices",
            //    column: "CashierID");

            //migrationBuilder.CreateIndex(
            //    name: "IX_EX_InternalTransfers_CashierID",
            //    table: "EX_InternalTransfers",
            //    column: "CashierID");

            //migrationBuilder.CreateIndex(
            //    name: "IX_EX_BranchTransfers_CashierID",
            //    table: "EX_BranchTransfers",
            //    column: "CashierID");

            migrationBuilder.AddForeignKey(
                name: "FK_EX_BranchTransfers_EX_Cashiers",
                table: "EX_BranchTransfers",
                column: "CashierID",
                principalTable: "EX_Cashiers",
                principalColumn: "CashierID");

            migrationBuilder.AddForeignKey(
                name: "FK_EX_InternalTransfers_EX_Cashiers",
                table: "EX_InternalTransfers",
                column: "CashierID",
                principalTable: "EX_Cashiers",
                principalColumn: "CashierID");

            migrationBuilder.AddForeignKey(
                name: "FK_EX_Invoices_EX_Cashiers",
                table: "EX_Invoices",
                column: "CashierID",
                principalTable: "EX_Cashiers",
                principalColumn: "CashierID");

            migrationBuilder.AddForeignKey(
                name: "FK_EX_WholeInvoices_EX_Cashiers",
                table: "EX_WholeInvoices",
                column: "CashierID",
                principalTable: "EX_Cashiers",
                principalColumn: "CashierID");
        }
    }
}

using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddMultipaid : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "PaidCash",
                table: "EX_WholeInvoices",
                type: "decimal(18,2)",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "PaidCheck",
                table: "EX_WholeInvoices",
                type: "decimal(18,2)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PaidCheckNo",
                table: "EX_WholeInvoices",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "PaidUnderAccount",
                table: "EX_WholeInvoices",
                type: "decimal(18,2)",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "PaidCash",
                table: "EX_Invoices",
                type: "decimal(18,2)",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "PaidCheck",
                table: "EX_Invoices",
                type: "decimal(18,2)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PaidCheckNo",
                table: "EX_Invoices",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "PaidUnderAccount",
                table: "EX_Invoices",
                type: "decimal(18,2)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PaidCash",
                table: "EX_WholeInvoices");

            migrationBuilder.DropColumn(
                name: "PaidCheck",
                table: "EX_WholeInvoices");

            migrationBuilder.DropColumn(
                name: "PaidCheckNo",
                table: "EX_WholeInvoices");

            migrationBuilder.DropColumn(
                name: "PaidUnderAccount",
                table: "EX_WholeInvoices");

            migrationBuilder.DropColumn(
                name: "PaidCash",
                table: "EX_Invoices");

            migrationBuilder.DropColumn(
                name: "PaidCheck",
                table: "EX_Invoices");

            migrationBuilder.DropColumn(
                name: "PaidCheckNo",
                table: "EX_Invoices");

            migrationBuilder.DropColumn(
                name: "PaidUnderAccount",
                table: "EX_Invoices");
        }
    }
}

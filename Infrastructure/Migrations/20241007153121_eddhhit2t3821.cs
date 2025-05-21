using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class eddhhit2t3821 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "IsPendingWorkflow",
                table: "EX_WholeInvoices",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsPendingWorkflow",
                table: "EX_Invoices",
                type: "bit",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsPendingWorkflow",
                table: "EX_WholeInvoices");

            migrationBuilder.DropColumn(
                name: "IsPendingWorkflow",
                table: "EX_Invoices");
        }
    }
}

using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class eddi55tt : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<long>(
                name: "BanksTransfereId",
                table: "A_JVs",
                type: "bigint",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "BanksTreasuryTransfereId",
                table: "A_JVs",
                type: "bigint",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "BanksTransfereId",
                table: "A_JVs");

            migrationBuilder.DropColumn(
                name: "BanksTreasuryTransfereId",
                table: "A_JVs");
        }
    }
}

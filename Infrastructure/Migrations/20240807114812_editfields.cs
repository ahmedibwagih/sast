using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class editfields : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AccountNumber",
                table: "EX_Clients");

            migrationBuilder.DropColumn(
                name: "Creditlimit",
                table: "EX_Clients");

            migrationBuilder.DropColumn(
                name: "CurrencyExRate",
                table: "EX_Clients");

            migrationBuilder.DropColumn(
                name: "CurrencyId",
                table: "EX_Clients");

            migrationBuilder.DropColumn(
                name: "Email",
                table: "EX_Clients");

            migrationBuilder.DropColumn(
                name: "Fax",
                table: "EX_Clients");

            migrationBuilder.DropColumn(
                name: "LicenseExpirateDate",
                table: "EX_Clients");

            migrationBuilder.DropColumn(
                name: "LicenseNumber",
                table: "EX_Clients");

            migrationBuilder.DropColumn(
                name: "wholesaleClientTyp",
                table: "EX_Clients");

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "EX_Suppliers",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "EX_Suppliers");

            migrationBuilder.AddColumn<string>(
                name: "AccountNumber",
                table: "EX_Clients",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Creditlimit",
                table: "EX_Clients",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "CurrencyExRate",
                table: "EX_Clients",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<int>(
                name: "CurrencyId",
                table: "EX_Clients",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "EX_Clients",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Fax",
                table: "EX_Clients",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "LicenseExpirateDate",
                table: "EX_Clients",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "LicenseNumber",
                table: "EX_Clients",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "wholesaleClientTyp",
                table: "EX_Clients",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }
    }
}

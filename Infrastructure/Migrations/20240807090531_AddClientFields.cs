using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddClientFields : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CRExpiryDate",
                table: "EX_Clients");

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

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AccountNumber",
                table: "EX_Clients");

            migrationBuilder.DropColumn(
                name: "Creditlimit",
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

            migrationBuilder.AddColumn<string>(
                name: "CRExpiryDate",
                table: "EX_Clients",
                type: "nvarchar(10)",
                maxLength: 10,
                nullable: true);
        }
    }
}

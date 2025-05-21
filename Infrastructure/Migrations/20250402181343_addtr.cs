using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addtr : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "OutLimit",
                table: "EX_Countries",
                type: "decimal(18,2)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ClientSectorId",
                table: "EX_ClientJob",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CountryId",
                table: "CurrencyBase",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_EX_ClientJob_ClientSectorId",
                table: "EX_ClientJob",
                column: "ClientSectorId");

            migrationBuilder.CreateIndex(
                name: "IX_CurrencyBase_CountryId",
                table: "CurrencyBase",
                column: "CountryId");

            migrationBuilder.AddForeignKey(
                name: "FK_CurrencyBase_EX_Countries_CountryId",
                table: "CurrencyBase",
                column: "CountryId",
                principalTable: "EX_Countries",
                principalColumn: "CountryID");

            migrationBuilder.AddForeignKey(
                name: "FK_EX_ClientJob_ExClientSectors_ClientSectorId",
                table: "EX_ClientJob",
                column: "ClientSectorId",
                principalTable: "ExClientSectors",
                principalColumn: "ClientSectorId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CurrencyBase_EX_Countries_CountryId",
                table: "CurrencyBase");

            migrationBuilder.DropForeignKey(
                name: "FK_EX_ClientJob_ExClientSectors_ClientSectorId",
                table: "EX_ClientJob");

            migrationBuilder.DropIndex(
                name: "IX_EX_ClientJob_ClientSectorId",
                table: "EX_ClientJob");

            migrationBuilder.DropIndex(
                name: "IX_CurrencyBase_CountryId",
                table: "CurrencyBase");

            migrationBuilder.DropColumn(
                name: "OutLimit",
                table: "EX_Countries");

            migrationBuilder.DropColumn(
                name: "ClientSectorId",
                table: "EX_ClientJob");

            migrationBuilder.DropColumn(
                name: "CountryId",
                table: "CurrencyBase");
        }
    }
}

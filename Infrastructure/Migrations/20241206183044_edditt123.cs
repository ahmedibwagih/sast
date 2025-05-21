using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class edditt123 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ClientSectorId",
                table: "EX_Clients",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "ExClientSectors",
                columns: table => new
                {
                    ClientSectorId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ClientSectorNameEn = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClientSectorNameAr = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Desc = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ExClientSectors", x => x.ClientSectorId);
                });

            migrationBuilder.CreateIndex(
                name: "IX_EX_Clients_ClientSectorId",
                table: "EX_Clients",
                column: "ClientSectorId");

            migrationBuilder.AddForeignKey(
                name: "FK_EX_Clients_ExClientSectors_ClientSectorId",
                table: "EX_Clients",
                column: "ClientSectorId",
                principalTable: "ExClientSectors",
                principalColumn: "ClientSectorId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_EX_Clients_ExClientSectors_ClientSectorId",
                table: "EX_Clients");

            migrationBuilder.DropTable(
                name: "ExClientSectors");

            migrationBuilder.DropIndex(
                name: "IX_EX_Clients_ClientSectorId",
                table: "EX_Clients");

            migrationBuilder.DropColumn(
                name: "ClientSectorId",
                table: "EX_Clients");
        }
    }
}

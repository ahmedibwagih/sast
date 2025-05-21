using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddClientNotes : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.DropIndex(
            //    name: "UQ_EX_Currencies_Code",
            //    table: "Currencies");

            //migrationBuilder.DropIndex(
            //    name: "UQ_Ex_Currencies_NameAr",
            //    table: "Currencies");

            //migrationBuilder.DropIndex(
            //    name: "UQ_Ex_Currencies_NameEn",
            //    table: "Currencies");

            migrationBuilder.CreateTable(
                name: "ExClientsNote",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ClientId = table.Column<int>(type: "int", nullable: false),
                    NoteType = table.Column<int>(type: "int", nullable: false),
                    Desc = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ExClientsNote", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ExClientsNote_EX_Clients_ClientId",
                        column: x => x.ClientId,
                        principalTable: "EX_Clients",
                        principalColumn: "ClientId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ExClientsNote_ClientId",
                table: "ExClientsNote",
                column: "ClientId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ExClientsNote");

            migrationBuilder.CreateIndex(
                name: "UQ_EX_Currencies_Code",
                table: "Currencies",
                column: "CurrencyCode",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "UQ_Ex_Currencies_NameAr",
                table: "Currencies",
                column: "CurrencyNameAr",
                unique: true,
                filter: "[CurrencyNameAr] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "UQ_Ex_Currencies_NameEn",
                table: "Currencies",
                column: "CurrencyNameEn",
                unique: true,
                filter: "[CurrencyNameEn] IS NOT NULL");
        }
    }
}

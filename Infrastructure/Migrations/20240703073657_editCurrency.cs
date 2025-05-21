using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class editCurrency : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.DropTable(
            //    name: "CurrenciesMains");

            migrationBuilder.AddColumn<bool>(
                name: "IsDefault",
                table: "Currencies",
                type: "bit",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsDefault",
                table: "Currencies");

            //migrationBuilder.CreateTable(
            //    name: "CurrenciesMains",
            //    columns: table => new
            //    {
            //        Id = table.Column<long>(type: "bigint", nullable: false)
            //            .Annotation("SqlServer:Identity", "1, 1"),
            //        CountryId = table.Column<int>(type: "int", nullable: false),
            //        CurrCode = table.Column<string>(type: "nvarchar(max)", nullable: true),
            //        IsActve = table.Column<int>(type: "int", nullable: false, defaultValue: 1),
            //        IsDefault = table.Column<bool>(type: "bit", nullable: true),
            //        NameAr = table.Column<string>(type: "nvarchar(max)", nullable: true),
            //        NameEn = table.Column<string>(type: "nvarchar(max)", nullable: true),
            //        RiskRate = table.Column<int>(type: "int", nullable: false)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK_CurrenciesMains", x => x.Id);
            //        table.ForeignKey(
            //            name: "FK_CurrenciesMains_EX_Countries_CountryId",
            //            column: x => x.CountryId,
            //            principalTable: "EX_Countries",
            //            principalColumn: "CountryID",
            //            onDelete: ReferentialAction.Cascade);
            //    });

            //migrationBuilder.CreateIndex(
            //    name: "IX_CurrenciesMains_CountryId",
            //    table: "CurrenciesMains",
            //    column: "CountryId");
        }
    }
}

using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class editcountry : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.DropForeignKey(
            //    name: "FK_Currencies_Countries_CountryId",
            //    table: "CurrenciesMain");

            //migrationBuilder.DropForeignKey(
            //    name: "FK_IdentitySources_Countries_CountryId",
            //    table: "IdentitySources");

            //migrationBuilder.DropTable(
            //    name: "Countries");

            //migrationBuilder.AlterColumn<int>(
            //    name: "CountryId",
            //    table: "IdentitySources",
            //    type: "int",
            //    nullable: false,
            //    oldClrType: typeof(long),
            //    oldType: "bigint");

            migrationBuilder.AddColumn<int>(
                name: "IsActve",
                table: "EX_Countries",
                type: "int",
                nullable: false,
                defaultValue: 1);

            //migrationBuilder.AlterColumn<int>(
            //    name: "CountryId",
            //    table: "CurrenciesMain",
            //    type: "int",
            //    nullable: false,
            //    oldClrType: typeof(long),
            //    oldType: "bigint");

            //migrationBuilder.AddForeignKey(
            //    name: "FK_CurrenciesMains_EX_Countries_CountryId",
            //    table: "CurrenciesMain",
            //    column: "CountryId",
            //    principalTable: "EX_Countries",
            //    principalColumn: "CountryID",
            //    onDelete: ReferentialAction.Cascade);

            //migrationBuilder.AddForeignKey(
            //    name: "FK_IdentitySources_EX_Countries_CountryId",
            //    table: "IdentitySources",
            //    column: "CountryId",
            //    principalTable: "EX_Countries",
            //    principalColumn: "CountryID",
            //    onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.DropForeignKey(
            //    name: "FK_CurrenciesMains_EX_Countries_CountryId",
            //    table: "CurrenciesMain");

            //migrationBuilder.DropForeignKey(
            //    name: "FK_IdentitySources_EX_Countries_CountryId",
            //    table: "IdentitySources");

            migrationBuilder.DropColumn(
                name: "IsActve",
                table: "EX_Countries");

            //migrationBuilder.AlterColumn<long>(
            //    name: "CountryId",
            //    table: "IdentitySources",
            //    type: "bigint",
            //    nullable: false,
            //    oldClrType: typeof(int),
            //    oldType: "int");

            //migrationBuilder.AlterColumn<long>(
            //    name: "CountryId",
            //    table: "CurrenciesMain",
            //    type: "bigint",
            //    nullable: false,
            //    oldClrType: typeof(int),
            //    oldType: "int");

            //migrationBuilder.CreateTable(
            //    name: "Countries",
            //    columns: table => new
            //    {
            //        Id = table.Column<long>(type: "bigint", nullable: false)
            //            .Annotation("SqlServer:Identity", "1, 1"),
            //        IsActve = table.Column<int>(type: "int", nullable: false, defaultValue: 1),
            //        NameAr = table.Column<string>(type: "nvarchar(max)", nullable: true),
            //        NameEn = table.Column<string>(type: "nvarchar(max)", nullable: true),
            //        RiskRate = table.Column<int>(type: "int", nullable: false)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK_Countries", x => x.Id);
            //    });

            //migrationBuilder.AddForeignKey(
            //    name: "FK_Currencies_Countries_CountryId",
            //    table: "CurrenciesMain",
            //    column: "CountryId",
            //    principalTable: "Countries",
            //    principalColumn: "Id",
            //    onDelete: ReferentialAction.Cascade);

            //migrationBuilder.AddForeignKey(
            //    name: "FK_IdentitySources_Countries_CountryId",
            //    table: "IdentitySources",
            //    column: "CountryId",
            //    principalTable: "Countries",
            //    principalColumn: "Id",
            //    onDelete: ReferentialAction.Cascade);
        }
    }
}

using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class edditt_1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.DropForeignKey(
            //    name: "FK_EX_Suppliers_EX_Currencies",
            //    table: "EX_Suppliers");

            //migrationBuilder.AddForeignKey(
            //    name: "FK_EX_Suppliers_Currencies_CurrencyID",
            //    table: "EX_Suppliers",
            //    column: "CurrencyID",
            //    principalTable: "Currencies",
            //    principalColumn: "CurrencyID",
            //    onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.DropForeignKey(
            //    name: "FK_EX_Suppliers_Currencies_CurrencyID",
            //    table: "EX_Suppliers");

            //migrationBuilder.AddForeignKey(
            //    name: "FK_EX_Suppliers_EX_Currencies",
            //    table: "EX_Suppliers",
            //    column: "CurrencyID",
            //    principalTable: "Currencies",
            //    principalColumn: "CurrencyID");
        }
    }
}

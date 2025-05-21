using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class edd : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Currencies_Treasury_TreasuryId",
                table: "Currencies");

            migrationBuilder.AlterColumn<int>(
                name: "TreasuryId",
                table: "Currencies",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "OpenningBalanceDate",
                table: "Currencies",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Currencies_Treasury_TreasuryId",
                table: "Currencies",
                column: "TreasuryId",
                principalTable: "Treasury",
                principalColumn: "TreasuryId",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Currencies_Treasury_TreasuryId",
                table: "Currencies");

            migrationBuilder.DropColumn(
                name: "OpenningBalanceDate",
                table: "Currencies");

            migrationBuilder.AlterColumn<int>(
                name: "TreasuryId",
                table: "Currencies",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_Currencies_Treasury_TreasuryId",
                table: "Currencies",
                column: "TreasuryId",
                principalTable: "Treasury",
                principalColumn: "TreasuryId");
        }
    }
}

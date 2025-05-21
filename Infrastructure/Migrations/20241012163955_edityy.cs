using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class edityy : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "LastNotifcationDate",
                table: "Sec_Users",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "EX_WholeInvoicesDetails",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "EX_WholeInvoices",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "EX_InvoicesDetails",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "EX_Invoices",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "LastNotifcationDate",
                table: "Sec_Users");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "EX_WholeInvoicesDetails");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "EX_WholeInvoices");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "EX_InvoicesDetails");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "EX_Invoices");
        }
    }
}

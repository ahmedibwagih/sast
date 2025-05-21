using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class edditt_addf : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "NoteDate",
                table: "ExClientsNote",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "BranchID1",
                table: "EX_Suppliers",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Sector",
                table: "EX_Suppliers",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "BranchID",
                table: "EX_Clients",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Sector",
                table: "EX_Clients",
                type: "nvarchar(max)",
                nullable: true);

            //migrationBuilder.CreateIndex(
            //    name: "IX_EX_Suppliers_BranchID1",
            //    table: "EX_Suppliers",
            //    column: "BranchID1");

            //migrationBuilder.CreateIndex(
            //    name: "IX_EX_Clients_BranchID",
            //    table: "EX_Clients",
            //    column: "BranchID");

            migrationBuilder.AddForeignKey(
                name: "FK_EX_Clients_EX_Branches_BranchID",
                table: "EX_Clients",
                column: "BranchID",
                principalTable: "EX_Branches",
                principalColumn: "BranchID");

            migrationBuilder.AddForeignKey(
                name: "FK_EX_Suppliers_EX_Branches_BranchID1",
                table: "EX_Suppliers",
                column: "BranchID1",
                principalTable: "EX_Branches",
                principalColumn: "BranchID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_EX_Clients_EX_Branches_BranchID",
                table: "EX_Clients");

            migrationBuilder.DropForeignKey(
                name: "FK_EX_Suppliers_EX_Branches_BranchID1",
                table: "EX_Suppliers");

            //migrationBuilder.DropIndex(
            //    name: "IX_EX_Suppliers_BranchID1",
            //    table: "EX_Suppliers");

            //migrationBuilder.DropIndex(
            //    name: "IX_EX_Clients_BranchID",
            //    table: "EX_Clients");

            migrationBuilder.DropColumn(
                name: "NoteDate",
                table: "ExClientsNote");

            migrationBuilder.DropColumn(
                name: "BranchID1",
                table: "EX_Suppliers");

            migrationBuilder.DropColumn(
                name: "Sector",
                table: "EX_Suppliers");

            migrationBuilder.DropColumn(
                name: "BranchID",
                table: "EX_Clients");

            migrationBuilder.DropColumn(
                name: "Sector",
                table: "EX_Clients");
        }
    }
}

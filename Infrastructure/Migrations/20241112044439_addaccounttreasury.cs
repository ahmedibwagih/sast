using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addaccounttreasury : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "AccountId",
                table: "Treasury",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Treasury_AccountId",
                table: "Treasury",
                column: "AccountId");

            migrationBuilder.AddForeignKey(
                name: "FK_Treasury_A_Accounts_AccountId",
                table: "Treasury",
                column: "AccountId",
                principalTable: "A_Accounts",
                principalColumn: "AccountID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Treasury_A_Accounts_AccountId",
                table: "Treasury");

            migrationBuilder.DropIndex(
                name: "IX_Treasury_AccountId",
                table: "Treasury");

            migrationBuilder.DropColumn(
                name: "AccountId",
                table: "Treasury");
        }
    }
}

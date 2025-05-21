using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class eddrr : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "OwnerId",
                table: "Treasury",
                type: "int",
                nullable: true,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Treasury_OwnerId",
                table: "Treasury",
                column: "OwnerId");

            migrationBuilder.AddForeignKey(
                name: "FK_Treasury_Sec_Users_OwnerId",
                table: "Treasury",
                column: "OwnerId",
                principalTable: "Sec_Users",
                principalColumn: "UserID",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Treasury_Sec_Users_OwnerId",
                table: "Treasury");

            migrationBuilder.DropIndex(
                name: "IX_Treasury_OwnerId",
                table: "Treasury");

            migrationBuilder.DropColumn(
                name: "OwnerId",
                table: "Treasury");
        }
    }
}

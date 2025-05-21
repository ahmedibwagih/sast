using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addcostcenter : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "HasCostCenter",
                table: "A_Accounts",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "HasDirectCostCenter",
                table: "A_Accounts",
                type: "bit",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "HasCostCenter",
                table: "A_Accounts");

            migrationBuilder.DropColumn(
                name: "HasDirectCostCenter",
                table: "A_Accounts");
        }
    }
}

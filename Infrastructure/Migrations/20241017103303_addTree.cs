using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addTree : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ACostCenter",
                columns: table => new
                {
                    CostCenterId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ParentId = table.Column<int>(type: "int", nullable: true),
                    CostCode = table.Column<int>(type: "int", nullable: false),
                    CostName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CostLevel = table.Column<int>(type: "int", nullable: false),
                    CurrencyId = table.Column<int>(type: "int", nullable: true),
                    HasDetailedAccounts = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ACostCenter", x => x.CostCenterId);
                });

            migrationBuilder.CreateIndex(
                name: "IX_A_Accounts_CostCenterID",
                table: "A_Accounts",
                column: "CostCenterID");

            migrationBuilder.AddForeignKey(
                name: "FK_A_Accounts_ACostCenter_CostCenterID",
                table: "A_Accounts",
                column: "CostCenterID",
                principalTable: "ACostCenter",
                principalColumn: "CostCenterId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_A_Accounts_ACostCenter_CostCenterID",
                table: "A_Accounts");

            migrationBuilder.DropTable(
                name: "ACostCenter");

            migrationBuilder.DropIndex(
                name: "IX_A_Accounts_CostCenterID",
                table: "A_Accounts");
        }
    }
}

using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addyears : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "FinYears",
                columns: table => new
                {
                    FinYearId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    YearNameAr = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    YearNameEn = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsCurrentYear = table.Column<bool>(type: "bit", nullable: false),
                    From = table.Column<DateTime>(type: "datetime2", nullable: false),
                    To = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FinYears", x => x.FinYearId);
                });

            migrationBuilder.CreateTable(
                name: "FinYearsPeriods",
                columns: table => new
                {
                    FinYearsPeriodId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PeriodNameAr = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PeriodNameEn = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsOpen = table.Column<bool>(type: "bit", nullable: false),
                    From = table.Column<DateTime>(type: "datetime2", nullable: false),
                    To = table.Column<DateTime>(type: "datetime2", nullable: false),
                    FinYearId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FinYearsPeriods", x => x.FinYearsPeriodId);
                    table.ForeignKey(
                        name: "FK_FinYearsPeriods_FinYears_FinYearId",
                        column: x => x.FinYearId,
                        principalTable: "FinYears",
                        principalColumn: "FinYearId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_FinYearsPeriods_FinYearId",
                table: "FinYearsPeriods",
                column: "FinYearId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "FinYearsPeriods");

            migrationBuilder.DropTable(
                name: "FinYears");
        }
    }
}

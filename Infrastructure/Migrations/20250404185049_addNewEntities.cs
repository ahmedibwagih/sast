using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addNewEntities : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ClientActivities",
                columns: table => new
                {
                    ClientActivityID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ActivityNameAr = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ActivityNameEn = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ClientActivities", x => x.ClientActivityID);
                });

            migrationBuilder.CreateTable(
                name: "ShiftTracking",
                columns: table => new
                {
                    ShiftTrackingID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TreasuryId = table.Column<int>(type: "int", nullable: false),
                    CurrentBalance = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    FromUserId = table.Column<int>(type: "int", nullable: false),
                    ToUserId = table.Column<int>(type: "int", nullable: false),
                    Date = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Notes = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShiftTracking", x => x.ShiftTrackingID);
                    table.ForeignKey(
                        name: "FK_ShiftTracking_Sec_Users_FromUserId",
                        column: x => x.FromUserId,
                        principalTable: "Sec_Users",
                        principalColumn: "UserID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ShiftTracking_Sec_Users_ToUserId",
                        column: x => x.ToUserId,
                        principalTable: "Sec_Users",
                        principalColumn: "UserID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ShiftTracking_Treasury_TreasuryId",
                        column: x => x.TreasuryId,
                        principalTable: "Treasury",
                        principalColumn: "TreasuryId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "TreasuryDealers",
                columns: table => new
                {
                    TreasuryDealerId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TreasuryId = table.Column<int>(type: "int", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    Desc = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Date = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TreasuryDealers", x => x.TreasuryDealerId);
                    table.ForeignKey(
                        name: "FK_TreasuryDealers_Sec_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Sec_Users",
                        principalColumn: "UserID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_TreasuryDealers_Treasury_TreasuryId",
                        column: x => x.TreasuryId,
                        principalTable: "Treasury",
                        principalColumn: "TreasuryId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ShiftTracking_FromUserId",
                table: "ShiftTracking",
                column: "FromUserId");

            migrationBuilder.CreateIndex(
                name: "IX_ShiftTracking_ToUserId",
                table: "ShiftTracking",
                column: "ToUserId");

            migrationBuilder.CreateIndex(
                name: "IX_ShiftTracking_TreasuryId",
                table: "ShiftTracking",
                column: "TreasuryId");

            migrationBuilder.CreateIndex(
                name: "IX_TreasuryDealers_TreasuryId",
                table: "TreasuryDealers",
                column: "TreasuryId");

            migrationBuilder.CreateIndex(
                name: "IX_TreasuryDealers_UserId",
                table: "TreasuryDealers",
                column: "UserId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ClientActivities");

            migrationBuilder.DropTable(
                name: "ShiftTracking");

            migrationBuilder.DropTable(
                name: "TreasuryDealers");
        }
    }
}

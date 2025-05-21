using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addtreasurytranfere : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "StatusId",
                table: "ExTaswya",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "ExTreasuryTransfere",
                columns: table => new
                {
                    TransferId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FromBranchID = table.Column<int>(type: "int", nullable: true),
                    FromTreasuryId = table.Column<int>(type: "int", nullable: true),
                    ToBranchID = table.Column<int>(type: "int", nullable: true),
                    ToTreasuryId = table.Column<int>(type: "int", nullable: true),
                    UserId = table.Column<int>(type: "int", nullable: true),
                    TransferNo = table.Column<int>(type: "int", nullable: false),
                    TransferDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Remarks = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Closed = table.Column<bool>(type: "bit", nullable: false),
                    TransferClosingDate = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ExTreasuryTransfere", x => x.TransferId);
                    table.ForeignKey(
                        name: "FK_ExTreasuryTransfere_EX_Branches_FromBranchID",
                        column: x => x.FromBranchID,
                        principalTable: "EX_Branches",
                        principalColumn: "BranchID");
                    table.ForeignKey(
                        name: "FK_ExTreasuryTransfere_EX_Branches_ToBranchID",
                        column: x => x.ToBranchID,
                        principalTable: "EX_Branches",
                        principalColumn: "BranchID");
                    table.ForeignKey(
                        name: "FK_ExTreasuryTransfere_Sec_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Sec_Users",
                        principalColumn: "UserID");
                    table.ForeignKey(
                        name: "FK_ExTreasuryTransfere_Treasury_FromTreasuryId",
                        column: x => x.FromTreasuryId,
                        principalTable: "Treasury",
                        principalColumn: "TreasuryId");
                    table.ForeignKey(
                        name: "FK_ExTreasuryTransfere_Treasury_ToTreasuryId",
                        column: x => x.ToTreasuryId,
                        principalTable: "Treasury",
                        principalColumn: "TreasuryId");
                });

            migrationBuilder.CreateTable(
                name: "ExTreasuryTransfereDetail",
                columns: table => new
                {
                    TransferDetailId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TransferId = table.Column<int>(type: "int", nullable: false),
                    CurrencyId = table.Column<int>(type: "int", nullable: false),
                    TransferTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    TransferAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    TransferType = table.Column<int>(type: "int", nullable: false),
                    TransferWithUserId = table.Column<int>(type: "int", nullable: true),
                    TransferRemarks = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ExTreasuryTransfereDetail", x => x.TransferDetailId);
                    table.ForeignKey(
                        name: "FK_ExTreasuryTransfereDetail_Currencies_CurrencyId",
                        column: x => x.CurrencyId,
                        principalTable: "Currencies",
                        principalColumn: "CurrencyID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ExTreasuryTransfereDetail_ExTreasuryTransfere_TransferId",
                        column: x => x.TransferId,
                        principalTable: "ExTreasuryTransfere",
                        principalColumn: "TransferId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ExTreasuryTransfere_FromBranchID",
                table: "ExTreasuryTransfere",
                column: "FromBranchID");

            migrationBuilder.CreateIndex(
                name: "IX_ExTreasuryTransfere_FromTreasuryId",
                table: "ExTreasuryTransfere",
                column: "FromTreasuryId");

            migrationBuilder.CreateIndex(
                name: "IX_ExTreasuryTransfere_ToBranchID",
                table: "ExTreasuryTransfere",
                column: "ToBranchID");

            migrationBuilder.CreateIndex(
                name: "IX_ExTreasuryTransfere_ToTreasuryId",
                table: "ExTreasuryTransfere",
                column: "ToTreasuryId");

            migrationBuilder.CreateIndex(
                name: "IX_ExTreasuryTransfere_UserId",
                table: "ExTreasuryTransfere",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_ExTreasuryTransfereDetail_CurrencyId",
                table: "ExTreasuryTransfereDetail",
                column: "CurrencyId");

            migrationBuilder.CreateIndex(
                name: "IX_ExTreasuryTransfereDetail_TransferId",
                table: "ExTreasuryTransfereDetail",
                column: "TransferId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ExTreasuryTransfereDetail");

            migrationBuilder.DropTable(
                name: "ExTreasuryTransfere");

            migrationBuilder.DropColumn(
                name: "StatusId",
                table: "ExTaswya");
        }
    }
}

using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addtaswya : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
   

            migrationBuilder.CreateTable(
                name: "ExTaswya",
                columns: table => new
                {
                    TransferId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BranchID = table.Column<int>(type: "int", nullable: true),
                    UserId = table.Column<int>(type: "int", nullable: true),
                    TreasuryId = table.Column<int>(type: "int", nullable: true),
                    TransferNo = table.Column<int>(type: "int", nullable: false),
                    TransferDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Remarks = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Closed = table.Column<bool>(type: "bit", nullable: false),
                    TransferClosingDate = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ExTaswya", x => x.TransferId);
                    table.ForeignKey(
                        name: "FK_ExTaswya_EX_Branches_BranchID",
                        column: x => x.BranchID,
                        principalTable: "EX_Branches",
                        principalColumn: "BranchID");
                    table.ForeignKey(
                        name: "FK_ExTaswya_Sec_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Sec_Users",
                        principalColumn: "UserID");
                    table.ForeignKey(
                        name: "FK_ExTaswya_Treasury_TreasuryId",
                        column: x => x.TreasuryId,
                        principalTable: "Treasury",
                        principalColumn: "TreasuryId");
                });

            migrationBuilder.CreateTable(
                name: "ExTaswyaDetail",
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
                    table.PrimaryKey("PK_ExTaswyaDetail", x => x.TransferDetailId);
                    table.ForeignKey(
                        name: "FK_ExTaswyaDetail_Currencies_CurrencyId",
                        column: x => x.CurrencyId,
                        principalTable: "Currencies",
                        principalColumn: "CurrencyID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ExTaswyaDetail_ExTaswya_TransferId",
                        column: x => x.TransferId,
                        principalTable: "ExTaswya",
                        principalColumn: "TransferId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ExTaswya_BranchID",
                table: "ExTaswya",
                column: "BranchID");

            migrationBuilder.CreateIndex(
                name: "IX_ExTaswya_TreasuryId",
                table: "ExTaswya",
                column: "TreasuryId");

            migrationBuilder.CreateIndex(
                name: "IX_ExTaswya_UserId",
                table: "ExTaswya",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_ExTaswyaDetail_CurrencyId",
                table: "ExTaswyaDetail",
                column: "CurrencyId");

            migrationBuilder.CreateIndex(
                name: "IX_ExTaswyaDetail_TransferId",
                table: "ExTaswyaDetail",
                column: "TransferId");

            //migrationBuilder.AddForeignKey(
            //    name: "FK_Treasury_Sec_Users_OwnerId",
            //    table: "Treasury",
            //    column: "OwnerId",
            //    principalTable: "Sec_Users",
            //    principalColumn: "UserID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Treasury_Sec_Users_OwnerId",
                table: "Treasury");

            migrationBuilder.DropTable(
                name: "ExTaswyaDetail");

            migrationBuilder.DropTable(
                name: "ExTaswya");

            migrationBuilder.AlterColumn<int>(
                name: "OwnerId",
                table: "Treasury",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Treasury_Sec_Users_OwnerId",
                table: "Treasury",
                column: "OwnerId",
                principalTable: "Sec_Users",
                principalColumn: "UserID",
                onDelete: ReferentialAction.Cascade);
        }
    }
}

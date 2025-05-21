using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addBankaccount : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "BankAccount",
                columns: table => new
                {
                    BankAccountId = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BankId = table.Column<int>(type: "int", nullable: false),
                    CurrencyId = table.Column<int>(type: "int", nullable: false),
                    NameEn = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NameAr = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Accountnumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    OppenningBalance = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    Note = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Date = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BankAccount", x => x.BankAccountId);
                    table.ForeignKey(
                        name: "FK_BankAccount_Currencies_CurrencyId",
                        column: x => x.CurrencyId,
                        principalTable: "Currencies",
                        principalColumn: "CurrencyID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_BankAccount_EX_Banks_BankId",
                        column: x => x.BankId,
                        principalTable: "EX_Banks",
                        principalColumn: "BankID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "BanksTransfere",
                columns: table => new
                {
                    BanksTransfereId = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FromBankAccountId = table.Column<long>(type: "bigint", nullable: false),
                    ToBankAccountId = table.Column<long>(type: "bigint", nullable: false),
                    Amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    Note = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Date = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BanksTransfere", x => x.BanksTransfereId);
                });

            migrationBuilder.CreateTable(
                name: "BanksTreasuryTransfere",
                columns: table => new
                {
                    BanksTreasuryTransfereId = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BankAccountId = table.Column<long>(type: "bigint", nullable: false),
                    CurrencyId = table.Column<int>(type: "int", nullable: false),
                    TreasuryId = table.Column<int>(type: "int", nullable: false),
                    Type = table.Column<int>(type: "int", nullable: false),
                    Amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    Note = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Date = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BanksTreasuryTransfere", x => x.BanksTreasuryTransfereId);
                    table.ForeignKey(
                        name: "FK_BanksTreasuryTransfere_Currencies_CurrencyId",
                        column: x => x.CurrencyId,
                        principalTable: "Currencies",
                        principalColumn: "CurrencyID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ProveInOutCheck",
                columns: table => new
                {
                    ProveInOutCheckId = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CheckNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    BankAccountId = table.Column<long>(type: "bigint", nullable: false),
                    Amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    Type = table.Column<int>(type: "int", nullable: false),
                    Note = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Date = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProveInOutCheck", x => x.ProveInOutCheckId);
                });

            migrationBuilder.CreateTable(
                name: "BanksBvr",
                columns: table => new
                {
                    BanksBvrId = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BankAccountId = table.Column<long>(type: "bigint", nullable: false),
                    ActionType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ActionId = table.Column<int>(type: "int", nullable: false),
                    ActionDetailId = table.Column<int>(type: "int", nullable: false),
                    ActionTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    Balance = table.Column<decimal>(type: "decimal(18,2)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BanksBvr", x => x.BanksBvrId);
                    table.ForeignKey(
                        name: "FK_BanksBvr_BankAccount_BankAccountId",
                        column: x => x.BankAccountId,
                        principalTable: "BankAccount",
                        principalColumn: "BankAccountId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_BankAccount_BankId",
                table: "BankAccount",
                column: "BankId");

            migrationBuilder.CreateIndex(
                name: "IX_BankAccount_CurrencyId",
                table: "BankAccount",
                column: "CurrencyId");

            migrationBuilder.CreateIndex(
                name: "IX_BanksBvr_BankAccountId",
                table: "BanksBvr",
                column: "BankAccountId");

            migrationBuilder.CreateIndex(
                name: "IX_BanksTreasuryTransfere_CurrencyId",
                table: "BanksTreasuryTransfere",
                column: "CurrencyId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "BanksBvr");

            migrationBuilder.DropTable(
                name: "BanksTransfere");

            migrationBuilder.DropTable(
                name: "BanksTreasuryTransfere");

            migrationBuilder.DropTable(
                name: "ProveInOutCheck");

            migrationBuilder.DropTable(
                name: "BankAccount");
        }
    }
}

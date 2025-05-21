using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddUserIdInsteedofCashier : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "EX_WholeInvoices",
                type: "int",
                nullable: true,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "EX_Invoices",
                type: "int",
                nullable: true,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "EX_InternalTransfers",
                type: "int",
                nullable: true,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "EX_BranchTransfers",
                type: "int",
                nullable: true,
                defaultValue: 0);

            //migrationBuilder.CreateIndex(
            //    name: "IX_EX_WholeInvoices_UserId",
            //    table: "EX_WholeInvoices",
            //    column: "UserId");

            //migrationBuilder.CreateIndex(
            //    name: "IX_EX_Invoices_UserId",
            //    table: "EX_Invoices",
            //    column: "UserId");

            //migrationBuilder.CreateIndex(
            //    name: "IX_EX_InternalTransfers_UserId",
            //    table: "EX_InternalTransfers",
            //    column: "UserId");

            //migrationBuilder.CreateIndex(
            //    name: "IX_EX_BranchTransfers_UserId",
            //    table: "EX_BranchTransfers",
            //    column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_EX_BranchTransfers_Sec_Users_UserId",
                table: "EX_BranchTransfers",
                column: "UserId",
                principalTable: "Sec_Users",
                principalColumn: "UserID",
                onDelete: ReferentialAction.NoAction);

            migrationBuilder.AddForeignKey(
                name: "FK_EX_InternalTransfers_Sec_Users_UserId",
                table: "EX_InternalTransfers",
                column: "UserId",
                principalTable: "Sec_Users",
                principalColumn: "UserID",
                onDelete: ReferentialAction.NoAction);

            migrationBuilder.AddForeignKey(
                name: "FK_EX_Invoices_Sec_Users_UserId",
                table: "EX_Invoices",
                column: "UserId",
                principalTable: "Sec_Users",
                principalColumn: "UserID",
                onDelete: ReferentialAction.NoAction);

            migrationBuilder.AddForeignKey(
                name: "FK_EX_WholeInvoices_Sec_Users_UserId",
                table: "EX_WholeInvoices",
                column: "UserId",
                principalTable: "Sec_Users",
                principalColumn: "UserID",
                onDelete: ReferentialAction.NoAction);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_EX_BranchTransfers_Sec_Users_UserId",
                table: "EX_BranchTransfers");

            migrationBuilder.DropForeignKey(
                name: "FK_EX_InternalTransfers_Sec_Users_UserId",
                table: "EX_InternalTransfers");

            migrationBuilder.DropForeignKey(
                name: "FK_EX_Invoices_Sec_Users_UserId",
                table: "EX_Invoices");

            migrationBuilder.DropForeignKey(
                name: "FK_EX_WholeInvoices_Sec_Users_UserId",
                table: "EX_WholeInvoices");

            //migrationBuilder.DropIndex(
            //    name: "IX_EX_WholeInvoices_UserId",
            //    table: "EX_WholeInvoices");

            //migrationBuilder.DropIndex(
            //    name: "IX_EX_Invoices_UserId",
            //    table: "EX_Invoices");

            //migrationBuilder.DropIndex(
            //    name: "IX_EX_InternalTransfers_UserId",
            //    table: "EX_InternalTransfers");

            //migrationBuilder.DropIndex(
            //    name: "IX_EX_BranchTransfers_UserId",
            //    table: "EX_BranchTransfers");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "EX_WholeInvoices");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "EX_Invoices");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "EX_InternalTransfers");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "EX_BranchTransfers");
        }
    }
}

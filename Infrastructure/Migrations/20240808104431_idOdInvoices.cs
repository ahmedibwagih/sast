using Core.Entities.TRN_Transfers;
using Core.Entities.TRN_WholeInvoices;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class idOdInvoices : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
//            manauly to ExWholeInvoice
//ExBranchTransfer
//ExInternalTransfer
//ExInvoice
            //migrationBuilder.DropForeignKey(
            //    name: "FK_EX_BranchTransfers_Sec_Users_UserId",
            //    table: "EX_BranchTransfers");

            //migrationBuilder.DropForeignKey(
            //    name: "FK_EX_InternalTransfers_Sec_Users_UserId",
            //    table: "EX_InternalTransfers");

            //migrationBuilder.DropForeignKey(
            //    name: "FK_EX_Invoices_Sec_Users_UserId",
            //    table: "EX_Invoices");

            //migrationBuilder.DropForeignKey(
            //    name: "FK_EX_WholeInvoices_Sec_Users_UserId",
            //    table: "EX_WholeInvoices");

            //migrationBuilder.AlterColumn<int>(
            //    name: "UserId",
            //    table: "EX_WholeInvoices",
            //    type: "int",
            //    nullable: true,
            //    oldClrType: typeof(int),
            //    oldType: "int");

            //migrationBuilder.AlterColumn<int>(
            //    name: "InvoiceID",
            //    table: "EX_WholeInvoices",
            //    type: "int",
            //    nullable: false,
            //    oldClrType: typeof(int),
            //    oldType: "int")
            //    .Annotation("SqlServer:Identity", "1, 1");

            //migrationBuilder.AlterColumn<int>(
            //    name: "UserId",
            //    table: "EX_Invoices",
            //    type: "int",
            //    nullable: true,
            //    oldClrType: typeof(int),
            //    oldType: "int");

            //migrationBuilder.AlterColumn<int>(
            //    name: "InvoiceID",
            //    table: "EX_Invoices",
            //    type: "int",
            //    nullable: false,
            //    oldClrType: typeof(int),
            //    oldType: "int")
            //    .Annotation("SqlServer:Identity", "1, 1");

            //migrationBuilder.AlterColumn<int>(
            //    name: "UserId",
            //    table: "EX_InternalTransfers",
            //    type: "int",
            //    nullable: true,
            //    oldClrType: typeof(int),
            //    oldType: "int");

            //migrationBuilder.AlterColumn<int>(
            //    name: "TransferID",
            //    table: "EX_InternalTransfers",
            //    type: "int",
            //    nullable: false,
            //    oldClrType: typeof(int),
            //    oldType: "int")
            //    .Annotation("SqlServer:Identity", "1, 1");

            //migrationBuilder.AlterColumn<int>(
            //    name: "UserId",
            //    table: "EX_BranchTransfers",
            //    type: "int",
            //    nullable: true,
            //    oldClrType: typeof(int),
            //    oldType: "int");

            //migrationBuilder.AlterColumn<int>(
            //    name: "VoucherID",
            //    table: "EX_BranchTransfers",
            //    type: "int",
            //    nullable: false,
            //    oldClrType: typeof(int),
            //    oldType: "int")
            //    .Annotation("SqlServer:Identity", "1, 1");

            //migrationBuilder.AddForeignKey(
            //    name: "FK_EX_BranchTransfers_Sec_Users_UserId",
            //    table: "EX_BranchTransfers",
            //    column: "UserId",
            //    principalTable: "Sec_Users",
            //    principalColumn: "UserID");

            //migrationBuilder.AddForeignKey(
            //    name: "FK_EX_InternalTransfers_Sec_Users_UserId",
            //    table: "EX_InternalTransfers",
            //    column: "UserId",
            //    principalTable: "Sec_Users",
            //    principalColumn: "UserID");

            //migrationBuilder.AddForeignKey(
            //    name: "FK_EX_Invoices_Sec_Users_UserId",
            //    table: "EX_Invoices",
            //    column: "UserId",
            //    principalTable: "Sec_Users",
            //    principalColumn: "UserID");

            //migrationBuilder.AddForeignKey(
            //    name: "FK_EX_WholeInvoices_Sec_Users_UserId",
            //    table: "EX_WholeInvoices",
            //    column: "UserId",
            //    principalTable: "Sec_Users",
            //    principalColumn: "UserID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
        //    migrationBuilder.DropForeignKey(
        //        name: "FK_EX_BranchTransfers_Sec_Users_UserId",
        //        table: "EX_BranchTransfers");

        //    migrationBuilder.DropForeignKey(
        //        name: "FK_EX_InternalTransfers_Sec_Users_UserId",
        //        table: "EX_InternalTransfers");

        //    migrationBuilder.DropForeignKey(
        //        name: "FK_EX_Invoices_Sec_Users_UserId",
        //        table: "EX_Invoices");

        //    migrationBuilder.DropForeignKey(
        //        name: "FK_EX_WholeInvoices_Sec_Users_UserId",
        //        table: "EX_WholeInvoices");

        //    migrationBuilder.AlterColumn<int>(
        //        name: "UserId",
        //        table: "EX_WholeInvoices",
        //        type: "int",
        //        nullable: false,
        //        defaultValue: 0,
        //        oldClrType: typeof(int),
        //        oldType: "int",
        //        oldNullable: true);

        //    migrationBuilder.AlterColumn<int>(
        //        name: "InvoiceID",
        //        table: "EX_WholeInvoices",
        //        type: "int",
        //        nullable: false,
        //        oldClrType: typeof(int),
        //        oldType: "int")
        //        .OldAnnotation("SqlServer:Identity", "1, 1");

        //    migrationBuilder.AlterColumn<int>(
        //        name: "UserId",
        //        table: "EX_Invoices",
        //        type: "int",
        //        nullable: false,
        //        defaultValue: 0,
        //        oldClrType: typeof(int),
        //        oldType: "int",
        //        oldNullable: true);

        //    migrationBuilder.AlterColumn<int>(
        //        name: "InvoiceID",
        //        table: "EX_Invoices",
        //        type: "int",
        //        nullable: false,
        //        oldClrType: typeof(int),
        //        oldType: "int")
        //        .OldAnnotation("SqlServer:Identity", "1, 1");

        //    migrationBuilder.AlterColumn<int>(
        //        name: "UserId",
        //        table: "EX_InternalTransfers",
        //        type: "int",
        //        nullable: false,
        //        defaultValue: 0,
        //        oldClrType: typeof(int),
        //        oldType: "int",
        //        oldNullable: true);

        //    migrationBuilder.AlterColumn<int>(
        //        name: "TransferID",
        //        table: "EX_InternalTransfers",
        //        type: "int",
        //        nullable: false,
        //        oldClrType: typeof(int),
        //        oldType: "int")
        //        .OldAnnotation("SqlServer:Identity", "1, 1");

        //    migrationBuilder.AlterColumn<int>(
        //        name: "UserId",
        //        table: "EX_BranchTransfers",
        //        type: "int",
        //        nullable: false,
        //        defaultValue: 0,
        //        oldClrType: typeof(int),
        //        oldType: "int",
        //        oldNullable: true);

        //    migrationBuilder.AlterColumn<int>(
        //        name: "VoucherID",
        //        table: "EX_BranchTransfers",
        //        type: "int",
        //        nullable: false,
        //        oldClrType: typeof(int),
        //        oldType: "int")
        //        .OldAnnotation("SqlServer:Identity", "1, 1");

        //    migrationBuilder.AddForeignKey(
        //        name: "FK_EX_BranchTransfers_Sec_Users_UserId",
        //        table: "EX_BranchTransfers",
        //        column: "UserId",
        //        principalTable: "Sec_Users",
        //        principalColumn: "UserID",
        //        onDelete: ReferentialAction.Cascade);

        //    migrationBuilder.AddForeignKey(
        //        name: "FK_EX_InternalTransfers_Sec_Users_UserId",
        //        table: "EX_InternalTransfers",
        //        column: "UserId",
        //        principalTable: "Sec_Users",
        //        principalColumn: "UserID",
        //        onDelete: ReferentialAction.Cascade);

        //    migrationBuilder.AddForeignKey(
        //        name: "FK_EX_Invoices_Sec_Users_UserId",
        //        table: "EX_Invoices",
        //        column: "UserId",
        //        principalTable: "Sec_Users",
        //        principalColumn: "UserID",
        //        onDelete: ReferentialAction.Cascade);

        //    migrationBuilder.AddForeignKey(
        //        name: "FK_EX_WholeInvoices_Sec_Users_UserId",
        //        table: "EX_WholeInvoices",
        //        column: "UserId",
        //        principalTable: "Sec_Users",
        //        principalColumn: "UserID",
        //        onDelete: ReferentialAction.Cascade);
        }
    }
}

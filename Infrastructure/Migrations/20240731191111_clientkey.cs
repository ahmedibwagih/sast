using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class clientkey : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.RenameColumn(
            //    name: "ClientID",
            //    table: "EX_Clients",
            //    newName: "ClientId");

            //migrationBuilder.AlterColumn<int>(
            //    name: "ClientId",
            //    table: "EX_Clients",
            //    type: "int",
            //    nullable: false,
            //    oldClrType: typeof(int),
            //    oldType: "int")
            //    .Annotation("SqlServer:Identity", "1, 1");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.RenameColumn(
            //    name: "ClientId",
            //    table: "EX_Clients",
            //    newName: "ClientID");

            //migrationBuilder.AlterColumn<int>(
            //    name: "ClientID",
            //    table: "EX_Clients",
            //    type: "int",
            //    nullable: false,
            //    oldClrType: typeof(int),
            //    oldType: "int")
            //    .OldAnnotation("SqlServer:Identity", "1, 1");
        }
    }
}

using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class Add_Deleted2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "EX_IncomeSources",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "EX_IDSources",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "EX_ExchangePurposes",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "EX_Countries",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "EX_ClientJobSeverity",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "EX_ClientJob",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "EX_Banks",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "EX_AttachmentType",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "Currencies",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "EX_IncomeSources");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "EX_IDSources");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "EX_ExchangePurposes");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "EX_Countries");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "EX_ClientJobSeverity");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "EX_ClientJob");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "EX_Banks");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "EX_AttachmentType");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "Currencies");
        }
    }
}

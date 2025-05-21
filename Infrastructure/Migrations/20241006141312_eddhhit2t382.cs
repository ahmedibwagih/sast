using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class eddhhit2t382 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsCompleted",
                table: "WFRequestDetails");

            migrationBuilder.DropColumn(
                name: "RunONLastApprove",
                table: "WFRequest");

            migrationBuilder.DropColumn(
                name: "RunOnReject",
                table: "WFRequest");

            migrationBuilder.DropColumn(
                name: "RunOnStart",
                table: "WFRequest");

            migrationBuilder.AddColumn<string>(
                name: "RunONLastApprove",
                table: "WFRequestType",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "RunOnReject",
                table: "WFRequestType",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "RunOnStart",
                table: "WFRequestType",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "RunONLastApprove",
                table: "WFRequestType");

            migrationBuilder.DropColumn(
                name: "RunOnReject",
                table: "WFRequestType");

            migrationBuilder.DropColumn(
                name: "RunOnStart",
                table: "WFRequestType");

            migrationBuilder.AddColumn<bool>(
                name: "IsCompleted",
                table: "WFRequestDetails",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "RunONLastApprove",
                table: "WFRequest",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "RunOnReject",
                table: "WFRequest",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "RunOnStart",
                table: "WFRequest",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}

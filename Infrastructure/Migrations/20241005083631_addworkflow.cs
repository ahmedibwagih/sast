using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addworkflow : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "WFRequestType",
                columns: table => new
                {
                    RequestTypeId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NameAr = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NameEn = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WFRequestType", x => x.RequestTypeId);
                });

            migrationBuilder.CreateTable(
                name: "WFListOfApprovals",
                columns: table => new
                {
                    ListOfApprovalId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RequestTypeId = table.Column<int>(type: "int", nullable: false),
                    BranchID = table.Column<int>(type: "int", nullable: false),
                    ActionOrder = table.Column<int>(type: "int", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WFListOfApprovals", x => x.ListOfApprovalId);
                    table.ForeignKey(
                        name: "FK_WFListOfApprovals_EX_Branches_BranchID",
                        column: x => x.BranchID,
                        principalTable: "EX_Branches",
                        principalColumn: "BranchID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_WFListOfApprovals_Sec_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Sec_Users",
                        principalColumn: "UserID");
                    table.ForeignKey(
                        name: "FK_WFListOfApprovals_WFRequestType_RequestTypeId",
                        column: x => x.RequestTypeId,
                        principalTable: "WFRequestType",
                        principalColumn: "RequestTypeId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "WFRequest",
                columns: table => new
                {
                    RequestId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RequestTypeId = table.Column<int>(type: "int", nullable: false),
                    BranchID = table.Column<int>(type: "int", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: true),
                    EntityId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    RunOnStart = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    RunONLastApprove = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    RunOnReject = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsCompleted = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WFRequest", x => x.RequestId);
                    table.ForeignKey(
                        name: "FK_WFRequest_EX_Branches_BranchID",
                        column: x => x.BranchID,
                        principalTable: "EX_Branches",
                        principalColumn: "BranchID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_WFRequest_Sec_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Sec_Users",
                        principalColumn: "UserID");
                    table.ForeignKey(
                        name: "FK_WFRequest_WFRequestType_RequestTypeId",
                        column: x => x.RequestTypeId,
                        principalTable: "WFRequestType",
                        principalColumn: "RequestTypeId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "WFRequestDetails",
                columns: table => new
                {
                    RequestDetailId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RequestId = table.Column<int>(type: "int", nullable: false),
                    ActionType = table.Column<int>(type: "int", nullable: false),
                    ActionOrder = table.Column<int>(type: "int", nullable: false),
                    Notes = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WFRequestDetails", x => x.RequestDetailId);
                    table.ForeignKey(
                        name: "FK_WFRequestDetails_Sec_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Sec_Users",
                        principalColumn: "UserID");
                    table.ForeignKey(
                        name: "FK_WFRequestDetails_WFRequest_RequestId",
                        column: x => x.RequestId,
                        principalTable: "WFRequest",
                        principalColumn: "RequestId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_WFListOfApprovals_BranchID",
                table: "WFListOfApprovals",
                column: "BranchID");

            migrationBuilder.CreateIndex(
                name: "IX_WFListOfApprovals_RequestTypeId",
                table: "WFListOfApprovals",
                column: "RequestTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_WFListOfApprovals_UserId",
                table: "WFListOfApprovals",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_WFRequest_BranchID",
                table: "WFRequest",
                column: "BranchID");

            migrationBuilder.CreateIndex(
                name: "IX_WFRequest_RequestTypeId",
                table: "WFRequest",
                column: "RequestTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_WFRequest_UserId",
                table: "WFRequest",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_WFRequestDetails_RequestId",
                table: "WFRequestDetails",
                column: "RequestId");

            migrationBuilder.CreateIndex(
                name: "IX_WFRequestDetails_UserId",
                table: "WFRequestDetails",
                column: "UserId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "WFListOfApprovals");

            migrationBuilder.DropTable(
                name: "WFRequestDetails");

            migrationBuilder.DropTable(
                name: "WFRequest");

            migrationBuilder.DropTable(
                name: "WFRequestType");
        }
    }
}

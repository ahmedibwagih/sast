using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class editjob : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Privilage");

            migrationBuilder.DropTable(
                name: "Jobs");

            migrationBuilder.DropTable(
                name: "PrivilageType");

            migrationBuilder.DropTable(
                name: "Screens");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Jobs",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IsActve = table.Column<int>(type: "int", nullable: false, defaultValue: 1),
                    NameAr = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NameEn = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    RiskRate = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Jobs", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Screens",
                columns: table => new
                {
                    ScreenId = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IsFinal = table.Column<bool>(type: "bit", nullable: false),
                    NameAr = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NameEn = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ScreenParrentId = table.Column<long>(type: "bigint", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Screens", x => x.ScreenId);
                });

            migrationBuilder.CreateTable(
                name: "PrivilageType",
                columns: table => new
                {
                    PrivilageTypeId = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ScreensId = table.Column<long>(type: "bigint", nullable: false),
                    NameAr = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NameEn = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PrivilageType", x => x.PrivilageTypeId);
                    table.ForeignKey(
                        name: "FK_PrivilageType_Screens_ScreensId",
                        column: x => x.ScreensId,
                        principalTable: "Screens",
                        principalColumn: "ScreenId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Privilage",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    JobId = table.Column<long>(type: "bigint", nullable: false),
                    PrivilageTypeId = table.Column<long>(type: "bigint", nullable: false),
                    ScreensId = table.Column<long>(type: "bigint", nullable: false),
                    State = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Privilage", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Privilage_Jobs_JobId",
                        column: x => x.JobId,
                        principalTable: "Jobs",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Privilage_PrivilageType_PrivilageTypeId",
                        column: x => x.PrivilageTypeId,
                        principalTable: "PrivilageType",
                        principalColumn: "PrivilageTypeId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Privilage_Screens_ScreensId",
                        column: x => x.ScreensId,
                        principalTable: "Screens",
                        principalColumn: "ScreenId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Privilage_JobId",
                table: "Privilage",
                column: "JobId");

            migrationBuilder.CreateIndex(
                name: "IX_Privilage_PrivilageTypeId",
                table: "Privilage",
                column: "PrivilageTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_Privilage_ScreensId",
                table: "Privilage",
                column: "ScreensId");

            migrationBuilder.CreateIndex(
                name: "IX_PrivilageType_ScreensId",
                table: "PrivilageType",
                column: "ScreensId");
        }
    }
}

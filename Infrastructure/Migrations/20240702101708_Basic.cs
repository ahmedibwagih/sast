using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class Basic : Migration
    {
        //added manaually
        protected override void Up(MigrationBuilder migrationBuilder)
        { }
        protected override void Down(MigrationBuilder migrationBuilder)
        { }

        /// <inheritdoc />
        //protected override void Up(MigrationBuilder migrationBuilder)
        //{
        //    migrationBuilder.DropForeignKey(
        //        name: "FK_Currencies_Countries_CountryId",
        //        table: "Currencies");

        //    migrationBuilder.DropPrimaryKey(
        //        name: "PK_Currencies",
        //        table: "Currencies");

        //    migrationBuilder.DropIndex(
        //        name: "IX_Currencies_CountryId",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "Id",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "CountryId",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "CurrCode",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "IsActve",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "IsDefault",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "NameAr",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "NameEn",
        //        table: "Currencies");

        //    migrationBuilder.RenameColumn(
        //        name: "RiskRate",
        //        table: "Currencies",
        //        newName: "CurrencyCode");

        //    migrationBuilder.AddColumn<int>(
        //        name: "CurrencyID",
        //        table: "Currencies",
        //        type: "int",
        //        nullable: false,
        //        defaultValue: 0);

        //    migrationBuilder.AddColumn<decimal>(
        //        name: "BuyPrice",
        //        table: "Currencies",
        //        type: "decimal(18,14)",
        //        nullable: false,
        //        defaultValue: 0m);

        //    migrationBuilder.AddColumn<string>(
        //        name: "CurrencyNameAr",
        //        table: "Currencies",
        //        type: "nvarchar(50)",
        //        maxLength: 50,
        //        nullable: true);

        //    migrationBuilder.AddColumn<string>(
        //        name: "CurrencyNameEn",
        //        table: "Currencies",
        //        type: "nvarchar(50)",
        //        maxLength: 50,
        //        nullable: true);

        //    migrationBuilder.AddColumn<bool>(
        //        name: "IsActive",
        //        table: "Currencies",
        //        type: "bit",
        //        nullable: false,
        //        defaultValue: false);

        //    migrationBuilder.AddColumn<decimal>(
        //        name: "OpeningBalance",
        //        table: "Currencies",
        //        type: "decimal(18,2)",
        //        nullable: false,
        //        defaultValue: 0m);

        //    migrationBuilder.AddColumn<decimal>(
        //        name: "OpeningPrice",
        //        table: "Currencies",
        //        type: "decimal(18,14)",
        //        nullable: false,
        //        defaultValue: 0m);

        //    migrationBuilder.AddColumn<decimal>(
        //        name: "SalePrice",
        //        table: "Currencies",
        //        type: "decimal(18,14)",
        //        nullable: false,
        //        defaultValue: 0m);

        //    migrationBuilder.AddColumn<bool>(
        //        name: "ShowInPricesScreen",
        //        table: "Currencies",
        //        type: "bit",
        //        nullable: false,
        //        defaultValue: true);

        //    migrationBuilder.AddColumn<string>(
        //        name: "Sign",
        //        table: "Currencies",
        //        type: "nvarchar(4)",
        //        maxLength: 4,
        //        nullable: false,
        //        defaultValue: "");

        //    migrationBuilder.AddColumn<decimal>(
        //        name: "ValuationPrice",
        //        table: "Currencies",
        //        type: "decimal(18,14)",
        //        nullable: false,
        //        defaultValue: 0m);

        //    migrationBuilder.AddPrimaryKey(
        //        name: "PK_Ex_Currencies",
        //        table: "Currencies",
        //        column: "CurrencyID");

        //    migrationBuilder.CreateTable(
        //        name: "A_AccountClassification",
        //        columns: table => new
        //        {
        //            ClassificationID = table.Column<int>(type: "int", nullable: false),
        //            ClassificationCode = table.Column<int>(type: "int", nullable: false),
        //            ClassificationNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            ClassificationNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_A_AccountClassification", x => x.ClassificationID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "A_Accounts",
        //        columns: table => new
        //        {
        //            AccountID = table.Column<int>(type: "int", nullable: false),
        //            ParentID = table.Column<int>(type: "int", nullable: true),
        //            AccountCode = table.Column<int>(type: "int", nullable: false),
        //            AccountName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            AccountLevel = table.Column<int>(type: "int", nullable: false),
        //            LimitOverflow = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
        //            CostCenterID = table.Column<int>(type: "int", nullable: true),
        //            DepreciationAccountID = table.Column<int>(type: "int", nullable: true),
        //            ProvisionAccountID = table.Column<int>(type: "int", nullable: true),
        //            CurrencyID = table.Column<int>(type: "int", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_A_Accounts", x => x.AccountID);
        //            table.ForeignKey(
        //                name: "FK_A_Accounts_A_Accounts_Depreciation",
        //                column: x => x.DepreciationAccountID,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //            table.ForeignKey(
        //                name: "FK_A_Accounts_A_Accounts_Parent",
        //                column: x => x.ParentID,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //            table.ForeignKey(
        //                name: "FK_A_Accounts_A_Accounts_Provision",
        //                column: x => x.ProvisionAccountID,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "A_CashFlowStatus",
        //        columns: table => new
        //        {
        //            StatusID = table.Column<int>(type: "int", nullable: false),
        //            StatusNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            StatusNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_A_CashFlowStatus", x => x.StatusID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "A_CashFlowType",
        //        columns: table => new
        //        {
        //            VoucherTypeID = table.Column<int>(type: "int", nullable: false),
        //            VoucherTypeNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            VoucherTypeNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_A_CashFlowType", x => x.VoucherTypeID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "A_JVStatus",
        //        columns: table => new
        //        {
        //            StatusID = table.Column<int>(type: "int", nullable: false),
        //            StatusNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            StatusNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_A_JVStatus", x => x.StatusID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "A_JVType",
        //        columns: table => new
        //        {
        //            JVTypeID = table.Column<int>(type: "int", nullable: false),
        //            JVTypeNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            JVTypeNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_A_JVType", x => x.JVTypeID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "A_Settlements",
        //        columns: table => new
        //        {
        //            SettlementID = table.Column<int>(type: "int", nullable: false),
        //            CreationDate = table.Column<DateTime>(type: "datetime", nullable: false),
        //            UserID = table.Column<int>(type: "int", nullable: false),
        //            SettlementStartDate = table.Column<DateTime>(type: "datetime", nullable: false),
        //            SettlementEndDate = table.Column<DateTime>(type: "datetime", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_A_Settlements", x => x.SettlementID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "CurrenciesMains",
        //        columns: table => new
        //        {
        //            Id = table.Column<long>(type: "bigint", nullable: false)
        //                .Annotation("SqlServer:Identity", "1, 1"),
        //            CountryId = table.Column<long>(type: "bigint", nullable: false),
        //            NameAr = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            NameEn = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            CurrCode = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            IsDefault = table.Column<bool>(type: "bit", nullable: true),
        //            RiskRate = table.Column<int>(type: "int", nullable: false),
        //            IsActve = table.Column<int>(type: "int", nullable: false, defaultValue: 1)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_CurrenciesMains", x => x.Id);
        //            table.ForeignKey(
        //                name: "FK_CurrenciesMains_Countries_CountryId",
        //                column: x => x.CountryId,
        //                principalTable: "Countries",
        //                principalColumn: "Id",
        //                onDelete: ReferentialAction.Cascade);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "DX_Transactions",
        //        columns: table => new
        //        {
        //            TransactionID = table.Column<long>(type: "bigint", nullable: false)
        //                .Annotation("SqlServer:Identity", "1, 1"),
        //            SqlStatement = table.Column<string>(type: "nvarchar(max)", nullable: false),
        //            CreationDate = table.Column<DateTime>(type: "datetime", nullable: false),
        //            TransactionGuid = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_DX_Transactions_1", x => x.TransactionID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_AttachmentType",
        //        columns: table => new
        //        {
        //            TypeID = table.Column<int>(type: "int", nullable: false),
        //            TypeNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
        //            TypeNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_AttachmentType", x => x.TypeID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_Branches",
        //        columns: table => new
        //        {
        //            BranchID = table.Column<int>(type: "int", nullable: false),
        //            BranchCode = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false),
        //            BranchNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            BranchNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            AccountID = table.Column<int>(type: "int", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Branches", x => x.BranchID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_BranchTransferStatus",
        //        columns: table => new
        //        {
        //            StatusID = table.Column<int>(type: "int", nullable: false),
        //            StatusNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            StatusNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_BranchTransferStatus", x => x.StatusID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_BranchTransferType",
        //        columns: table => new
        //        {
        //            TypeID = table.Column<int>(type: "int", nullable: false),
        //            TypeNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            TypeNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_BranchTransferType", x => x.TypeID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_Cashiers",
        //        columns: table => new
        //        {
        //            CashierID = table.Column<int>(type: "int", nullable: false),
        //            CashierNameEn = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            CashierNameAr = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            BranchID = table.Column<int>(type: "int", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_Cashiers", x => x.CashierID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_ClientJobSeverity",
        //        columns: table => new
        //        {
        //            SeverityID = table.Column<int>(type: "int", nullable: false),
        //            SeverityNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            SeverityNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_ClientJobSeverity", x => x.SeverityID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_ClientsType",
        //        columns: table => new
        //        {
        //            ClientTypeID = table.Column<int>(type: "int", nullable: false),
        //            ClientTypeNameEn = table.Column<string>(type: "nvarchar(40)", maxLength: 40, nullable: false),
        //            ClientTypeNameAr = table.Column<string>(type: "nvarchar(40)", maxLength: 40, nullable: false),
        //            MonetaryAgencyReportID = table.Column<int>(type: "int", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_ClientsType", x => x.ClientTypeID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_CurrenciesBVR",
        //        columns: table => new
        //        {
        //            ID = table.Column<long>(type: "bigint", nullable: false)
        //                .Annotation("SqlServer:Identity", "1, 1"),
        //            CurrencyID = table.Column<int>(type: "int", nullable: false),
        //            ActionType = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false),
        //            ActionID = table.Column<int>(type: "int", nullable: false),
        //            ActionDetailID = table.Column<int>(type: "int", nullable: false),
        //            ActionTime = table.Column<DateTime>(type: "datetime", nullable: false),
        //            Amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            Rate = table.Column<decimal>(type: "decimal(18,14)", nullable: false),
        //            IsProcessed = table.Column<bool>(type: "bit", nullable: false),
        //            Balance = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            ValRate = table.Column<decimal>(type: "decimal(18,14)", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_CurrenciesValRates", x => x.ID);
        //            table.ForeignKey(
        //                name: "FK_EX_CurrenciesValRates_EX_Currencies",
        //                column: x => x.CurrencyID,
        //                principalTable: "Currencies",
        //                principalColumn: "CurrencyID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_CurrenciesMarketPrices",
        //        columns: table => new
        //        {
        //            ID = table.Column<int>(type: "int", nullable: false),
        //            CurrencyID = table.Column<int>(type: "int", nullable: false),
        //            MarketPriceDay = table.Column<DateTime>(type: "datetime", nullable: false),
        //            MarketPrice = table.Column<decimal>(type: "decimal(18,14)", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_CurrenciesMarketPrices", x => x.ID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_ExchangePurposes",
        //        columns: table => new
        //        {
        //            ExchangePurposeID = table.Column<int>(type: "int", nullable: false),
        //            ExchangePurposeNameEn = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
        //            ExchangePurposeNameAr = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_ExchangePurposes", x => x.ExchangePurposeID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_FormingStatus",
        //        columns: table => new
        //        {
        //            FormingStatusID = table.Column<int>(type: "int", nullable: false),
        //            FormingStatusNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            FormingStatusNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            RequireApproval = table.Column<bool>(type: "bit", nullable: false),
        //            RequireReview = table.Column<bool>(type: "bit", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_FormingStatus", x => x.FormingStatusID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_IncomeSources",
        //        columns: table => new
        //        {
        //            IncomeSourceID = table.Column<int>(type: "int", nullable: false),
        //            IncomeSourceNameEn = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
        //            IncomeSourceNameAr = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_IncomeSources", x => x.IncomeSourceID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_InvoiceStatus",
        //        columns: table => new
        //        {
        //            StatusID = table.Column<int>(type: "int", nullable: false),
        //            StatusNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            StatusNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_InvoiceStatus", x => x.StatusID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_InvoicesType",
        //        columns: table => new
        //        {
        //            InvoiceTypeID = table.Column<int>(type: "int", nullable: false),
        //            InvoiceTypeNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            InvoiceTypeNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_InvoicesType", x => x.InvoiceTypeID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_LocallyWanted",
        //        columns: table => new
        //        {
        //            LocallyWantedID = table.Column<int>(type: "int", nullable: false),
        //            Name = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
        //            NID = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_LocallyWanted", x => x.LocallyWantedID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_MonetaryAgency",
        //        columns: table => new
        //        {
        //            MonetaryAgencyReportID = table.Column<int>(type: "int", nullable: false),
        //            MonetaryAgencyReportName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            OrderBy = table.Column<int>(type: "int", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_MonetaryAgency", x => x.MonetaryAgencyReportID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_PaymentMethod",
        //        columns: table => new
        //        {
        //            PaymentMethod = table.Column<int>(type: "int", nullable: false),
        //            PaymentMethodNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
        //            PaymentMethodNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_PaymentMethod", x => x.PaymentMethod);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_StatisticalDataVars",
        //        columns: table => new
        //        {
        //            ID = table.Column<int>(type: "int", nullable: false),
        //            VarCaption = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
        //            VarOrder = table.Column<int>(type: "int", nullable: false),
        //            CellRange = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false),
        //            CellValue = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_StatisticalDataVars", x => x.ID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_SuppliersType",
        //        columns: table => new
        //        {
        //            SupplierTypeID = table.Column<int>(type: "int", nullable: false),
        //            SupplierTypeNameEn = table.Column<string>(type: "nvarchar(40)", maxLength: 40, nullable: false),
        //            SupplierTypeNameAr = table.Column<string>(type: "nvarchar(40)", maxLength: 40, nullable: false),
        //            MonetaryAgencyReportID = table.Column<int>(type: "int", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_SuppliersType", x => x.SupplierTypeID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_WholeInvoiceStatus",
        //        columns: table => new
        //        {
        //            StatusID = table.Column<int>(type: "int", nullable: false),
        //            StatusNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            StatusNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_WholeInvoiceStatus", x => x.StatusID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_WholePaymentMethod",
        //        columns: table => new
        //        {
        //            PaymentMethod = table.Column<int>(type: "int", nullable: false),
        //            PaymentMethodNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
        //            PaymentMethodNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_WholePaymentMethod", x => x.PaymentMethod);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "ISIL_List",
        //        columns: table => new
        //        {
        //            ID = table.Column<int>(type: "int", nullable: false),
        //            UID = table.Column<int>(type: "int", nullable: false),
        //            FullName = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false),
        //            AliasName = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false),
        //            Nationality = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            Address = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_ISIL_List", x => x.ID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "ISIL_XmlData",
        //        columns: table => new
        //        {
        //            ID = table.Column<int>(type: "int", nullable: false),
        //            XmlData = table.Column<string>(type: "xml", nullable: true),
        //            LastUpdate = table.Column<DateTime>(type: "datetime", nullable: true),
        //            IsilLastUpdate = table.Column<DateTime>(type: "datetime", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_ISIL_XmlData", x => x.ID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Permission",
        //        columns: table => new
        //        {
        //            Id = table.Column<long>(type: "bigint", nullable: false)
        //                .Annotation("SqlServer:Identity", "1, 1"),
        //            Name = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
        //            Desc = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Permission", x => x.Id);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Privilage2",
        //        columns: table => new
        //        {
        //            Id = table.Column<long>(type: "bigint", nullable: false)
        //                .Annotation("SqlServer:Identity", "1, 1"),
        //            ScreensId = table.Column<long>(type: "bigint", nullable: true),
        //            PrivilageTypeId = table.Column<long>(type: "bigint", nullable: true),
        //            JobId = table.Column<long>(type: "bigint", nullable: false),
        //            State = table.Column<int>(type: "int", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Role",
        //        columns: table => new
        //        {
        //            Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
        //            CreateUser = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            CreateUserName = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            UpdateUser = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            UpdateUserName = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            CreateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
        //            UpdateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
        //            IsDeleted = table.Column<bool>(type: "bit", nullable: false),
        //            DeleteUserId = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            IsAdmin = table.Column<bool>(type: "bit", nullable: true),
        //            Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            NormalizedName = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Role", x => x.Id);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sec_Forms",
        //        columns: table => new
        //        {
        //            FormID = table.Column<int>(type: "int", nullable: false),
        //            ParentID = table.Column<int>(type: "int", nullable: true),
        //            FormName = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            DisplayNameEn = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            DisplayNameAr = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            FormOrder = table.Column<int>(type: "int", nullable: true),
        //            ShowInLog = table.Column<bool>(type: "bit", nullable: false),
        //            TablesForLog = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            Installed = table.Column<bool>(type: "bit", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sec_Forms", x => x.FormID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sec_Functions",
        //        columns: table => new
        //        {
        //            FunctionID = table.Column<int>(type: "int", nullable: false),
        //            FunctionName = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
        //            FunctionNameEn = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
        //            FunctionNameAr = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
        //            FunctionOrder = table.Column<int>(type: "int", nullable: false),
        //            Logged = table.Column<bool>(type: "bit", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sec_Functions", x => x.FunctionID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sys_Assemblies",
        //        columns: table => new
        //        {
        //            AssemblyID = table.Column<int>(type: "int", nullable: false),
        //            AssemblyName = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
        //            AssemblyFile = table.Column<byte[]>(type: "image", nullable: true),
        //            AssemblyModifiedDate = table.Column<DateTime>(type: "datetime", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sys_Assemblies", x => x.AssemblyID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sys_BranchesAuto",
        //        columns: table => new
        //        {
        //            ID = table.Column<int>(type: "int", nullable: false),
        //            ScheduleTime = table.Column<DateTime>(type: "datetime", nullable: false),
        //            Remarks = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sys_BranchesAuto", x => x.ID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sys_MobileIntegration",
        //        columns: table => new
        //        {
        //            ID = table.Column<int>(type: "int", nullable: false),
        //            ClientIDC = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
        //            IsEnabled = table.Column<bool>(type: "bit", nullable: false),
        //            ApiUrl = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sys_MobileIntegration", x => x.ID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sys_ReplicationSettings",
        //        columns: table => new
        //        {
        //            ID = table.Column<int>(type: "int", nullable: false),
        //            IsEnabled = table.Column<bool>(type: "bit", nullable: false),
        //            IsBranch = table.Column<bool>(type: "bit", nullable: false),
        //            BranchName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
        //            ServiceUrl = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            AccessKeyId = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            SecretAccessKey = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            QueueUrl = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sys_ReplicationSettings", x => x.ID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sys_Settings",
        //        columns: table => new
        //        {
        //            ID = table.Column<int>(type: "int", nullable: false),
        //            SingleLanguage = table.Column<bool>(type: "bit", nullable: false),
        //            ExchangeInvoiceNoScope = table.Column<int>(type: "int", nullable: false),
        //            WholesaleInvoiceNoScope = table.Column<int>(type: "int", nullable: false),
        //            JVNoScope = table.Column<int>(type: "int", nullable: false),
        //            JVNoScopeByType = table.Column<bool>(type: "bit", nullable: false),
        //            ReportHeaderLeft = table.Column<string>(type: "nvarchar(400)", maxLength: 400, nullable: true),
        //            ReportHeaderRight = table.Column<string>(type: "nvarchar(400)", maxLength: 400, nullable: true),
        //            InvoiceFooter = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            WholeInvoiceHeader = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            WholeInvoiceFooter = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            SAMA_Signature1 = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
        //            SAMA_Signature2 = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
        //            SAMA_Signature3 = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
        //            MS_SmtpServer = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
        //            MS_SmtpPort = table.Column<int>(type: "int", nullable: true),
        //            MS_SSL = table.Column<bool>(type: "bit", nullable: false),
        //            MS_Username = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
        //            MS_Password = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
        //            MS_DisplayName = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
        //            MS_NotifySuppliers = table.Column<bool>(type: "bit", nullable: false),
        //            MS_NotifySuppliersInterval = table.Column<int>(type: "int", nullable: false),
        //            MS_NotifySuppliersCC = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
        //            MS_NotifySuppliersMailFooter = table.Column<string>(type: "nvarchar(300)", maxLength: 300, nullable: true),
        //            SAMALimit_Enabled = table.Column<bool>(type: "bit", nullable: false),
        //            SAMALimit_ForSaudi = table.Column<decimal>(type: "decimal(18,0)", nullable: false),
        //            SAMALimit_ForNonSaudi = table.Column<decimal>(type: "decimal(18,0)", nullable: false),
        //            MainServerConString = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
        //            PriceScreen_BackColor = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
        //            PriceScreen_ForeColor = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
        //            AvTaxPercentage = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            EnableLiteValidation = table.Column<bool>(type: "bit", nullable: false),
        //            EnableLogoutWhenIdle = table.Column<bool>(type: "bit", nullable: false),
        //            IdleTimeBeforeLogout = table.Column<int>(type: "int", nullable: false, defaultValue: 600),
        //            InvoiceBgcForSale = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
        //            InvoiceBgcForPurchase = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
        //            PriceScreen_Notes = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sys_Settings", x => x.ID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sys_SystemInfo",
        //        columns: table => new
        //        {
        //            ID = table.Column<int>(type: "int", nullable: false),
        //            InternalData_LastModifiedDate = table.Column<DateTime>(type: "datetime", nullable: false),
        //            ClientIdentifier = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
        //            CompanyNameEn = table.Column<string>(type: "nvarchar(2000)", maxLength: 2000, nullable: true),
        //            CompanyNameAr = table.Column<string>(type: "nvarchar(2000)", maxLength: 2000, nullable: true),
        //            CRNo = table.Column<string>(type: "nvarchar(12)", maxLength: 12, nullable: true),
        //            LicenseNo = table.Column<string>(type: "nvarchar(12)", maxLength: 12, nullable: true),
        //            ReportsLogo = table.Column<byte[]>(type: "varbinary(max)", nullable: true),
        //            EX_SystemCurrencyID = table.Column<int>(type: "int", nullable: false, defaultValue: 1),
        //            EX_InvoiceCompanyNameEn = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            EX_InvoiceCompanyNameAr = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            EX_InvoiceHeader = table.Column<string>(type: "nvarchar(400)", maxLength: 400, nullable: true),
        //            EX_InvoiceFooter = table.Column<string>(type: "nvarchar(1000)", maxLength: 1000, nullable: true),
        //            EX_InvoiceLogo = table.Column<byte[]>(type: "varbinary(max)", nullable: true),
        //            EX_WholesaleInvoiceHeaderEn = table.Column<string>(type: "nvarchar(400)", maxLength: 400, nullable: true),
        //            EX_WholesaleInvoiceHeaderAr = table.Column<string>(type: "nvarchar(400)", maxLength: 400, nullable: true),
        //            EX_PortName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
        //            IsBranch = table.Column<bool>(type: "bit", nullable: false),
        //            BranchName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sys_SystemInfo", x => x.ID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sys_SystemOptions",
        //        columns: table => new
        //        {
        //            ID = table.Column<int>(type: "int", nullable: false),
        //            ClientHasAttachments = table.Column<bool>(type: "bit", nullable: false),
        //            OptimizeImages = table.Column<bool>(type: "bit", nullable: false),
        //            NotifySuppliers = table.Column<bool>(type: "bit", nullable: false),
        //            MembershipProgram = table.Column<bool>(type: "bit", nullable: false),
        //            ISIL = table.Column<bool>(type: "bit", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sys_SystemOptions", x => x.ID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sys_WebsiteIntegration",
        //        columns: table => new
        //        {
        //            ID = table.Column<int>(type: "int", nullable: false),
        //            IsEnabled = table.Column<bool>(type: "bit", nullable: false),
        //            WebsiteUrl = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sys_WebsiteIntegration", x => x.ID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "TechSup_Tickets",
        //        columns: table => new
        //        {
        //            ID = table.Column<int>(type: "int", nullable: false),
        //            CreationDate = table.Column<DateTime>(type: "datetime", nullable: false),
        //            Title = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
        //            Summary = table.Column<string>(type: "nvarchar(max)", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_TechSup_Tickets", x => x.ID);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "User",
        //        columns: table => new
        //        {
        //            Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
        //            FullName = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            ResturantId = table.Column<long>(type: "bigint", nullable: true),
        //            CreateUser = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            CreateUserName = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            UpdateUser = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            UpdateUserName = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            CreateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
        //            UpdateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
        //            IsDeleted = table.Column<bool>(type: "bit", nullable: false),
        //            DeleteUserId = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            UserName = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            NormalizedUserName = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            Email = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            NormalizedEmail = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            EmailConfirmed = table.Column<bool>(type: "bit", nullable: false),
        //            PasswordHash = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            SecurityStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            PhoneNumberConfirmed = table.Column<bool>(type: "bit", nullable: false),
        //            TwoFactorEnabled = table.Column<bool>(type: "bit", nullable: false),
        //            LockoutEnd = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: true),
        //            LockoutEnabled = table.Column<bool>(type: "bit", nullable: false),
        //            AccessFailedCount = table.Column<int>(type: "int", nullable: false),
        //            Type = table.Column<int>(type: "int", nullable: true),
        //            TypeId = table.Column<long>(type: "bigint", nullable: true),
        //            JobId = table.Column<long>(type: "bigint", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_User", x => x.Id);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_Banks",
        //        columns: table => new
        //        {
        //            BankID = table.Column<int>(type: "int", nullable: false),
        //            BankAccountNameEn = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: true),
        //            BankAccountNameAr = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: true),
        //            AccountID = table.Column<int>(type: "int", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_Banks", x => x.BankID);
        //            table.ForeignKey(
        //                name: "FK_EX_Banks_A_Accounts",
        //                column: x => x.AccountID,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_Settings",
        //        columns: table => new
        //        {
        //            ID = table.Column<int>(type: "int", nullable: false),
        //            AccountID_Cash = table.Column<int>(type: "int", nullable: true),
        //            AccountID_InvStart = table.Column<int>(type: "int", nullable: true),
        //            AccountID_Banks = table.Column<int>(type: "int", nullable: true),
        //            AccountID_Suppliers = table.Column<int>(type: "int", nullable: true),
        //            AccountID_Capital = table.Column<int>(type: "int", nullable: true),
        //            AccountID_Commission = table.Column<int>(type: "int", nullable: true),
        //            AccountID_MainBranch = table.Column<int>(type: "int", nullable: true),
        //            AccountID_Purchases = table.Column<int>(type: "int", nullable: true),
        //            AccountID_Sales = table.Column<int>(type: "int", nullable: true),
        //            AccountID_AvTax = table.Column<int>(type: "int", nullable: true),
        //            AccountID_ZakatExp = table.Column<int>(type: "int", nullable: true),
        //            AccountID_ZakatProv = table.Column<int>(type: "int", nullable: true),
        //            AccountID_InvEnd = table.Column<int>(type: "int", nullable: true),
        //            AccountID_ProfitLoss = table.Column<int>(type: "int", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_Settings", x => x.ID);
        //            table.ForeignKey(
        //                name: "FK_EX_Settings_AccountID_Banks",
        //                column: x => x.AccountID_Banks,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //            table.ForeignKey(
        //                name: "FK_EX_Settings_AccountID_Capital",
        //                column: x => x.AccountID_Capital,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //            table.ForeignKey(
        //                name: "FK_EX_Settings_AccountID_Cash",
        //                column: x => x.AccountID_Cash,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //            table.ForeignKey(
        //                name: "FK_EX_Settings_AccountID_Commission",
        //                column: x => x.AccountID_Commission,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //            table.ForeignKey(
        //                name: "FK_EX_Settings_AccountID_Currencies",
        //                column: x => x.AccountID_InvStart,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //            table.ForeignKey(
        //                name: "FK_EX_Settings_AccountID_MainBranch",
        //                column: x => x.AccountID_MainBranch,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //            table.ForeignKey(
        //                name: "FK_EX_Settings_AccountID_Purchases",
        //                column: x => x.AccountID_Purchases,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //            table.ForeignKey(
        //                name: "FK_EX_Settings_AccountID_Sales",
        //                column: x => x.AccountID_Sales,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //            table.ForeignKey(
        //                name: "FK_EX_Settings_AccountID_Suppliers",
        //                column: x => x.AccountID_Suppliers,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //            table.ForeignKey(
        //                name: "FK_EX_Settings_AccountID_Zakat",
        //                column: x => x.AccountID_ZakatExp,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sys_Branches",
        //        columns: table => new
        //        {
        //            BranchID = table.Column<int>(type: "int", nullable: false),
        //            BranchName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            BranchNameEn = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            BranchNameAr = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            DBSynchRequested = table.Column<bool>(type: "bit", nullable: false),
        //            DBSynchStarted = table.Column<bool>(type: "bit", nullable: false),
        //            DBSynchDownloaded = table.Column<bool>(type: "bit", nullable: false),
        //            DBSynchRestored = table.Column<bool>(type: "bit", nullable: false),
        //            DBSynchFinished = table.Column<bool>(type: "bit", nullable: false),
        //            DBSynchLastUpdatedDate = table.Column<DateTime>(type: "datetime", nullable: true),
        //            DBSynchStopped = table.Column<bool>(type: "bit", nullable: false),
        //            DBSynchRemarks = table.Column<string>(type: "nvarchar(1000)", maxLength: 1000, nullable: true),
        //            AccountID = table.Column<int>(type: "int", nullable: true),
        //            LastSyncTime = table.Column<DateTime>(type: "datetime", nullable: true),
        //            LastSyncErrorMessage = table.Column<string>(type: "nvarchar(max)", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sys_Branches", x => x.BranchID);
        //            table.ForeignKey(
        //                name: "FK_Sys_Branches_A_Accounts",
        //                column: x => x.AccountID,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sec_Users",
        //        columns: table => new
        //        {
        //            UserID = table.Column<int>(type: "int", nullable: false),
        //            UserCode = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            UserNameEn = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            UserNameAr = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            LoginName = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false),
        //            Password = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            Enabled = table.Column<bool>(type: "bit", nullable: false),
        //            CreatedDate = table.Column<DateTime>(type: "datetime", nullable: true),
        //            ThemeName = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
        //            IsSupervisor = table.Column<bool>(type: "bit", nullable: false),
        //            LiveExchange = table.Column<bool>(type: "bit", nullable: false),
        //            BranchID = table.Column<int>(type: "int", nullable: true),
        //            LocalIPAddress = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
        //            OnlineStatus = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sec_Users", x => x.UserID);
        //            table.ForeignKey(
        //                name: "FK_Sec_Users_Branches",
        //                column: x => x.BranchID,
        //                principalTable: "EX_Branches",
        //                principalColumn: "BranchID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_InternalTransfers",
        //        columns: table => new
        //        {
        //            TransferID = table.Column<int>(type: "int", nullable: false),
        //            TransferNo = table.Column<int>(type: "int", nullable: false),
        //            TransferDate = table.Column<DateTime>(type: "datetime", nullable: false),
        //            Remarks = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            CashierID = table.Column<int>(type: "int", nullable: false),
        //            Closed = table.Column<bool>(type: "bit", nullable: false),
        //            TransferClosingDate = table.Column<DateTime>(type: "datetime", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_InternalTransfers", x => x.TransferID);
        //            table.ForeignKey(
        //                name: "FK_EX_InternalTransfers_EX_Cashiers",
        //                column: x => x.CashierID,
        //                principalTable: "EX_Cashiers",
        //                principalColumn: "CashierID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_ClientJob",
        //        columns: table => new
        //        {
        //            JobID = table.Column<int>(type: "int", nullable: false),
        //            JobCode = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false),
        //            JobName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
        //            SeverityID = table.Column<int>(type: "int", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_ClientJob", x => x.JobID);
        //            table.ForeignKey(
        //                name: "FK_EX_ClientJob_EX_ClientJobSeverity",
        //                column: x => x.SeverityID,
        //                principalTable: "EX_ClientJobSeverity",
        //                principalColumn: "SeverityID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_Countries",
        //        columns: table => new
        //        {
        //            CountryID = table.Column<int>(type: "int", nullable: false),
        //            CountryNameEn = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
        //            CountryNameAr = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
        //            SeverityID = table.Column<int>(type: "int", nullable: false, defaultValue: 1)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Country", x => x.CountryID);
        //            table.ForeignKey(
        //                name: "FK_Countries_EX_ClientJobSeverity",
        //                column: x => x.SeverityID,
        //                principalTable: "EX_ClientJobSeverity",
        //                principalColumn: "SeverityID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "RolePermission",
        //        columns: table => new
        //        {
        //            Id = table.Column<long>(type: "bigint", nullable: false)
        //                .Annotation("SqlServer:Identity", "1, 1"),
        //            RoleId = table.Column<string>(type: "nvarchar(450)", nullable: true),
        //            PermissionId = table.Column<long>(type: "bigint", nullable: false),
        //            PermissionName = table.Column<string>(type: "nvarchar(max)", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_RolePermission", x => x.Id);
        //            table.ForeignKey(
        //                name: "FK_RolePermission_Permission_PermissionId",
        //                column: x => x.PermissionId,
        //                principalTable: "Permission",
        //                principalColumn: "Id",
        //                onDelete: ReferentialAction.Cascade);
        //            table.ForeignKey(
        //                name: "FK_RolePermission_Role_RoleId",
        //                column: x => x.RoleId,
        //                principalTable: "Role",
        //                principalColumn: "Id");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sec_FormsFunctions",
        //        columns: table => new
        //        {
        //            FormFunctionID = table.Column<int>(type: "int", nullable: false),
        //            FormID = table.Column<int>(type: "int", nullable: false),
        //            FunctionID = table.Column<int>(type: "int", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sec_FormsFunctions", x => x.FormFunctionID);
        //            table.ForeignKey(
        //                name: "FK_Sec_FormsFunctions_Sec_Forms",
        //                column: x => x.FormID,
        //                principalTable: "Sec_Forms",
        //                principalColumn: "FormID",
        //                onDelete: ReferentialAction.Cascade);
        //            table.ForeignKey(
        //                name: "FK_Sec_FormsFunctions_Sec_Functions",
        //                column: x => x.FunctionID,
        //                principalTable: "Sec_Functions",
        //                principalColumn: "FunctionID",
        //                onDelete: ReferentialAction.Cascade);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "RoleUser",
        //        columns: table => new
        //        {
        //            RolesId = table.Column<string>(type: "nvarchar(450)", nullable: false),
        //            UsersId = table.Column<string>(type: "nvarchar(450)", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_RoleUser", x => new { x.RolesId, x.UsersId });
        //            table.ForeignKey(
        //                name: "FK_RoleUser_Role_RolesId",
        //                column: x => x.RolesId,
        //                principalTable: "Role",
        //                principalColumn: "Id",
        //                onDelete: ReferentialAction.Cascade);
        //            table.ForeignKey(
        //                name: "FK_RoleUser_User_UsersId",
        //                column: x => x.UsersId,
        //                principalTable: "User",
        //                principalColumn: "Id",
        //                onDelete: ReferentialAction.Cascade);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_BranchTransfers",
        //        columns: table => new
        //        {
        //            VoucherID = table.Column<int>(type: "int", nullable: false),
        //            VoucherNo = table.Column<int>(type: "int", nullable: false),
        //            VoucherDate = table.Column<DateTime>(type: "datetime", nullable: false),
        //            VoucherTime = table.Column<DateTime>(type: "datetime", nullable: false),
        //            CashierID = table.Column<int>(type: "int", nullable: false),
        //            Receptionist = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
        //            Remarks = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            TypeID = table.Column<int>(type: "int", nullable: false),
        //            BranchID = table.Column<int>(type: "int", nullable: true),
        //            StatusID = table.Column<int>(type: "int", nullable: false, defaultValue: 1)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_BranchTransfers", x => x.VoucherID);
        //            table.ForeignKey(
        //                name: "FK_EX_BranchTransfers_EX_BranchTransferStatus",
        //                column: x => x.StatusID,
        //                principalTable: "EX_BranchTransferStatus",
        //                principalColumn: "StatusID");
        //            table.ForeignKey(
        //                name: "FK_EX_BranchTransfers_EX_BranchTransferType",
        //                column: x => x.TypeID,
        //                principalTable: "EX_BranchTransferType",
        //                principalColumn: "TypeID");
        //            table.ForeignKey(
        //                name: "FK_EX_BranchTransfers_EX_Cashiers",
        //                column: x => x.CashierID,
        //                principalTable: "EX_Cashiers",
        //                principalColumn: "CashierID");
        //            table.ForeignKey(
        //                name: "FK_EX_BranchTransfers_Sys_Branches",
        //                column: x => x.BranchID,
        //                principalTable: "Sys_Branches",
        //                principalColumn: "BranchID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sec_TransactionLog",
        //        columns: table => new
        //        {
        //            LogID = table.Column<int>(type: "int", nullable: false),
        //            UserID = table.Column<int>(type: "int", nullable: false),
        //            FormID = table.Column<int>(type: "int", nullable: false),
        //            FunctionID = table.Column<int>(type: "int", nullable: false),
        //            ItemID = table.Column<int>(type: "int", nullable: false),
        //            ItemNo = table.Column<int>(type: "int", nullable: false),
        //            ActionDate = table.Column<DateTime>(type: "datetime", nullable: false),
        //            ActionDetails = table.Column<string>(type: "nvarchar(max)", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sec_TransactionLog", x => x.LogID);
        //            table.ForeignKey(
        //                name: "FK_Sec_TransactionLog_Sec_Forms",
        //                column: x => x.FormID,
        //                principalTable: "Sec_Forms",
        //                principalColumn: "FormID");
        //            table.ForeignKey(
        //                name: "FK_Sec_TransactionLog_Sec_Functions",
        //                column: x => x.FunctionID,
        //                principalTable: "Sec_Functions",
        //                principalColumn: "FunctionID");
        //            table.ForeignKey(
        //                name: "FK_Sec_TransactionLog_Sec_Users",
        //                column: x => x.UserID,
        //                principalTable: "Sec_Users",
        //                principalColumn: "UserID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sec_UsersForms",
        //        columns: table => new
        //        {
        //            ID = table.Column<int>(type: "int", nullable: false),
        //            UserID = table.Column<int>(type: "int", nullable: false),
        //            FormID = table.Column<int>(type: "int", nullable: false),
        //            Selected = table.Column<bool>(type: "bit", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sec_UsersForms", x => x.ID);
        //            table.ForeignKey(
        //                name: "FK_Sec_UsersForms_Sec_Forms",
        //                column: x => x.FormID,
        //                principalTable: "Sec_Forms",
        //                principalColumn: "FormID",
        //                onDelete: ReferentialAction.Cascade);
        //            table.ForeignKey(
        //                name: "FK_Sec_UsersForms_Sec_Users",
        //                column: x => x.UserID,
        //                principalTable: "Sec_Users",
        //                principalColumn: "UserID",
        //                onDelete: ReferentialAction.Cascade);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sys_Backups",
        //        columns: table => new
        //        {
        //            BackupID = table.Column<int>(type: "int", nullable: false),
        //            BackupFilePath = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: false),
        //            BackupDateTime = table.Column<DateTime>(type: "datetime", nullable: false),
        //            BackupAssemblyDate = table.Column<DateTime>(type: "datetime", nullable: false),
        //            UserID = table.Column<int>(type: "int", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sys_Backups", x => x.BackupID);
        //            table.ForeignKey(
        //                name: "FK_Sys_Backups_Sec_Users",
        //                column: x => x.UserID,
        //                principalTable: "Sec_Users",
        //                principalColumn: "UserID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_InternalTransfersClosingDetails",
        //        columns: table => new
        //        {
        //            TransferClosingDetailID = table.Column<int>(type: "int", nullable: false),
        //            TransferID = table.Column<int>(type: "int", nullable: false),
        //            CurrencyID = table.Column<int>(type: "int", nullable: false),
        //            ActualRemainder = table.Column<decimal>(type: "decimal(18,2)", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_InternalTransfers_ClosingDetails", x => x.TransferClosingDetailID);
        //            table.ForeignKey(
        //                name: "FK_EX_InternalTransfersClosingDetails_EX_InternalTransfers",
        //                column: x => x.TransferID,
        //                principalTable: "EX_InternalTransfers",
        //                principalColumn: "TransferID",
        //                onDelete: ReferentialAction.Cascade);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_InternalTransfersDetails",
        //        columns: table => new
        //        {
        //            TransferDetailID = table.Column<int>(type: "int", nullable: false),
        //            TransferID = table.Column<int>(type: "int", nullable: false),
        //            CurrencyID = table.Column<int>(type: "int", nullable: false),
        //            TransferTime = table.Column<DateTime>(type: "datetime", nullable: false),
        //            TransferAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            TransferType = table.Column<int>(type: "int", nullable: false, defaultValue: 1),
        //            TransferWithUserID = table.Column<int>(type: "int", nullable: true),
        //            TransferRemarks = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_InternalTransfers_Details", x => x.TransferDetailID);
        //            table.ForeignKey(
        //                name: "FK_EX_InternalTransfers_Details_EX_InternalTransfers",
        //                column: x => x.TransferID,
        //                principalTable: "EX_InternalTransfers",
        //                principalColumn: "TransferID",
        //                onDelete: ReferentialAction.Cascade);
        //            table.ForeignKey(
        //                name: "FK_EX_InternalTransfers_Details_Ex_Currencies",
        //                column: x => x.CurrencyID,
        //                principalTable: "Currencies",
        //                principalColumn: "CurrencyID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_InternalTransfersDetailsTemp",
        //        columns: table => new
        //        {
        //            TransferDetailID = table.Column<int>(type: "int", nullable: false),
        //            TransferID = table.Column<int>(type: "int", nullable: false),
        //            CurrencyID = table.Column<int>(type: "int", nullable: false),
        //            TransferTime = table.Column<DateTime>(type: "datetime", nullable: false),
        //            TransferAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            TransferType = table.Column<int>(type: "int", nullable: false, defaultValue: 1),
        //            TransferWithUserID = table.Column<int>(type: "int", nullable: true),
        //            TransferRemarks = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            ParentTransferDetailID = table.Column<int>(type: "int", nullable: true),
        //            IsAccepted = table.Column<bool>(type: "bit", nullable: true),
        //            IsNotified = table.Column<bool>(type: "bit", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_InternalTransfersDetailsTemp", x => x.TransferDetailID);
        //            table.ForeignKey(
        //                name: "FK_EX_InternalTransfersDetailsTemp_EX_Currencies",
        //                column: x => x.CurrencyID,
        //                principalTable: "Currencies",
        //                principalColumn: "CurrencyID");
        //            table.ForeignKey(
        //                name: "FK_EX_InternalTransfersDetailsTemp_EX_InternalTransfers",
        //                column: x => x.TransferID,
        //                principalTable: "EX_InternalTransfers",
        //                principalColumn: "TransferID",
        //                onDelete: ReferentialAction.Cascade);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_IDSources",
        //        columns: table => new
        //        {
        //            IDSourceID = table.Column<int>(type: "int", nullable: false),
        //            IDSourceNameEn = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
        //            IDSourceNameAr = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
        //            CountryID = table.Column<int>(type: "int", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_IDSources", x => x.IDSourceID);
        //            table.ForeignKey(
        //                name: "FK_EX_IDSources_Countries",
        //                column: x => x.CountryID,
        //                principalTable: "EX_Countries",
        //                principalColumn: "CountryID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_Suppliers",
        //        columns: table => new
        //        {
        //            SupplierID = table.Column<int>(type: "int", nullable: false),
        //            SupplierCode = table.Column<int>(type: "int", nullable: false),
        //            SupplierNameEn = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
        //            SupplierNameAr = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
        //            Phone = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
        //            Fax = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
        //            Email = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            SupplierTypeID = table.Column<int>(type: "int", nullable: true),
        //            CountryID = table.Column<int>(type: "int", nullable: true),
        //            BankAccount = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            CurrencyID = table.Column<int>(type: "int", nullable: false),
        //            CurrencyExRate = table.Column<decimal>(type: "decimal(18,8)", nullable: false),
        //            AccountID = table.Column<int>(type: "int", nullable: true),
        //            CRNumber = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: true),
        //            CRExpiredDate = table.Column<DateTime>(type: "datetime", nullable: true),
        //            UnifiedNumber = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: true),
        //            LicenseNo = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: true),
        //            LicenseExpiredDate = table.Column<DateTime>(type: "datetime", nullable: true),
        //            CreditLimit = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
        //            BranchID = table.Column<int>(type: "int", nullable: true),
        //            IsMainBranch = table.Column<bool>(type: "bit", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_Suppliers", x => x.SupplierID);
        //            table.ForeignKey(
        //                name: "FK_EX_Suppliers_A_Accounts",
        //                column: x => x.AccountID,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //            table.ForeignKey(
        //                name: "FK_EX_Suppliers_Countries",
        //                column: x => x.CountryID,
        //                principalTable: "EX_Countries",
        //                principalColumn: "CountryID");
        //            table.ForeignKey(
        //                name: "FK_EX_Suppliers_EX_Currencies",
        //                column: x => x.CurrencyID,
        //                principalTable: "Currencies",
        //                principalColumn: "CurrencyID");
        //            table.ForeignKey(
        //                name: "FK_EX_Suppliers_EX_SuppliersType",
        //                column: x => x.SupplierTypeID,
        //                principalTable: "EX_SuppliersType",
        //                principalColumn: "SupplierTypeID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "Sec_UsersFunctions",
        //        columns: table => new
        //        {
        //            ID = table.Column<int>(type: "int", nullable: false),
        //            UserID = table.Column<int>(type: "int", nullable: false),
        //            FormFunctionID = table.Column<int>(type: "int", nullable: false),
        //            Selected = table.Column<bool>(type: "bit", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_Sec_UsersFunctions", x => x.ID);
        //            table.ForeignKey(
        //                name: "FK_Sec_UsersFunctions_Sec_FormsFunctions",
        //                column: x => x.FormFunctionID,
        //                principalTable: "Sec_FormsFunctions",
        //                principalColumn: "FormFunctionID",
        //                onDelete: ReferentialAction.Cascade);
        //            table.ForeignKey(
        //                name: "FK_Sec_UsersFunctions_Sec_Users",
        //                column: x => x.UserID,
        //                principalTable: "Sec_Users",
        //                principalColumn: "UserID",
        //                onDelete: ReferentialAction.Cascade);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_BranchTransfersDetails",
        //        columns: table => new
        //        {
        //            VoucherDetailID = table.Column<int>(type: "int", nullable: false),
        //            VoucherID = table.Column<int>(type: "int", nullable: false),
        //            CurrencyID = table.Column<int>(type: "int", nullable: false),
        //            Amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            ExRate = table.Column<decimal>(type: "decimal(18,14)", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_BranchTransfersDetails", x => x.VoucherDetailID);
        //            table.ForeignKey(
        //                name: "FK_EX_BranchTransfersDetails_EX_BranchTransfers",
        //                column: x => x.VoucherID,
        //                principalTable: "EX_BranchTransfers",
        //                principalColumn: "VoucherID",
        //                onDelete: ReferentialAction.Cascade);
        //            table.ForeignKey(
        //                name: "FK_EX_BranchTransfersDetails_EX_Currencies",
        //                column: x => x.CurrencyID,
        //                principalTable: "Currencies",
        //                principalColumn: "CurrencyID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_Clients",
        //        columns: table => new
        //        {
        //            ClientID = table.Column<int>(type: "int", nullable: false),
        //            ClientCode = table.Column<string>(type: "nvarchar(16)", maxLength: 16, nullable: false),
        //            ClientNameEn = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
        //            ClientNameAr = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
        //            ClientTypeID = table.Column<int>(type: "int", nullable: false),
        //            CountryID = table.Column<int>(type: "int", nullable: true),
        //            IDTypeID = table.Column<int>(type: "int", nullable: true),
        //            IDNumber = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
        //            IDSource = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
        //            IDExpiryDate = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: true),
        //            Mobile = table.Column<string>(type: "nvarchar(15)", maxLength: 15, nullable: true),
        //            Sponsor = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
        //            SuspiciousCount = table.Column<int>(type: "int", nullable: false),
        //            SuspiciousUpdated = table.Column<bool>(type: "bit", nullable: false),
        //            JobTitle = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
        //            Income = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
        //            IncomeSource = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
        //            PurposeOfExchange = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
        //            Capital = table.Column<decimal>(type: "decimal(18,0)", nullable: true),
        //            Specialty = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
        //            CRExpiryDate = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: true),
        //            Address = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            JobID = table.Column<int>(type: "int", nullable: true),
        //            SuspiciousCountLocal = table.Column<int>(type: "int", nullable: false),
        //            HasFullData = table.Column<bool>(type: "bit", nullable: false),
        //            Birthdate = table.Column<DateTime>(type: "datetime", nullable: true),
        //            IDExpiredDate = table.Column<DateTime>(type: "datetime", nullable: true),
        //            CRExpiredDate = table.Column<DateTime>(type: "datetime", nullable: true),
        //            JobAuthority = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
        //            OthrePhone = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
        //            OtherMobile = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
        //            CRNumber = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: true),
        //            UnifiedNumber = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: true),
        //            CreationDate = table.Column<DateTime>(type: "datetime", nullable: true),
        //            IDSourceID = table.Column<int>(type: "int", nullable: true),
        //            IncomeSourceID = table.Column<int>(type: "int", nullable: true),
        //            ExchangePurposeID = table.Column<int>(type: "int", nullable: true),
        //            IsSuspended = table.Column<bool>(type: "bit", nullable: false),
        //            BirthCountryID = table.Column<int>(type: "int", nullable: true),
        //            BirthCityID = table.Column<int>(type: "int", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_Clients", x => x.ClientID);
        //            table.ForeignKey(
        //                name: "FK_EX_Clients_BirthCity",
        //                column: x => x.BirthCityID,
        //                principalTable: "EX_IDSources",
        //                principalColumn: "IDSourceID");
        //            table.ForeignKey(
        //                name: "FK_EX_Clients_BirthCountry",
        //                column: x => x.BirthCountryID,
        //                principalTable: "EX_Countries",
        //                principalColumn: "CountryID");
        //            table.ForeignKey(
        //                name: "FK_EX_Clients_EX_ExchangePurposes",
        //                column: x => x.ExchangePurposeID,
        //                principalTable: "EX_ExchangePurposes",
        //                principalColumn: "ExchangePurposeID");
        //            table.ForeignKey(
        //                name: "FK_EX_Clients_EX_IDSources",
        //                column: x => x.IDSourceID,
        //                principalTable: "EX_IDSources",
        //                principalColumn: "IDSourceID");
        //            table.ForeignKey(
        //                name: "FK_EX_Clients_EX_IncomeSources",
        //                column: x => x.IncomeSourceID,
        //                principalTable: "EX_IncomeSources",
        //                principalColumn: "IncomeSourceID");
        //            table.ForeignKey(
        //                name: "FK_EX_Clients_Nationality",
        //                column: x => x.CountryID,
        //                principalTable: "EX_Countries",
        //                principalColumn: "CountryID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "A_CashFlow",
        //        columns: table => new
        //        {
        //            VoucherID = table.Column<int>(type: "int", nullable: false),
        //            VoucherNo = table.Column<int>(type: "int", nullable: false),
        //            VoucherDate = table.Column<DateTime>(type: "datetime", nullable: false),
        //            VoucherTime = table.Column<DateTime>(type: "datetime", nullable: false),
        //            VoucherTypeID = table.Column<int>(type: "int", nullable: false),
        //            SupplierID = table.Column<int>(type: "int", nullable: false),
        //            PaymentMethod = table.Column<int>(type: "int", nullable: false),
        //            CheckNo = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
        //            BankID = table.Column<int>(type: "int", nullable: true),
        //            Amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            CurrencyID = table.Column<int>(type: "int", nullable: false),
        //            Remarks = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            UserID = table.Column<int>(type: "int", nullable: false),
        //            StatusID = table.Column<int>(type: "int", nullable: false, defaultValue: 1)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_A_CashFlow", x => x.VoucherID);
        //            table.ForeignKey(
        //                name: "FK_A_CashFlow_A_CashFlowStatus",
        //                column: x => x.StatusID,
        //                principalTable: "A_CashFlowStatus",
        //                principalColumn: "StatusID");
        //            table.ForeignKey(
        //                name: "FK_A_CashFlow_A_CashFlowType",
        //                column: x => x.VoucherTypeID,
        //                principalTable: "A_CashFlowType",
        //                principalColumn: "VoucherTypeID");
        //            table.ForeignKey(
        //                name: "FK_A_CashFlow_EX_Currencies",
        //                column: x => x.CurrencyID,
        //                principalTable: "Currencies",
        //                principalColumn: "CurrencyID");
        //            table.ForeignKey(
        //                name: "FK_A_CashFlow_EX_Suppliers",
        //                column: x => x.SupplierID,
        //                principalTable: "EX_Suppliers",
        //                principalColumn: "SupplierID");
        //            table.ForeignKey(
        //                name: "FK_A_CashFlow_Sec_Users",
        //                column: x => x.UserID,
        //                principalTable: "Sec_Users",
        //                principalColumn: "UserID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_WholeInvoices",
        //        columns: table => new
        //        {
        //            InvoiceID = table.Column<int>(type: "int", nullable: false),
        //            InvoiceNo = table.Column<int>(type: "int", nullable: false),
        //            InvoiceDate = table.Column<DateTime>(type: "datetime", nullable: false),
        //            InvoiceTime = table.Column<DateTime>(type: "datetime", nullable: false),
        //            CashierID = table.Column<int>(type: "int", nullable: false),
        //            InvoiceTypeID = table.Column<int>(type: "int", nullable: false),
        //            SupplierID = table.Column<int>(type: "int", nullable: false),
        //            SupplierCurrencyID = table.Column<int>(type: "int", nullable: false),
        //            SupplierCurrencyExRate = table.Column<decimal>(type: "decimal(18,8)", nullable: false),
        //            PaymentMethod = table.Column<int>(type: "int", nullable: false),
        //            BankID = table.Column<int>(type: "int", nullable: true),
        //            Receptionist = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
        //            Remarks = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            Paid = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            Remain = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            StatusID = table.Column<int>(type: "int", nullable: false, defaultValue: 1),
        //            IsNotified = table.Column<bool>(type: "bit", nullable: false),
        //            UpdatedCount = table.Column<int>(type: "int", nullable: false),
        //            AvTaxPercentage = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            AvTaxAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_WholeInvoices", x => x.InvoiceID);
        //            table.ForeignKey(
        //                name: "FK_EX_WholeInvoices_EX_Banks",
        //                column: x => x.BankID,
        //                principalTable: "EX_Banks",
        //                principalColumn: "BankID");
        //            table.ForeignKey(
        //                name: "FK_EX_WholeInvoices_EX_Cashiers",
        //                column: x => x.CashierID,
        //                principalTable: "EX_Cashiers",
        //                principalColumn: "CashierID");
        //            table.ForeignKey(
        //                name: "FK_EX_WholeInvoices_EX_Currencies",
        //                column: x => x.SupplierCurrencyID,
        //                principalTable: "Currencies",
        //                principalColumn: "CurrencyID");
        //            table.ForeignKey(
        //                name: "FK_EX_WholeInvoices_EX_InvoicesType",
        //                column: x => x.InvoiceTypeID,
        //                principalTable: "EX_InvoicesType",
        //                principalColumn: "InvoiceTypeID");
        //            table.ForeignKey(
        //                name: "FK_EX_WholeInvoices_EX_Suppliers",
        //                column: x => x.SupplierID,
        //                principalTable: "EX_Suppliers",
        //                principalColumn: "SupplierID");
        //            table.ForeignKey(
        //                name: "FK_EX_WholeInvoices_EX_WholeInvoiceStatus",
        //                column: x => x.StatusID,
        //                principalTable: "EX_WholeInvoiceStatus",
        //                principalColumn: "StatusID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_ClientsAttachments",
        //        columns: table => new
        //        {
        //            ClientAttachmentID = table.Column<int>(type: "int", nullable: false),
        //            ClientID = table.Column<int>(type: "int", nullable: false),
        //            AttachmentTypeID = table.Column<int>(type: "int", nullable: true),
        //            IsOptimized = table.Column<bool>(type: "bit", nullable: false),
        //            AttachmentFilePath = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: true),
        //            AttachmentName = table.Column<string>(type: "nvarchar(max)", nullable: true),
        //            HasAttachment = table.Column<bool>(type: "bit", nullable: false),
        //            HasAttachmentPdf = table.Column<bool>(type: "bit", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_ClientsAttachments", x => x.ClientAttachmentID);
        //            table.ForeignKey(
        //                name: "FK_EX_ClientsAttachments_EX_AttachmentType",
        //                column: x => x.AttachmentTypeID,
        //                principalTable: "EX_AttachmentType",
        //                principalColumn: "TypeID");
        //            table.ForeignKey(
        //                name: "FK_EX_ClientsAttachments_EX_Clients",
        //                column: x => x.ClientID,
        //                principalTable: "EX_Clients",
        //                principalColumn: "ClientID",
        //                onDelete: ReferentialAction.Cascade);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_ClientsMemberships",
        //        columns: table => new
        //        {
        //            MembershipID = table.Column<int>(type: "int", nullable: false),
        //            ClientID = table.Column<int>(type: "int", nullable: false),
        //            CreationDate = table.Column<DateTime>(type: "datetime", nullable: true),
        //            StartDate = table.Column<DateTime>(type: "datetime", nullable: false),
        //            EndDate = table.Column<DateTime>(type: "datetime", nullable: false),
        //            JobTitle = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
        //            Salary = table.Column<decimal>(type: "decimal(18,0)", nullable: false),
        //            HasAttachment = table.Column<bool>(type: "bit", nullable: true),
        //            HasAttachmentPdf = table.Column<bool>(type: "bit", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_ClientMemberships", x => x.MembershipID);
        //            table.ForeignKey(
        //                name: "FK_EX_ClientMemberships_EX_Clients",
        //                column: x => x.ClientID,
        //                principalTable: "EX_Clients",
        //                principalColumn: "ClientID",
        //                onDelete: ReferentialAction.Cascade);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_ClientsRepresentatives",
        //        columns: table => new
        //        {
        //            RepresentativeID = table.Column<int>(type: "int", nullable: false),
        //            ClientID = table.Column<int>(type: "int", nullable: false),
        //            RepresentativeName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
        //            IsOptimized = table.Column<bool>(type: "bit", nullable: false),
        //            HasAttachment = table.Column<bool>(type: "bit", nullable: true),
        //            HasAttachmentPdf = table.Column<bool>(type: "bit", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_ClientsRepresentatives", x => x.RepresentativeID);
        //            table.ForeignKey(
        //                name: "FK_EX_ClientsRepresentatives_EX_Clients",
        //                column: x => x.ClientID,
        //                principalTable: "EX_Clients",
        //                principalColumn: "ClientID",
        //                onDelete: ReferentialAction.Cascade);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_Invoices",
        //        columns: table => new
        //        {
        //            InvoiceID = table.Column<int>(type: "int", nullable: false),
        //            InvoiceNo = table.Column<int>(type: "int", nullable: false),
        //            InvoiceDate = table.Column<DateTime>(type: "datetime", nullable: false),
        //            InvoiceTime = table.Column<DateTime>(type: "datetime", nullable: false),
        //            CashierID = table.Column<int>(type: "int", nullable: false),
        //            InvoiceTypeID = table.Column<int>(type: "int", nullable: false),
        //            ClientID = table.Column<int>(type: "int", nullable: true),
        //            PaymentMethod = table.Column<int>(type: "int", nullable: false),
        //            BankID = table.Column<int>(type: "int", nullable: true),
        //            Commission = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            Paid = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            Remain = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            StatusID = table.Column<int>(type: "int", nullable: false, defaultValue: 1),
        //            InternalTransferID = table.Column<int>(type: "int", nullable: true),
        //            AvTaxPercentage = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            AvTaxAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            PurposeOfExchange = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
        //            Remarks = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            FormingStatusIDs = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false, defaultValueSql: "((1))"),
        //            FormingResponsibleID = table.Column<int>(type: "int", nullable: true),
        //            IsPOS = table.Column<bool>(type: "bit", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_Invoices", x => x.InvoiceID);
        //            table.ForeignKey(
        //                name: "FK_EX_Invoices_EX_Banks",
        //                column: x => x.BankID,
        //                principalTable: "EX_Banks",
        //                principalColumn: "BankID");
        //            table.ForeignKey(
        //                name: "FK_EX_Invoices_EX_Cashiers",
        //                column: x => x.CashierID,
        //                principalTable: "EX_Cashiers",
        //                principalColumn: "CashierID");
        //            table.ForeignKey(
        //                name: "FK_EX_Invoices_EX_Clients",
        //                column: x => x.ClientID,
        //                principalTable: "EX_Clients",
        //                principalColumn: "ClientID");
        //            table.ForeignKey(
        //                name: "FK_EX_Invoices_EX_InternalTransfers",
        //                column: x => x.InternalTransferID,
        //                principalTable: "EX_InternalTransfers",
        //                principalColumn: "TransferID");
        //            table.ForeignKey(
        //                name: "FK_EX_Invoices_EX_InvoiceStatus",
        //                column: x => x.StatusID,
        //                principalTable: "EX_InvoiceStatus",
        //                principalColumn: "StatusID");
        //            table.ForeignKey(
        //                name: "FK_EX_Invoices_EX_InvoicesType",
        //                column: x => x.InvoiceTypeID,
        //                principalTable: "EX_InvoicesType",
        //                principalColumn: "InvoiceTypeID");
        //            table.ForeignKey(
        //                name: "FK_EX_Invoices_Sec_Users",
        //                column: x => x.FormingResponsibleID,
        //                principalTable: "Sec_Users",
        //                principalColumn: "UserID");
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_WholeInvoicesDetails",
        //        columns: table => new
        //        {
        //            InvoiceDetailID = table.Column<int>(type: "int", nullable: false),
        //            InvoiceID = table.Column<int>(type: "int", nullable: false),
        //            CurrencyID = table.Column<int>(type: "int", nullable: false),
        //            Amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            SupplierExRate = table.Column<decimal>(type: "decimal(18,14)", nullable: false),
        //            SystemExRate = table.Column<decimal>(type: "decimal(18,8)", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_WholeInvoices_Details", x => x.InvoiceDetailID);
        //            table.ForeignKey(
        //                name: "FK_EX_WholeInvoices_Details_EX_Currencies",
        //                column: x => x.CurrencyID,
        //                principalTable: "Currencies",
        //                principalColumn: "CurrencyID");
        //            table.ForeignKey(
        //                name: "FK_EX_WholeInvoices_Details_EX_WholeInvoices",
        //                column: x => x.InvoiceID,
        //                principalTable: "EX_WholeInvoices",
        //                principalColumn: "InvoiceID",
        //                onDelete: ReferentialAction.Cascade);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "A_JVs",
        //        columns: table => new
        //        {
        //            JVID = table.Column<int>(type: "int", nullable: false),
        //            JVNo = table.Column<int>(type: "int", nullable: false),
        //            JVDate = table.Column<DateTime>(type: "datetime", nullable: false),
        //            JVTime = table.Column<DateTime>(type: "datetime", nullable: false),
        //            JVTypeID = table.Column<int>(type: "int", nullable: false),
        //            JVStatusID = table.Column<int>(type: "int", nullable: false),
        //            Remarks = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
        //            Generated = table.Column<bool>(type: "bit", nullable: false),
        //            InvoiceID = table.Column<int>(type: "int", nullable: true),
        //            WholeInvoiceID = table.Column<int>(type: "int", nullable: true),
        //            CashFlowID = table.Column<int>(type: "int", nullable: true),
        //            BranchTransferID = table.Column<int>(type: "int", nullable: true)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_A_JVs", x => x.JVID);
        //            table.ForeignKey(
        //                name: "FK_A_JVs_A_CashFlow",
        //                column: x => x.CashFlowID,
        //                principalTable: "A_CashFlow",
        //                principalColumn: "VoucherID",
        //                onDelete: ReferentialAction.Cascade);
        //            table.ForeignKey(
        //                name: "FK_A_JVs_A_JVStatus",
        //                column: x => x.JVStatusID,
        //                principalTable: "A_JVStatus",
        //                principalColumn: "StatusID");
        //            table.ForeignKey(
        //                name: "FK_A_JVs_A_JVType",
        //                column: x => x.JVTypeID,
        //                principalTable: "A_JVType",
        //                principalColumn: "JVTypeID");
        //            table.ForeignKey(
        //                name: "FK_A_JVs_EX_BranchTransfers",
        //                column: x => x.BranchTransferID,
        //                principalTable: "EX_BranchTransfers",
        //                principalColumn: "VoucherID",
        //                onDelete: ReferentialAction.Cascade);
        //            table.ForeignKey(
        //                name: "FK_A_JVs_EX_Invoices",
        //                column: x => x.InvoiceID,
        //                principalTable: "EX_Invoices",
        //                principalColumn: "InvoiceID",
        //                onDelete: ReferentialAction.Cascade);
        //            table.ForeignKey(
        //                name: "FK_A_JVs_EX_WholeInvoices",
        //                column: x => x.WholeInvoiceID,
        //                principalTable: "EX_WholeInvoices",
        //                principalColumn: "InvoiceID",
        //                onDelete: ReferentialAction.Cascade);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "EX_InvoicesDetails",
        //        columns: table => new
        //        {
        //            InvoiceDetailID = table.Column<int>(type: "int", nullable: false),
        //            InvoiceID = table.Column<int>(type: "int", nullable: false),
        //            CurrencyID = table.Column<int>(type: "int", nullable: false),
        //            Amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            ExRate = table.Column<decimal>(type: "decimal(18,14)", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_EX_InvoicesDetails", x => x.InvoiceDetailID);
        //            table.ForeignKey(
        //                name: "FK_EX_InvoicesDetails_EX_Currencies",
        //                column: x => x.CurrencyID,
        //                principalTable: "Currencies",
        //                principalColumn: "CurrencyID");
        //            table.ForeignKey(
        //                name: "FK_EX_InvoicesDetails_EX_Invoices",
        //                column: x => x.InvoiceID,
        //                principalTable: "EX_Invoices",
        //                principalColumn: "InvoiceID",
        //                onDelete: ReferentialAction.Cascade);
        //        });

        //    migrationBuilder.CreateTable(
        //        name: "A_JVsDetails",
        //        columns: table => new
        //        {
        //            JVDetailID = table.Column<int>(type: "int", nullable: false),
        //            JVID = table.Column<int>(type: "int", nullable: false),
        //            AccountID = table.Column<int>(type: "int", nullable: false),
        //            CurrencyID = table.Column<int>(type: "int", nullable: false),
        //            ForeignDebit = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
        //            ForeignCredit = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
        //            Debit = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
        //            Credit = table.Column<decimal>(type: "decimal(18,2)", nullable: false)
        //        },
        //        constraints: table =>
        //        {
        //            table.PrimaryKey("PK_A_JVsDetails", x => x.JVDetailID);
        //            table.ForeignKey(
        //                name: "FK_A_JVsDetails_A_Accounts",
        //                column: x => x.AccountID,
        //                principalTable: "A_Accounts",
        //                principalColumn: "AccountID");
        //            table.ForeignKey(
        //                name: "FK_A_JVsDetails_A_JVs",
        //                column: x => x.JVID,
        //                principalTable: "A_JVs",
        //                principalColumn: "JVID",
        //                onDelete: ReferentialAction.Cascade);
        //            table.ForeignKey(
        //                name: "FK_A_JVsDetails_EX_Currencies",
        //                column: x => x.CurrencyID,
        //                principalTable: "Currencies",
        //                principalColumn: "CurrencyID");
        //        });

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Currencies",
        //        table: "Currencies",
        //        column: "CurrencyID");

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_EX_Currencies_Code",
        //        table: "Currencies",
        //        column: "CurrencyCode",
        //        unique: true);

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_Ex_Currencies_NameAr",
        //        table: "Currencies",
        //        column: "CurrencyNameAr",
        //        unique: true,
        //        filter: "[CurrencyNameAr] IS NOT NULL");

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_Ex_Currencies_NameEn",
        //        table: "Currencies",
        //        column: "CurrencyNameEn",
        //        unique: true,
        //        filter: "[CurrencyNameEn] IS NOT NULL");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_Accounts_DepreciationAccountID",
        //        table: "A_Accounts",
        //        column: "DepreciationAccountID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_Accounts_ParentID",
        //        table: "A_Accounts",
        //        column: "ParentID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_Accounts_ProvisionAccountID",
        //        table: "A_Accounts",
        //        column: "ProvisionAccountID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_CashFlow_CurrencyID",
        //        table: "A_CashFlow",
        //        column: "CurrencyID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_CashFlow_StatusID",
        //        table: "A_CashFlow",
        //        column: "StatusID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_CashFlow_SupplierID",
        //        table: "A_CashFlow",
        //        column: "SupplierID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_CashFlow_UserID",
        //        table: "A_CashFlow",
        //        column: "UserID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_CashFlow_VoucherTypeID",
        //        table: "A_CashFlow",
        //        column: "VoucherTypeID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_JVs_01",
        //        table: "A_JVs",
        //        columns: new[] { "Generated", "JVTime" });

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_JVs_BranchTransferID",
        //        table: "A_JVs",
        //        column: "BranchTransferID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_JVs_CashFlowID",
        //        table: "A_JVs",
        //        column: "CashFlowID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_JVs_InvoiceID",
        //        table: "A_JVs",
        //        column: "InvoiceID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_JVs_JVStatusID",
        //        table: "A_JVs",
        //        column: "JVStatusID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_JVs_JVTypeID",
        //        table: "A_JVs",
        //        column: "JVTypeID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_JVs_WholeInvoiceID",
        //        table: "A_JVs",
        //        column: "WholeInvoiceID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_JVsDetails_01",
        //        table: "A_JVsDetails",
        //        column: "CurrencyID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_JVsDetails_02",
        //        table: "A_JVsDetails",
        //        column: "JVID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_A_JVsDetails_AccountID",
        //        table: "A_JVsDetails",
        //        column: "AccountID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_CurrenciesMains_CountryId",
        //        table: "CurrenciesMains",
        //        column: "CountryId");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Banks_AccountID",
        //        table: "EX_Banks",
        //        column: "AccountID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_BranchTransfers_BranchID",
        //        table: "EX_BranchTransfers",
        //        column: "BranchID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_BranchTransfers_CashierID",
        //        table: "EX_BranchTransfers",
        //        column: "CashierID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_BranchTransfers_StatusID",
        //        table: "EX_BranchTransfers",
        //        column: "StatusID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_BranchTransfers_TypeID",
        //        table: "EX_BranchTransfers",
        //        column: "TypeID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_BranchTransfersDetails_CurrencyID",
        //        table: "EX_BranchTransfersDetails",
        //        column: "CurrencyID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_BranchTransfersDetails_VoucherID",
        //        table: "EX_BranchTransfersDetails",
        //        column: "VoucherID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_ClientJob_SeverityID",
        //        table: "EX_ClientJob",
        //        column: "SeverityID");

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_EX_ClientJob_JobCode",
        //        table: "EX_ClientJob",
        //        column: "JobCode",
        //        unique: true);

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_EX_ClientJob_JobName",
        //        table: "EX_ClientJob",
        //        column: "JobName",
        //        unique: true);

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Clients_BirthCityID",
        //        table: "EX_Clients",
        //        column: "BirthCityID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Clients_BirthCountryID",
        //        table: "EX_Clients",
        //        column: "BirthCountryID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Clients_CountryID",
        //        table: "EX_Clients",
        //        column: "CountryID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Clients_ExchangePurposeID",
        //        table: "EX_Clients",
        //        column: "ExchangePurposeID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Clients_IDSourceID",
        //        table: "EX_Clients",
        //        column: "IDSourceID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Clients_IncomeSourceID",
        //        table: "EX_Clients",
        //        column: "IncomeSourceID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_ClientsAttachments_AttachmentTypeID",
        //        table: "EX_ClientsAttachments",
        //        column: "AttachmentTypeID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_ClientsAttachments_ClientID",
        //        table: "EX_ClientsAttachments",
        //        column: "ClientID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_ClientsMemberships_ClientID",
        //        table: "EX_ClientsMemberships",
        //        column: "ClientID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_ClientsRepresentatives_ClientID",
        //        table: "EX_ClientsRepresentatives",
        //        column: "ClientID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Countries_SeverityID",
        //        table: "EX_Countries",
        //        column: "SeverityID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_CurrenciesBVR_CurrencyID",
        //        table: "EX_CurrenciesBVR",
        //        column: "CurrencyID");

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_EX_CurrenciesMarketPrices",
        //        table: "EX_CurrenciesMarketPrices",
        //        columns: new[] { "CurrencyID", "MarketPriceDay" },
        //        unique: true);

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_EX_ExchangePurposes",
        //        table: "EX_ExchangePurposes",
        //        column: "ExchangePurposeNameAr",
        //        unique: true);

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_IDSources_CountryID",
        //        table: "EX_IDSources",
        //        column: "CountryID");

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_EX_IncomeSource_NameAr",
        //        table: "EX_IncomeSources",
        //        column: "IncomeSourceNameAr",
        //        unique: true);

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_InternalTransfers_CashierID",
        //        table: "EX_InternalTransfers",
        //        column: "CashierID");

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_EX_InternalTransfersClosingDetails_Currency",
        //        table: "EX_InternalTransfersClosingDetails",
        //        columns: new[] { "TransferID", "CurrencyID" },
        //        unique: true);

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_InternalTransfersDetails_CurrencyID",
        //        table: "EX_InternalTransfersDetails",
        //        column: "CurrencyID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_InternalTransfersDetails_TransferID",
        //        table: "EX_InternalTransfersDetails",
        //        column: "TransferID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_InternalTransfersDetailsTemp_CurrencyID",
        //        table: "EX_InternalTransfersDetailsTemp",
        //        column: "CurrencyID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_InternalTransfersDetailsTemp_TransferID",
        //        table: "EX_InternalTransfersDetailsTemp",
        //        column: "TransferID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Invoices_01",
        //        table: "EX_Invoices",
        //        columns: new[] { "InvoiceTypeID", "PaymentMethod", "InternalTransferID", "InvoiceTime" });

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Invoices_02",
        //        table: "EX_Invoices",
        //        columns: new[] { "InvoiceTime", "StatusID" });

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Invoices_03",
        //        table: "EX_Invoices",
        //        columns: new[] { "InternalTransferID", "StatusID" });

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Invoices_04",
        //        table: "EX_Invoices",
        //        columns: new[] { "InvoiceTypeID", "InternalTransferID", "StatusID" });

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Invoices_05",
        //        table: "EX_Invoices",
        //        columns: new[] { "InvoiceTypeID", "InvoiceTime", "StatusID" });

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Invoices_BankID",
        //        table: "EX_Invoices",
        //        column: "BankID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Invoices_CashierID",
        //        table: "EX_Invoices",
        //        column: "CashierID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Invoices_ClientID",
        //        table: "EX_Invoices",
        //        column: "ClientID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Invoices_FormingResponsibleID",
        //        table: "EX_Invoices",
        //        column: "FormingResponsibleID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Invoices_StatusID",
        //        table: "EX_Invoices",
        //        column: "StatusID");

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_EX_Invoices_InvoiceNo",
        //        table: "EX_Invoices",
        //        columns: new[] { "InvoiceNo", "InvoiceDate" },
        //        unique: true);

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_InvoicesDetails_00",
        //        table: "EX_InvoicesDetails",
        //        column: "CurrencyID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_InvoicesDetails_InvoiceID",
        //        table: "EX_InvoicesDetails",
        //        column: "InvoiceID");

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_EX_LocallyWanted_Name",
        //        table: "EX_LocallyWanted",
        //        column: "Name",
        //        unique: true);

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Settings_AccountID_Banks",
        //        table: "EX_Settings",
        //        column: "AccountID_Banks");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Settings_AccountID_Capital",
        //        table: "EX_Settings",
        //        column: "AccountID_Capital");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Settings_AccountID_Cash",
        //        table: "EX_Settings",
        //        column: "AccountID_Cash");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Settings_AccountID_Commission",
        //        table: "EX_Settings",
        //        column: "AccountID_Commission");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Settings_AccountID_InvStart",
        //        table: "EX_Settings",
        //        column: "AccountID_InvStart");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Settings_AccountID_MainBranch",
        //        table: "EX_Settings",
        //        column: "AccountID_MainBranch");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Settings_AccountID_Purchases",
        //        table: "EX_Settings",
        //        column: "AccountID_Purchases");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Settings_AccountID_Sales",
        //        table: "EX_Settings",
        //        column: "AccountID_Sales");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Settings_AccountID_Suppliers",
        //        table: "EX_Settings",
        //        column: "AccountID_Suppliers");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Settings_AccountID_ZakatExp",
        //        table: "EX_Settings",
        //        column: "AccountID_ZakatExp");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Suppliers_AccountID",
        //        table: "EX_Suppliers",
        //        column: "AccountID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Suppliers_CountryID",
        //        table: "EX_Suppliers",
        //        column: "CountryID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Suppliers_CurrencyID",
        //        table: "EX_Suppliers",
        //        column: "CurrencyID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_Suppliers_SupplierTypeID",
        //        table: "EX_Suppliers",
        //        column: "SupplierTypeID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_WholeInvoices_BankID",
        //        table: "EX_WholeInvoices",
        //        column: "BankID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_WholeInvoices_CashierID",
        //        table: "EX_WholeInvoices",
        //        column: "CashierID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_WholeInvoices_StatusID",
        //        table: "EX_WholeInvoices",
        //        column: "StatusID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_WholeInvoices_SupplierCurrencyID",
        //        table: "EX_WholeInvoices",
        //        column: "SupplierCurrencyID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_WholeInvoices_SupplierID",
        //        table: "EX_WholeInvoices",
        //        column: "SupplierID");

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_EX_WholeInvoices_InvoiceNo",
        //        table: "EX_WholeInvoices",
        //        columns: new[] { "InvoiceDate", "InvoiceNo" },
        //        unique: true);

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_EX_WholeInvoices_PaidRemain",
        //        table: "EX_WholeInvoices",
        //        columns: new[] { "InvoiceTypeID", "PaymentMethod", "InvoiceTime", "StatusID" });

        //    migrationBuilder.CreateIndex(
        //        name: "IX_EX_WholeInvoicesDetails_InvoiceID",
        //        table: "EX_WholeInvoicesDetails",
        //        column: "InvoiceID");

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_EX_WholeInvoices_Amount",
        //        table: "EX_WholeInvoicesDetails",
        //        column: "CurrencyID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_RolePermission_PermissionId",
        //        table: "RolePermission",
        //        column: "PermissionId");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_RolePermission_RoleId",
        //        table: "RolePermission",
        //        column: "RoleId");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_RoleUser_UsersId",
        //        table: "RoleUser",
        //        column: "UsersId");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_Sec_Forms",
        //        table: "Sec_Forms",
        //        columns: new[] { "ParentID", "FormOrder" });

        //    migrationBuilder.CreateIndex(
        //        name: "IX_Sec_FormsFunctions_FunctionID",
        //        table: "Sec_FormsFunctions",
        //        column: "FunctionID");

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_Sec_FormsFunctions",
        //        table: "Sec_FormsFunctions",
        //        columns: new[] { "FormID", "FunctionID" },
        //        unique: true);

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_Sec_Functions",
        //        table: "Sec_Functions",
        //        column: "FunctionName");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_Sec_TransactionLog_FormID",
        //        table: "Sec_TransactionLog",
        //        column: "FormID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_Sec_TransactionLog_FunctionID",
        //        table: "Sec_TransactionLog",
        //        column: "FunctionID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_Sec_TransactionLog_UserID",
        //        table: "Sec_TransactionLog",
        //        column: "UserID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_Sec_Users_BranchID",
        //        table: "Sec_Users",
        //        column: "BranchID");

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_SecurityUsers_Code",
        //        table: "Sec_Users",
        //        column: "UserCode");

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_SecurityUsers_LoginName",
        //        table: "Sec_Users",
        //        column: "LoginName",
        //        unique: true);

        //    migrationBuilder.CreateIndex(
        //        name: "IX_Sec_UsersForms_FormID",
        //        table: "Sec_UsersForms",
        //        column: "FormID");

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_Sec_UsersForms",
        //        table: "Sec_UsersForms",
        //        columns: new[] { "UserID", "FormID" },
        //        unique: true);

        //    migrationBuilder.CreateIndex(
        //        name: "IX_Sec_UsersFunctions_FormFunctionID",
        //        table: "Sec_UsersFunctions",
        //        column: "FormFunctionID");

        //    migrationBuilder.CreateIndex(
        //        name: "UQ_Sec_UsersFunctions",
        //        table: "Sec_UsersFunctions",
        //        columns: new[] { "UserID", "FormFunctionID" },
        //        unique: true);

        //    migrationBuilder.CreateIndex(
        //        name: "IX_Sys_Backups_UserID",
        //        table: "Sys_Backups",
        //        column: "UserID");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_Sys_Branches_AccountID",
        //        table: "Sys_Branches",
        //        column: "AccountID");
        //}



        /// <inheritdoc />
        //protected override void Down(MigrationBuilder migrationBuilder)
        //{
        //    migrationBuilder.DropTable(
        //        name: "A_AccountClassification");

        //    migrationBuilder.DropTable(
        //        name: "A_JVsDetails");

        //    migrationBuilder.DropTable(
        //        name: "A_Settlements");

        //    migrationBuilder.DropTable(
        //        name: "CurrenciesMains");

        //    migrationBuilder.DropTable(
        //        name: "DX_Transactions");

        //    migrationBuilder.DropTable(
        //        name: "EX_BranchTransfersDetails");

        //    migrationBuilder.DropTable(
        //        name: "EX_ClientJob");

        //    migrationBuilder.DropTable(
        //        name: "EX_ClientsAttachments");

        //    migrationBuilder.DropTable(
        //        name: "EX_ClientsMemberships");

        //    migrationBuilder.DropTable(
        //        name: "EX_ClientsRepresentatives");

        //    migrationBuilder.DropTable(
        //        name: "EX_ClientsType");

        //    migrationBuilder.DropTable(
        //        name: "EX_CurrenciesBVR");

        //    migrationBuilder.DropTable(
        //        name: "EX_CurrenciesMarketPrices");

        //    migrationBuilder.DropTable(
        //        name: "EX_FormingStatus");

        //    migrationBuilder.DropTable(
        //        name: "EX_InternalTransfersClosingDetails");

        //    migrationBuilder.DropTable(
        //        name: "EX_InternalTransfersDetails");

        //    migrationBuilder.DropTable(
        //        name: "EX_InternalTransfersDetailsTemp");

        //    migrationBuilder.DropTable(
        //        name: "EX_InvoicesDetails");

        //    migrationBuilder.DropTable(
        //        name: "EX_LocallyWanted");

        //    migrationBuilder.DropTable(
        //        name: "EX_MonetaryAgency");

        //    migrationBuilder.DropTable(
        //        name: "EX_PaymentMethod");

        //    migrationBuilder.DropTable(
        //        name: "EX_Settings");

        //    migrationBuilder.DropTable(
        //        name: "EX_StatisticalDataVars");

        //    migrationBuilder.DropTable(
        //        name: "EX_WholeInvoicesDetails");

        //    migrationBuilder.DropTable(
        //        name: "EX_WholePaymentMethod");

        //    migrationBuilder.DropTable(
        //        name: "ISIL_List");

        //    migrationBuilder.DropTable(
        //        name: "ISIL_XmlData");

        //    migrationBuilder.DropTable(
        //        name: "Privilage2");

        //    migrationBuilder.DropTable(
        //        name: "RolePermission");

        //    migrationBuilder.DropTable(
        //        name: "RoleUser");

        //    migrationBuilder.DropTable(
        //        name: "Sec_TransactionLog");

        //    migrationBuilder.DropTable(
        //        name: "Sec_UsersForms");

        //    migrationBuilder.DropTable(
        //        name: "Sec_UsersFunctions");

        //    migrationBuilder.DropTable(
        //        name: "Sys_Assemblies");

        //    migrationBuilder.DropTable(
        //        name: "Sys_Backups");

        //    migrationBuilder.DropTable(
        //        name: "Sys_BranchesAuto");

        //    migrationBuilder.DropTable(
        //        name: "Sys_MobileIntegration");

        //    migrationBuilder.DropTable(
        //        name: "Sys_ReplicationSettings");

        //    migrationBuilder.DropTable(
        //        name: "Sys_Settings");

        //    migrationBuilder.DropTable(
        //        name: "Sys_SystemInfo");

        //    migrationBuilder.DropTable(
        //        name: "Sys_SystemOptions");

        //    migrationBuilder.DropTable(
        //        name: "Sys_WebsiteIntegration");

        //    migrationBuilder.DropTable(
        //        name: "TechSup_Tickets");

        //    migrationBuilder.DropTable(
        //        name: "A_JVs");

        //    migrationBuilder.DropTable(
        //        name: "EX_AttachmentType");

        //    migrationBuilder.DropTable(
        //        name: "Permission");

        //    migrationBuilder.DropTable(
        //        name: "Role");

        //    migrationBuilder.DropTable(
        //        name: "User");

        //    migrationBuilder.DropTable(
        //        name: "Sec_FormsFunctions");

        //    migrationBuilder.DropTable(
        //        name: "A_CashFlow");

        //    migrationBuilder.DropTable(
        //        name: "A_JVStatus");

        //    migrationBuilder.DropTable(
        //        name: "A_JVType");

        //    migrationBuilder.DropTable(
        //        name: "EX_BranchTransfers");

        //    migrationBuilder.DropTable(
        //        name: "EX_Invoices");

        //    migrationBuilder.DropTable(
        //        name: "EX_WholeInvoices");

        //    migrationBuilder.DropTable(
        //        name: "Sec_Forms");

        //    migrationBuilder.DropTable(
        //        name: "Sec_Functions");

        //    migrationBuilder.DropTable(
        //        name: "A_CashFlowStatus");

        //    migrationBuilder.DropTable(
        //        name: "A_CashFlowType");

        //    migrationBuilder.DropTable(
        //        name: "EX_BranchTransferStatus");

        //    migrationBuilder.DropTable(
        //        name: "EX_BranchTransferType");

        //    migrationBuilder.DropTable(
        //        name: "Sys_Branches");

        //    migrationBuilder.DropTable(
        //        name: "EX_Clients");

        //    migrationBuilder.DropTable(
        //        name: "EX_InternalTransfers");

        //    migrationBuilder.DropTable(
        //        name: "EX_InvoiceStatus");

        //    migrationBuilder.DropTable(
        //        name: "Sec_Users");

        //    migrationBuilder.DropTable(
        //        name: "EX_Banks");

        //    migrationBuilder.DropTable(
        //        name: "EX_InvoicesType");

        //    migrationBuilder.DropTable(
        //        name: "EX_Suppliers");

        //    migrationBuilder.DropTable(
        //        name: "EX_WholeInvoiceStatus");

        //    migrationBuilder.DropTable(
        //        name: "EX_IDSources");

        //    migrationBuilder.DropTable(
        //        name: "EX_ExchangePurposes");

        //    migrationBuilder.DropTable(
        //        name: "EX_IncomeSources");

        //    migrationBuilder.DropTable(
        //        name: "EX_Cashiers");

        //    migrationBuilder.DropTable(
        //        name: "EX_Branches");

        //    migrationBuilder.DropTable(
        //        name: "A_Accounts");

        //    migrationBuilder.DropTable(
        //        name: "EX_SuppliersType");

        //    migrationBuilder.DropTable(
        //        name: "EX_Countries");

        //    migrationBuilder.DropTable(
        //        name: "EX_ClientJobSeverity");

        //    migrationBuilder.DropPrimaryKey(
        //        name: "PK_Ex_Currencies",
        //        table: "Currencies");

        //    migrationBuilder.DropIndex(
        //        name: "IX_EX_Currencies",
        //        table: "Currencies");

        //    migrationBuilder.DropIndex(
        //        name: "UQ_EX_Currencies_Code",
        //        table: "Currencies");

        //    migrationBuilder.DropIndex(
        //        name: "UQ_Ex_Currencies_NameAr",
        //        table: "Currencies");

        //    migrationBuilder.DropIndex(
        //        name: "UQ_Ex_Currencies_NameEn",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "CurrencyID",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "BuyPrice",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "CurrencyNameAr",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "CurrencyNameEn",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "IsActive",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "OpeningBalance",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "OpeningPrice",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "SalePrice",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "ShowInPricesScreen",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "Sign",
        //        table: "Currencies");

        //    migrationBuilder.DropColumn(
        //        name: "ValuationPrice",
        //        table: "Currencies");

        //    migrationBuilder.RenameColumn(
        //        name: "CurrencyCode",
        //        table: "Currencies",
        //        newName: "RiskRate");

        //    migrationBuilder.AddColumn<long>(
        //        name: "Id",
        //        table: "Currencies",
        //        type: "bigint",
        //        nullable: false,
        //        defaultValue: 0L)
        //        .Annotation("Relational:ColumnOrder", 0)
        //        .Annotation("SqlServer:Identity", "1, 1");

        //    migrationBuilder.AddColumn<long>(
        //        name: "CountryId",
        //        table: "Currencies",
        //        type: "bigint",
        //        nullable: false,
        //        defaultValue: 0L);

        //    migrationBuilder.AddColumn<string>(
        //        name: "CurrCode",
        //        table: "Currencies",
        //        type: "nvarchar(max)",
        //        nullable: true);

        //    migrationBuilder.AddColumn<int>(
        //        name: "IsActve",
        //        table: "Currencies",
        //        type: "int",
        //        nullable: false,
        //        defaultValue: 1);

        //    migrationBuilder.AddColumn<bool>(
        //        name: "IsDefault",
        //        table: "Currencies",
        //        type: "bit",
        //        nullable: true);

        //    migrationBuilder.AddColumn<string>(
        //        name: "NameAr",
        //        table: "Currencies",
        //        type: "nvarchar(max)",
        //        nullable: true);

        //    migrationBuilder.AddColumn<string>(
        //        name: "NameEn",
        //        table: "Currencies",
        //        type: "nvarchar(max)",
        //        nullable: true);

        //    migrationBuilder.AddPrimaryKey(
        //        name: "PK_Currencies",
        //        table: "Currencies",
        //        column: "Id");

        //    migrationBuilder.CreateIndex(
        //        name: "IX_Currencies_CountryId",
        //        table: "Currencies",
        //        column: "CountryId");

        //    migrationBuilder.AddForeignKey(
        //        name: "FK_Currencies_Countries_CountryId",
        //        table: "Currencies",
        //        column: "CountryId",
        //        principalTable: "Countries",
        //        principalColumn: "Id",
        //        onDelete: ReferentialAction.Cascade);
        //}
    }
}

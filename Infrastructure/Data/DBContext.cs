
using Core.Entities.TRN_Transfers;
using Core.Entities.Clients;
using Core.Entities.TRN_Invoices;
using Core.Entities.LookUps;
using Core.Entities.others;
using Core.Entities.Sec;
using Core.Entities.TRN_WholeInvoices;
using Core.Other;

using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Reflection.Emit;
using System.Threading;
using System.Threading.Tasks;
using Org.BouncyCastle.Bcpg;
using Core.DTOs;
using System.Linq;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using Core.Entities.Taswya;
using Core.Entities.TreasuryTransfere;
using Application.Core.DTOs.WorkFlow;
using Core.Entities.Workflow;
using Core.Entities.Account;
using Application.Core.DTOs.Account;
using Core.DTOs.FinReports;
using System.Data;
using Core.Entities.banks;

namespace Infrastructure.Data
{





    public class DBContext :DbContext//: DynamoContext
    {
        //private readonly DynamoSession session;
        //private readonly UserConfiguration userConfiguration;
        //private readonly RoleConfiguration roleConfiguration;
        //private readonly UserRolesConfiguration userRolesConfiguration;

        public DBContext(DbContextOptions<DBContext> options
               
        ) : base(options)
        {
            
        }

        public List<Income_StOutPut> Sp_Exchange_Income_St(Income_StInput input)
        {
            var Income_StOutputs = new List<Income_StOutPut>();

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_Income_St";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters

                var Params = command.CreateParameter();
                Params.ParameterName = "@FromDate";
                if (input.FromDate != null)
                    Params.Value = new DateTime(input.FromDate.Value.Year, input.FromDate.Value.Month, input.FromDate.Value.Day, 0, 0, 0);
                else
                    Params.Value = null;
                Params.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params);

                var Params0 = command.CreateParameter();
                Params0.ParameterName = "@ToDate";
                if (input.ToDate != null)
                    Params0.Value = new DateTime(input.ToDate.Value.Year, input.ToDate.Value.Month, input.ToDate.Value.Day, 23, 59, 59);
                else
                    Params0.Value = null;
                Params0.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params0);

                var Params3 = command.CreateParameter();
                Params3.ParameterName = "@branchId";
                if (input.branchId != null)
                    Params3.Value = input.branchId;
                else
                    Params3.Value = null;
                Params3.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params3);



                // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                // Execute the command
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var employee = new Income_StOutPut
                        {
                            AccountID = reader.GetInt32(0),
                           
                            AccountName = reader.GetString(1),
                            Debit = reader.GetDecimal(2),
                            credit = reader.GetDecimal(3),
                            balance = reader.GetDecimal(4)
                           

                        };
                        Income_StOutputs.Add(employee);
                    }
                }
            }



            return Income_StOutputs.ToList();
        }


        public List<Central_statmentOutPut> Sp_Exchange_Central_statment(Central_statmentInput input)
        {
            if (input.onlythislevel == null)
                input.onlythislevel = 0;
            var Central_statmentOutputs = new List<Central_statmentOutPut>();

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_Central_statment";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters

                var Params = command.CreateParameter();
                Params.ParameterName = "@Date";
                if (input.Date != null)
                    Params.Value = new DateTime(input.Date.Value.Year, input.Date.Value.Month, input.Date.Value.Day, 0, 0, 0);
                else
                    Params.Value = null;
                Params.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params);


                var Params3 = command.CreateParameter();
                Params3.ParameterName = "@branchId";
                if (input.branchId != null)
                    Params3.Value = input.branchId;
                else
                    Params3.Value = null;
                Params3.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params3);

                var Params4 = command.CreateParameter();
                Params4.ParameterName = "@AccountLevel";
                if (input.AccountLevel != null)
                    Params4.Value = input.AccountLevel;
                else
                    Params4.Value = null;
                Params4.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params4);


                var Params5 = command.CreateParameter(); 
                Params5.ParameterName = "@onlythislevel";
                if (input.onlythislevel != null)
                    Params5.Value = input.onlythislevel;
                else
                    Params5.Value = null;
                Params5.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params5);

                // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                // Execute the command
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var employee = new Central_statmentOutPut
                        {
                            AccountID = reader.GetInt32(0),
                            ParentID = reader.GetInt32(1),
                            AccountName = reader.GetString(2),
                            Value = reader.GetDecimal(3),
                            Value1 = reader.GetDecimal(4),
                            Value2 = reader.GetDecimal(5),
                            Value3 = reader.GetDecimal(6),
                            Value4 = reader.GetDecimal(7)
                           

                        };
                        Central_statmentOutputs.Add(employee);
                    }
                }
            }



            return Central_statmentOutputs.ToList();
        }


        public List<mezanOutPut> Sp_Exchange_mezan(mezanInput input)
        {
            var mezanOutputs = new List<mezanOutPut>();

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_mezan";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters

                var Params = command.CreateParameter();
                Params.ParameterName = "@FromDate";
                if (input.FromDate != null)
                    Params.Value = new DateTime(input.FromDate.Value.Year, input.FromDate.Value.Month, input.FromDate.Value.Day, 0, 0, 0);
                else
                    Params.Value = null;
                Params.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params);

                var Params0 = command.CreateParameter();
                Params0.ParameterName = "@ToDate";
                if (input.ToDate != null)
                    Params0.Value = new DateTime(input.ToDate.Value.Year, input.ToDate.Value.Month, input.ToDate.Value.Day, 23, 59, 59);
                else
                    Params0.Value = null;
                Params0.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params0);

                var Params2 = command.CreateParameter();
                Params2.ParameterName = "@AccountLevel";
                if (input.AccountLevel != null)
                    Params2.Value = input.AccountLevel;
                else
                    Params2.Value = null;
                Params2.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params2);


                var Params3 = command.CreateParameter();
                Params3.ParameterName = "@branchId";
                if (input.branchId != null)
                    Params3.Value = input.branchId;
                else
                    Params3.Value = null;
                Params3.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params3);



                // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                // Execute the command
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var employee = new mezanOutPut
                        {
                            AccountID = reader.GetInt32(0),
                            ParentID = reader.GetInt32(1),
                            AccountName = reader.GetString(2),
                            Prev_balance_Debit = reader.GetDecimal(3),
                            Prev_balance_Credit = reader.GetDecimal(4),
                            Plus_Amount_Debit = reader.GetDecimal(5),
                            Plus_Amount_Credit = reader.GetDecimal(6)
                          
                        };
                        mezanOutputs.Add(employee);
                    }
                }
            }



            return mezanOutputs.ToList();
        }

        public Kashf_TahlelyOutPut Sp_Exchange_Kashf_Tahlely(Kashf_TahlelyInput input)
        {
            var Kashf_TahlelyOutputs = new Kashf_TahlelyOutPut() { Kashf_TahlelyOutPut1 = new List<Kashf_TahlelyOutPut1>(), Kashf_TahlelyOutPut2 = new List<Kashf_TahlelyOutPut2>() };

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_Kashf_Tahlely";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters

                var Params = command.CreateParameter();
                Params.ParameterName = "@FromDate";
                if (input.FromDate != null)
                    Params.Value = new DateTime(input.FromDate.Value.Year, input.FromDate.Value.Month, input.FromDate.Value.Day, 0, 0, 0);
                else
                    Params.Value = null;
                Params.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params);


                var Params6 = command.CreateParameter();
                Params6.ParameterName = "@ToDate";
                if (input.ToDate != null)
                    Params6.Value = new DateTime(input.ToDate.Value.Year, input.ToDate.Value.Month, input.ToDate.Value.Day, 0, 0, 0);
                else
                    Params6.Value = null;
                Params6.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params6);



                var Params2 = command.CreateParameter();
                Params2.ParameterName = "@branchId";
                if (input.branchId != null)
                    Params2.Value = input.branchId;
                else
                    Params2.Value = null;
                Params2.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params2);


                var Params3 = command.CreateParameter();
                Params3.ParameterName = "@ShowType";
                if (input.ShowType != null)
                    Params3.Value = input.ShowType;
                else
                    Params3.Value = null;
                Params3.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params3);


                var Params4 = command.CreateParameter();
                Params4.ParameterName = "@AccountID";
                if (input.AccountID != null)
                    Params4.Value = input.AccountID;
                else
                    Params4.Value = null;
                Params4.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params4);


                var Params5 = command.CreateParameter();
                Params5.ParameterName = "@AccountLevel";
                if (input.AccountLevel != null)
                    Params5.Value = input.AccountLevel;
                else
                    Params5.Value = null;
                Params5.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params5);

                // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                // Execute the command
                using (var reader = command.ExecuteReader())
                {
                    if(input.ShowType ==1)
                    while (reader.Read())
                    {
                        var d1 = new Kashf_TahlelyOutPut1
                        {
                            AccountID = reader.GetInt32(0),
                            ParentID = reader.GetInt32(1),
                            AccountName = reader.GetString(2),
                            Prev_balance = reader.GetDecimal(3),
                            Plus_Amount = reader.GetDecimal(4),
                            balance = reader.GetDecimal(5)
                          

                        };
                        Kashf_TahlelyOutputs.Kashf_TahlelyOutPut1.Add(d1);
                    }

                    if (input.ShowType == 2)
                    {

                        while (reader.Read())
                        {
                            var d2 = new Kashf_TahlelyOutPut2
                            {
                                AccountID = reader.GetInt32(0), 
                                AccountName = reader.GetString(1),
                                date = reader.GetDateTime(2),
                                Debit = reader.GetDecimal(3),
                                Credit = reader.GetDecimal(4),
                                balance = reader.GetDecimal(5),
                                Remarks = reader.GetString(6),
                                JVTypeNameAr = reader.GetString(7),
                                JVNo = reader.GetInt32(8)
                            };
                            Kashf_TahlelyOutputs.Kashf_TahlelyOutPut2.Add(d2);
                        }
                    }


                }



                return Kashf_TahlelyOutputs;
            }
        }



        public AssetBalanceOutPut Sp_Exchange_AssetBalance(AssetBalanceInput input)
        {
            var AssetBalanceOutputs = new AssetBalanceOutPut() { AssetBalanceOutPut1 = new List<AssetBalanceOutPut1>(), AssetBalanceOutPut2 = new List<AssetBalanceOutPut2>(), AssetBalanceOutPut3 = new List<AssetBalanceOutPut3>(), AssetBalanceOutPut4 = new List<AssetBalanceOutPut4>() };

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_AssetBalance";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters

                var Params = command.CreateParameter();
                Params.ParameterName = "@Date";
                if (input.Date != null)
                    Params.Value = new DateTime(input.Date.Value.Year, input.Date.Value.Month, input.Date.Value.Day, 0, 0, 0);
                else
                    Params.Value = null;
                Params.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params);



                var Params2 = command.CreateParameter();
                Params2.ParameterName = "@WayType";
                if (input.WayType != null)
                    Params2.Value = input.WayType;
                else
                    Params2.Value = null;
                Params2.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params2);


                var Params3 = command.CreateParameter();
                Params3.ParameterName = "@branchId";
                if (input.branchId != null)
                    Params3.Value = input.branchId;
                else
                    Params3.Value = null;
                Params3.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params3);



                // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                // Execute the command
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var d1 = new AssetBalanceOutPut1
                        {
                            Amount = reader.GetDecimal(0),
                            Price = reader.GetDecimal(1),
                            Total = reader.GetDecimal(2),
                            CurrName = reader.GetString(3),
                            Date = reader.GetDateTime(4)

                        };
                        AssetBalanceOutputs.AssetBalanceOutPut1.Add(d1);
                    }

                    if (reader.NextResult())
                    {

                        while (reader.Read())
                        {
                            var d2 = new AssetBalanceOutPut2
                            {
                                Date = reader.GetDateTime(0),
                                Balance = reader.GetDecimal(1),
                                BankName = reader.GetString(2)
                            };
                            AssetBalanceOutputs.AssetBalanceOutPut2.Add(d2);
                        }
                    }




                    if (reader.NextResult())
                    {

                        while (reader.Read())
                        {
                            var d3 = new AssetBalanceOutPut3
                            {
                                Date = reader.GetDateTime(0),
                                ClientName = reader.GetString(1),
                                Balance = reader.GetDecimal(2)

                            };
                            AssetBalanceOutputs.AssetBalanceOutPut3.Add(d3);
                        }
                    }


                    if (reader.NextResult())
                    {

                        while (reader.Read())
                        {
                            var d4 = new AssetBalanceOutPut4
                            {
                                Balance = reader.GetDecimal(0),
                                BranchName = reader.GetString(1),
                                Date = reader.GetDateTime(2),


                            };
                            AssetBalanceOutputs.AssetBalanceOutPut4.Add(d4);
                        }
                    }


                }



                return AssetBalanceOutputs;
            }
        }



        public List<KashfHesabOutput> Sp_Exchange_KashfHesab(KashfHesabInput input)
        {
            var KashfHesabOutputs = new List<KashfHesabOutput>();

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_KashfHesab";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters

                var Params = command.CreateParameter();
                Params.ParameterName = "@FromDate";
                if (input.FromDate != null)
                    Params.Value = new DateTime(input.FromDate.Value.Year, input.FromDate.Value.Month, input.FromDate.Value.Day, 0, 0, 0);
                else
                    Params.Value = null;
                Params.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params);

                var Params0 = command.CreateParameter();
                Params0.ParameterName = "@ToDate";
                if (input.ToDate != null)
                    Params0.Value = new DateTime(input.ToDate.Value.Year, input.ToDate.Value.Month, input.ToDate.Value.Day, 23, 59, 59);
                else
                    Params0.Value = null;
                Params0.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params0);

                var Params2 = command.CreateParameter();
                Params2.ParameterName = "@SupplierId";
                if (input.SupplierId != null)
                    Params2.Value = input.SupplierId;
                else
                    Params2.Value = null;
                Params2.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params2);


                var Params3 = command.CreateParameter();
                Params3.ParameterName = "@BankAccountId";
                if (input.BankAccountId != null)
                    Params3.Value = input.BankAccountId;
                else
                    Params3.Value = null;
                Params3.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params3);



                // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                // Execute the command
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var employee = new KashfHesabOutput
                        {
                            AccountId = reader.GetString(0),
                            Date = reader.GetDateTime(1),
                            Desc = reader.GetString(2),
                            Debit = reader.GetDecimal(3),
                            credit = reader.GetDecimal(4),
                            balance = reader.GetDecimal(5),
                            BankId = reader.GetString(6),
                            BankName = reader.GetString(7)
                        };
                        KashfHesabOutputs.Add(employee);
                    }
                }
            }



            return KashfHesabOutputs.ToList();
        }

        public List<DialyKoyodOutput> Sp_Exchange_DialyKoyod(DialyKoyodInput input)
        {
            var DialyKoyodOutputs = new List<DialyKoyodOutput>();

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_DialyKoyod";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters

                var Params = command.CreateParameter();
                Params.ParameterName = "@FromDate";
                if (input.FromDate != null)
                    Params.Value = new DateTime(input.FromDate.Value.Year, input.FromDate.Value.Month, input.FromDate.Value.Day, 0, 0, 0);
                else
                    Params.Value = null;
                Params.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params);

                var Params0 = command.CreateParameter();
                Params0.ParameterName = "@ToDate";
                if (input.ToDate != null)
                    Params0.Value = new DateTime(input.ToDate.Value.Year, input.ToDate.Value.Month, input.ToDate.Value.Day, 23, 59, 59);
                else
                    Params0.Value = null;
                Params0.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params0);

                var Params2 = command.CreateParameter();
                Params2.ParameterName = "@branchId";
                if (input.branchId != null)
                    Params2.Value = input.branchId;
                else
                    Params2.Value = null;
                Params2.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params2);


                var Params3 = command.CreateParameter();
                Params3.ParameterName = "@JVTypeID";
                if (input.JVTypeID != null)
                    Params3.Value = input.JVTypeID;
                else
                    Params3.Value = null;
                Params3.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params3);

                var Params4 = command.CreateParameter();
                Params4.ParameterName = "@JVStatusID";
                if (input.JVStatusID != null)
                    Params4.Value = input.JVStatusID;
                else
                    Params4.Value = null;
                Params4.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params4);


                // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                // Execute the command
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var employee = new DialyKoyodOutput
                        {
                            //Jvid = int.Parse(reader.GetString(0).ToString()),
                            //Date = reader.GetDateTime(1),
                            //CurrName = reader.GetString(2),
                            //Buy_Amount = reader.GetDecimal(3),
                            //BUY_VSByRiyal = reader.GetDecimal(4),
                            //Buy_AVGPrice = reader.GetDecimal(5),
                            //Sale_Amount = reader.GetDecimal(6),
                            //Sale_VSByRiyal = reader.GetDecimal(7),
                            //Sale_AVGPrice = reader.GetDecimal(8),

                            Jvid = reader.GetInt32(0),
                            Jvno = reader.GetInt32(1),
                            Jvdate = reader.GetDateTime(2),
                            Jvtime = reader.GetDateTime(3),
                            JvtypeId = reader.GetInt32(4),
                            JvstatusId = reader.GetInt32(5),
                            Remarks = reader.GetString(6),
                            Generated = reader.GetBoolean(7),
                            InvoiceId = 0,// reader.GetInt32(8),
                            WholeInvoiceId = 0,//reader.GetDecimal(9),
                            CashFlowId = 0,// reader.GetDecimal(10),
                            BranchTransferId = 0,// reader.GetDecimal(11),
                            TaswyaTransferId = 0,// reader.GetDecimal(12),
                            BranchID = reader.GetInt32(13),
                         //   TreasuryTransferId = reader.GetDecimal(14),
                            IsDeleted = reader.GetBoolean(15),
                            JvtypeName = reader.GetString(16),
                            JvstatusName = reader.GetString(17),
                            Credit = reader.GetDecimal(18),
                            Debit = reader.GetDecimal(19),
                            ForeignCredit = reader.GetDecimal(20),
                            ForeignDebit= reader.GetDecimal(21),
                            AccountName = reader.GetString(22),
                            CurrencyNameAr = reader.GetString(23)
                         

                        };
                        DialyKoyodOutputs.Add(employee);
                    }
                }
            }



            return DialyKoyodOutputs.ToList();
        }

        public List<SalesBuysOutput> Sp_Exchange_SalesBuys(SalesBuysInput input)
        {
            var SalesBuysOutputs = new List<SalesBuysOutput>();

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_SalesBuys";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters

                var Params = command.CreateParameter();
                Params.ParameterName = "@FromDate";
                if (input.FromDate != null)
                    Params.Value = new DateTime(input.FromDate.Value.Year, input.FromDate.Value.Month, input.FromDate.Value.Day, 0, 0, 0);
                else
                    Params.Value = null;
                Params.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params);

                var Params0 = command.CreateParameter();
                Params0.ParameterName = "@ToDate";
                if (input.ToDate != null)
                    Params0.Value = new DateTime(input.ToDate.Value.Year, input.ToDate.Value.Month, input.ToDate.Value.Day, 23, 59, 59);
                else
                    Params0.Value = null;
                Params0.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params0);

                var Params2 = command.CreateParameter();
                Params2.ParameterName = "@branchId";
                if (input.branchId != null)
                    Params2.Value = input.branchId;
                else
                    Params2.Value = null;
                Params2.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params2);


                var Params3 = command.CreateParameter();
                Params3.ParameterName = "@ClientId";
                if (input.ClientId != null)
                    Params3.Value = input.ClientId;
                else
                    Params3.Value = null;
                Params3.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params3);

                var Params4= command.CreateParameter();
                Params4.ParameterName = "@SupplierId";
                if (input.SupplierId != null)
                    Params4.Value = input.SupplierId;
                else
                    Params4.Value = null;
                Params4.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params4);


                // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                // Execute the command
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var employee = new SalesBuysOutput
                        {
                            seq = int.Parse(reader.GetString(0).ToString()),
                            Date = reader.GetDateTime(1),
                            CurrName = reader.GetString(2),
                            Buy_Amount = reader.GetDecimal(3),
                            BUY_VSByRiyal = reader.GetDecimal(4),
                            Buy_AVGPrice = reader.GetDecimal(5),
                            Sale_Amount = reader.GetDecimal(6),
                            Sale_VSByRiyal = reader.GetDecimal(7),
                            Sale_AVGPrice = reader.GetDecimal(8),

                        };
                        SalesBuysOutputs.Add(employee);
                    }
                }
            }



            return SalesBuysOutputs.ToList();
        }

        public List<ProfitOutput> Sp_Exchange_Profit(ProfitInput input)
        {
            var ProfitOutputs = new List<ProfitOutput>();

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_Profit";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters

                var Params = command.CreateParameter();
                Params.ParameterName = "@FromDate";
                if (input.FromDate != null)
                    Params.Value = new DateTime(input.FromDate.Value.Year, input.FromDate.Value.Month, input.FromDate.Value.Day, 0, 0, 0);
                else
                    Params.Value = null;
                Params.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params);

                var Params0 = command.CreateParameter();
                Params0.ParameterName = "@ToDate";
                if (input.ToDate != null)
                    Params0.Value = new DateTime(input.ToDate.Value.Year, input.ToDate.Value.Month, input.ToDate.Value.Day, 23, 59, 59);
                else
                    Params0.Value = null;
                Params0.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params0);

                var Params2 = command.CreateParameter();
                Params2.ParameterName = "@branchId";
                if (input.branchId != null)
                    Params2.Value = input.branchId;
                else
                    Params2.Value = null;
                Params2.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params2);





                // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                // Execute the command
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var employee = new ProfitOutput
                        {
                            seq = int.Parse( reader.GetString(0).ToString()),
                            Date = reader.GetDateTime(1),
                            CurrName = reader.GetString(2),
                            SalesAmount = reader.GetDecimal(3),
                            SalesVallue = reader.GetDecimal(4),
                            SalesCost = reader.GetDecimal(5),
                            TotalProfit = reader.GetDecimal(6),
                          
                        };
                        ProfitOutputs.Add(employee);
                    }
                }
            }



            return ProfitOutputs.ToList();
        }


        public List<TreasutyMonementOutput> Sp_Exchange_TreasutyMonement(TreasutyMonementInput input)
        {
            var TreasutyMonementOutputs = new List<TreasutyMonementOutput>();

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_TreasutyMonement";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters

                var Params = command.CreateParameter();
                Params.ParameterName = "@FromDate";
                if (input.FromDate != null)
                    Params.Value = new DateTime(input.FromDate.Value.Year, input.FromDate.Value.Month, input.FromDate.Value.Day, 0, 0, 0);
                else
                    Params.Value = null;
                Params.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params);

                var Params0 = command.CreateParameter();
                Params0.ParameterName = "@ToDate";
                if (input.ToDate != null)
                    Params0.Value = new DateTime(input.ToDate.Value.Year, input.ToDate.Value.Month, input.ToDate.Value.Day, 23, 59, 59);
                else
                    Params0.Value = null;
                Params0.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params0);

                var Params2 = command.CreateParameter();
                Params2.ParameterName = "@branchId";
                if (input.branchId != null)
                    Params2.Value = input.branchId;
                else
                    Params2.Value = null;
                Params2.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params2);

                var Params3 = command.CreateParameter();
                Params3.ParameterName = "@CurrCode";
                if (input.CurrCode != null)
                    Params3.Value = input.CurrCode;
                else
                    Params3.Value = null;
                Params3.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params3);


                var Params4 = command.CreateParameter();
                Params4.ParameterName = "@TreasuryId";
                if (input.TreasuryId != null)
                    Params4.Value = input.TreasuryId;
                else
                    Params4.Value = null;
                Params4.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params4);


                // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                // Execute the command
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var employee = new TreasutyMonementOutput
                        {
                            seq = int.Parse(reader.GetString(0).ToString()),
                            Date = reader.GetDateTime(1),
                            CurrName = reader.GetString(2),
                            Move_Value = reader.GetDecimal(3),
                            balance = reader.GetDecimal(4),
                            Move_type = reader.GetString(5)
                           

                        };
                        TreasutyMonementOutputs.Add(employee);
                    }
                }
            }



            return TreasutyMonementOutputs.ToList();
        }



        public List<Exchange_CurrenciesBalanceOutput> Sp_Exchange_CurrenciesBalance(Exchange_CurrenciesBalanceInput input)
        {
            var Exchange_CurrenciesBalanceOutputs = new List<Exchange_CurrenciesBalanceOutput>();

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_CurrenciesBalance";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters
                var Params = command.CreateParameter();
                Params.ParameterName = "@date";
                Params.Value = new DateTime(input.date.Year, input.date.Month, input.date.Day, 23, 59, 59);
                Params.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params);

                var Params2 = command.CreateParameter();
                Params2.ParameterName = "@branchId";
                Params2.Value = input.branchId;
                Params2.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params2);

                var Params3 = command.CreateParameter();
                Params3.ParameterName = "@Userid";
                Params3.Value = input.Userid;
                Params3.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params3);



                var Params4 = command.CreateParameter();
                Params4.ParameterName = "@Type";
                Params4.Value = input.Type;
                Params4.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params4);     

                // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                // Execute the command
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var employee = new Exchange_CurrenciesBalanceOutput
                        {
                            CurrencyCode = reader.GetInt32(0),
                            CurrencyNameAr = reader.GetString(1),
                            Balance = reader.GetDecimal(2),
                            Rate = reader.GetDecimal(3),
                            TotalBalance = reader.GetDecimal(4),
                            ActionTime = reader.GetDateTime(5),
                            Type = reader.GetString(6)
                        };
                        Exchange_CurrenciesBalanceOutputs.Add(employee);
                    }
                }
            }

            return Exchange_CurrenciesBalanceOutputs.OrderBy(a=>a.CurrencyCode).ToList();
        }

        public List<Exchange_MovementOutput> Sp_Exchange_Movement(Exchange_MovementInput input)
        {
            var Exchange_MovementOutputs = new List<Exchange_MovementOutput>();

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_Movement";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters
             
                    var Params = command.CreateParameter();
                    Params.ParameterName = "@Fdate";
                if (input.Fdate != null)
                    Params.Value = new DateTime(input.Fdate.Value.Year, input.Fdate.Value.Month, input.Fdate.Value.Day, 0, 0, 0);
                else
                    Params.Value = null;
                    Params.DbType = System.Data.DbType.DateTime;
                    command.Parameters.Add(Params);
                
                var Params0 = command.CreateParameter();
                Params0.ParameterName = "@Tdate";
                if (input.Tdate != null)
                    Params0.Value = new DateTime(input.Tdate.Value.Year, input.Tdate.Value.Month, input.Tdate.Value.Day, 23, 59, 59);
                else
                    Params0.Value = null;
                Params0.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params0);

                var Params2 = command.CreateParameter();
                Params2.ParameterName = "@branchId";
                Params2.Value = input.branchId;
                Params2.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params2);

                var Params3 = command.CreateParameter();
                Params3.ParameterName = "@Userid";
                Params3.Value = input.Userid;
                Params3.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params3);



             

                // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                // Execute the command
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var employee = new Exchange_MovementOutput
                        {
                            InvoiceNo = reader.GetInt32(0),
                            InvoiceTypeNameAr = reader.GetString(1),
                            CurrencyNameAr = reader.GetString(2),
                            ExRate = reader.GetDecimal(3),
                            Amount = reader.GetDecimal(4),
                            Total = reader.GetDecimal(5),
                            UserNameAr = reader.GetString(6),
                            InvoiceTime=reader.GetDateTime(7),
                            InvoiceID = reader.GetInt32(8),
                            BranchNameAr = reader.GetString(9),
                            type = reader.GetString(10),
                        };
                        Exchange_MovementOutputs.Add(employee);
                    }
                }
            }

            foreach (var item in Exchange_MovementOutputs.ToList())
            {
                item.UserNameAr = ExchangeEncrypt.Decryp(item.UserNameAr);
            }

            return Exchange_MovementOutputs.OrderBy(a => a.InvoiceNo).ToList();
        }

        public List<Exchange_WholeMovementOutput> Sp_Exchange_WholeMovement(Exchange_WholeMovementInput input)
        {
            var Exchange_WholeMovementOutputs = new List<Exchange_WholeMovementOutput>();

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_WholeMovement";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters
                var Params = command.CreateParameter();
                Params.ParameterName = "@Fdate";
                if (input.Fdate != null)
                    Params.Value = new DateTime(input.Fdate.Value.Year, input.Fdate.Value.Month, input.Fdate.Value.Day, 0, 0, 0);
                else
                    Params.Value = null;
                Params.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params);

                var Params0 = command.CreateParameter();
                Params0.ParameterName = "@Tdate";
                if (input.Tdate != null)
                    Params0.Value = new DateTime(input.Tdate.Value.Year, input.Tdate.Value.Month, input.Tdate.Value.Day, 23, 59, 59);
                else
                    Params0.Value = null;
                Params0.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params0);

                var Params2 = command.CreateParameter();
                Params2.ParameterName = "@branchId";
                Params2.Value = input.branchId;
                Params2.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params2);

                var Params3 = command.CreateParameter();
                Params3.ParameterName = "@Userid";
                Params3.Value = input.Userid;
                Params3.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params3);





                // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                // Execute the command
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var employee = new Exchange_WholeMovementOutput
                        {
                            InvoiceNo = reader.GetInt32(0),
                            InvoiceTypeNameAr = reader.GetString(1),
                            CurrencyNameAr = reader.GetString(2),
                            ExRate = reader.GetDecimal(3),
                            Amount = reader.GetDecimal(4),
                            Total = reader.GetDecimal(5),
                            UserNameAr = reader.GetString(6),
                            InvoiceTime = reader.GetDateTime(7),
                            InvoiceID = reader.GetInt32(8),
                            BranchNameAr = reader.GetString(9),
                            type = reader.GetString(10),


                        };
                        Exchange_WholeMovementOutputs.Add(employee);
                    }
                }
            }

            foreach (var item in Exchange_WholeMovementOutputs.ToList())
            {
                item.UserNameAr = ExchangeEncrypt.Decryp(item.UserNameAr);
            }

            return Exchange_WholeMovementOutputs.OrderBy(a => a.InvoiceNo).ToList();
        }

        public List<Exchange_CurrencyMovementOutput> Sp_Exchange_CurrencyMovement(Exchange_CurrencyMovementInput input)
        {
            var Exchange_CurrencyMovementOutputs = new List<Exchange_CurrencyMovementOutput>();

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_CurrencyMovement";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters
                var Params = command.CreateParameter();
                Params.ParameterName = "@Fdate";
                Params.Value = new DateTime(input.Fdate.Year, input.Fdate.Month, input.Fdate.Day, 0, 0, 0);
                Params.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params);

                var Params0 = command.CreateParameter();
                Params0.ParameterName = "@Tdate";
                Params0.Value = new DateTime(input.Tdate.Year, input.Tdate.Month, input.Tdate.Day, 23, 59, 59);
                Params0.DbType = System.Data.DbType.DateTime;
                command.Parameters.Add(Params0);

                var Params2 = command.CreateParameter();
                Params2.ParameterName = "@branchId";
                Params2.Value = input.branchId;
                Params2.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params2);






                // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                // Execute the command
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var employee = new Exchange_CurrencyMovementOutput
                        {
                            CurrencyCode = reader.GetInt32(0),
                            CurrencyNameAr = reader.GetString(1),
                            Prev_Balance = reader.GetDecimal(2),
                            Buy_Quantity = reader.GetDecimal(3),
                            Sale_Quantity = reader.GetDecimal(4),
                            current_Balance = reader.GetDecimal(5)
                          
                        };
                        Exchange_CurrencyMovementOutputs.Add(employee);
                    }
                }
            }

            return Exchange_CurrencyMovementOutputs.OrderBy(a => a.CurrencyCode).ToList();
        }


        public List<RequestResult> Sp_Exchange_WF_GetInputRequest(int userid)
        {
            var WFRequestDto = new List<RequestResult>();

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_WF_GetInputRequest";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters
                var Params = command.CreateParameter();
                Params.ParameterName = "@Userid";
                Params.Value = userid;
                Params.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params);

                              // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }

                // Execute the command
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var result = new RequestResult
                        {
                            RequestId = reader.GetInt32(0),
                            RequestTypeId = reader.GetInt32(1),
                            BranchID = reader.GetInt32(2),
                            UserId = reader.GetInt32(3),
                            EntityId = reader.GetString(4),
                            //RunOnStart = reader.GetString(5),
                            //RunONLastApprove = reader.GetString(6),
                            //RunOnReject = reader.GetString(7),
                            IsCompleted = reader.GetBoolean(5),
                            RegisterDate = reader.GetDateTime(6)

                        };
                        WFRequestDto.Add(result);
                    }
                }
            }

            return WFRequestDto.OrderBy(a => a.RequestId).ToList();
        }

        public Boolean Sp_Exchange_after_add_CurrencyBase(int ID)
        {
            var WFRequestDto = new List<RequestResult>();

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_after_add_CurrencyBase";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters
                var Params = command.CreateParameter();
                Params.ParameterName = "@ID";
                Params.Value = ID;
                Params.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params);

                // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }
                var result = command.ExecuteNonQuery();

                // Execute the command
               
            }

            return true;
        }

        public Boolean Sp_Exchange_after_add_treasury(int TreasuryId)
        {
            var WFRequestDto = new List<RequestResult>();

            using (var command = Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "Exchange_after_add_treasury";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters
                var Params = command.CreateParameter();
                Params.ParameterName = "@TreasuryId";
                Params.Value = TreasuryId;
                Params.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(Params);

                // Open connection if needed
                if (command.Connection.State != System.Data.ConnectionState.Open)
                {
                    command.Connection.Open();
                }
                var result = command.ExecuteNonQuery();

                // Execute the command

            }

            return true;
        }


        public virtual DbSet<ShiftTracking> ShiftTracking { get; set; }
        public virtual DbSet<ClientActivities> ClientActivities { get; set; }
        public virtual DbSet<TreasuryDealers> TreasuryDealers { get; set; }
        public virtual DbSet<BankAccount> BankAccount { get; set; }
        public virtual DbSet<BanksBvr> BanksBvr { get; set; }
        public virtual DbSet<BanksTransfere> BanksTransfere { get; set; }
        public virtual DbSet<BanksTreasuryTransfere> BanksTreasuryTransfere { get; set; }
        public virtual DbSet<ProveInOutCheck> ProveInOutCheck { get; set; }


        public virtual DbSet<ClientSecurityFile> ClientSecurityFile { get; set; }
        public virtual DbSet<ExClientSectors> ExClientSectors { get; set; }
        public virtual DbSet<ACostCenter> ACostCenter { get; set; }
        public virtual DbSet<TrackingData> TrackingData { get; set; }
        public virtual DbSet<WFListOfApprovals> WFListOfApprovals { get; set; }
        public virtual DbSet<WFRequest> WFRequest { get; set; }
        public virtual DbSet<WFRequestDetails> WFRequestDetails { get; set; }
        public virtual DbSet<WFRequestType> WFRequestType { get; set; }
        public virtual DbSet<ExTreasuryTransfere> ExTreasuryTransfere { get; set; }
        public virtual DbSet<ExTreasuryTransfereDetail> ExTreasuryTransfereDetail { get; set; }
        public virtual DbSet<CurrencyBase> CurrencyBase { get; set; }
        public virtual DbSet<SecPermissionTypeBranches> SecPermissionTypeBranches { get; set; }
        public virtual DbSet<AAccount> AAccounts { get; set; }

        public virtual DbSet<AAccountClassification> AAccountClassifications { get; set; }

        public virtual DbSet<ACashFlow> ACashFlows { get; set; }

        public virtual DbSet<ACashFlowStatus> ACashFlowStatuses { get; set; }

        public virtual DbSet<ACashFlowType> ACashFlowTypes { get; set; }

        public virtual DbSet<AJv> AJvs { get; set; }

        public virtual DbSet<AJvsDetail> AJvsDetails { get; set; }

        public virtual DbSet<AJvstatus> AJvstatuses { get; set; }

        public virtual DbSet<AJvtype> AJvtypes { get; set; }

        public virtual DbSet<ASettlement> ASettlements { get; set; }

 
        public virtual DbSet<Currency> Currencies { get; set; }

        public virtual DbSet<DxTransaction> DxTransactions { get; set; }

        public virtual DbSet<ExAttachmentType> ExAttachmentTypes { get; set; }

        public virtual DbSet<ExBank> ExBanks { get; set; }

        public virtual DbSet<ExBranch> ExBranches { get; set; }
        public virtual DbSet<UserSetting> UserSetting { get; set; }
        public virtual DbSet<Setting> Setting { get; set; }

        public virtual DbSet<SecPermissionType> PermissionTypes { get; set; }

        public virtual DbSet<ExBranchTransfer> ExBranchTransfers { get; set; }

        public virtual DbSet<ExBranchTransferStatus> ExBranchTransferStatuses { get; set; }

        public virtual DbSet<ExBranchTransferType> ExBranchTransferTypes { get; set; }

        public virtual DbSet<ExBranchTransfersDetail> ExBranchTransfersDetails { get; set; }

        //public virtual DbSet<ExCashier> ExCashiers { get; set; }

        public virtual DbSet<ExClient> ExClients { get; set; }

        public virtual DbSet<ExClientJob> ExClientJobs { get; set; }

        public virtual DbSet<ExClientJobSeverity> ExClientJobSeverities { get; set; }

        public virtual DbSet<ExClientsAttachment> ExClientsAttachments { get; set; }

        public virtual DbSet<ExClientsMembership> ExClientsMemberships { get; set; }

        public virtual DbSet<ExClientsRepresentative> ExClientsRepresentatives { get; set; }

        public virtual DbSet<ExClientsType> ExClientsTypes { get; set; }

        public virtual DbSet<ExCountry> ExCountries { get; set; }

        public virtual DbSet<ExCurrenciesBvr> ExCurrenciesBvrs { get; set; }

        public virtual DbSet<ExCurrenciesMarketPrice> ExCurrenciesMarketPrices { get; set; }

        public virtual DbSet<ExExchangePurpose> ExExchangePurposes { get; set; }

        public virtual DbSet<ExFormingStatus> ExFormingStatuses { get; set; }

        public virtual DbSet<ExIdsource> ExIdsources { get; set; }

        public virtual DbSet<ExIncomeSource> ExIncomeSources { get; set; }

        public virtual DbSet<ExInternalTransfer> ExInternalTransfers { get; set; }
        public virtual DbSet<FinYears> FinYears { get; set; }
        public virtual DbSet<FinYearsPeriods> FinYearsPeriods { get; set; }

        public virtual DbSet<ExInternalTransfersClosingDetail> ExInternalTransfersClosingDetails { get; set; }

        public virtual DbSet<ExInternalTransfersDetail> ExInternalTransfersDetails { get; set; }

        public virtual DbSet<ExInternalTransfersDetailsTemp> ExInternalTransfersDetailsTemps { get; set; }

        public virtual DbSet<ExInvoice> ExInvoices { get; set; }
        public virtual DbSet<ExInvoiceStatus> ExInvoiceStatuses { get; set; }
        public virtual DbSet<ExInvoicesDetail> ExInvoicesDetails { get; set; }
        public virtual DbSet<ExInvoicesType> ExInvoicesTypes { get; set; }
        public virtual DbSet<ActivationKeys> ActivationKeys { get; set; }
        public virtual DbSet<ExLocallyWanted> ExLocallyWanteds { get; set; }
        public virtual DbSet<ExTaswya> ExTaswya { get; set; }
        public virtual DbSet<ExTaswyaDetail> ExTaswyaDetail { get; set; }

        public virtual DbSet<ExMonetaryAgency> ExMonetaryAgencies { get; set; }

        public virtual DbSet<ExPaymentMethod> ExPaymentMethods { get; set; }

        public virtual DbSet<ExSamaCurrency> ExSamaCurrencies { get; set; }

        public virtual DbSet<ExSetting> ExSettings { get; set; }

        public virtual DbSet<ExStatisticalDataVar> ExStatisticalDataVars { get; set; }

        public virtual DbSet<ExSupplier> ExSuppliers { get; set; }

        public virtual DbSet<ExSuppliersAsBranch> ExSuppliersAsBranches { get; set; }

        public virtual DbSet<ExSuppliersType> ExSuppliersTypes { get; set; }

        public virtual DbSet<ExSuppliersWithoutBranch> ExSuppliersWithoutBranches { get; set; }

        public virtual DbSet<ExWholeInvoice> ExWholeInvoices { get; set; }

        public virtual DbSet<ExWholeInvoiceStatus> ExWholeInvoiceStatuses { get; set; }

        public virtual DbSet<ExWholeInvoicesDetail> ExWholeInvoicesDetails { get; set; }

        public virtual DbSet<ExWholePaymentMethod> ExWholePaymentMethods { get; set; }


        public virtual DbSet<IsilList> IsilLists { get; set; }

        public virtual DbSet<IsilXmlDatum> IsilXmlData { get; set; }
        
        public virtual DbSet<AJvAccountSetting> AJvAccountSetting { get; set; }


        //public virtual DbSet<Notification> Notifications { get; set; }

        //public virtual DbSet<Permission> Permissions { get; set; }

        public virtual DbSet<Privilage2> Privilage2s { get; set; }



        public virtual DbSet<SecForm> SecForms { get; set; }

        public virtual DbSet<SecFormsFunction> SecFormsFunctions { get; set; }

        public virtual DbSet<SecFunction> SecFunctions { get; set; }

        public virtual DbSet<SecTransactionLog> SecTransactionLogs { get; set; }

        public virtual DbSet<SecUser> SecUsers { get; set; }

        public virtual DbSet<SecUsersForm> SecUsersForms { get; set; }

        public virtual DbSet<SecUsersFunction> SecUsersFunctions { get; set; }

        public virtual DbSet<SysAssembly> SysAssemblies { get; set; }

        public virtual DbSet<SysBackup> SysBackups { get; set; }

        public virtual DbSet<SysBranch> SysBranches { get; set; }

        public virtual DbSet<SysBranchesAuto> SysBranchesAutos { get; set; }

        public virtual DbSet<SysMobileIntegration> SysMobileIntegrations { get; set; }

        public virtual DbSet<SysReplicationSetting> SysReplicationSettings { get; set; }

        public virtual DbSet<SysSetting> SysSettings { get; set; }

        public virtual DbSet<SysSystemInfo> SysSystemInfos { get; set; }

        public virtual DbSet<SysSystemOption> SysSystemOptions { get; set; }

        public virtual DbSet<SysWebsiteIntegration> SysWebsiteIntegrations { get; set; }

        public virtual DbSet<TechSupTicket> TechSupTickets { get; set; }
        public virtual DbSet<Treasury> Treasury { get; set; }

        //public DbSet<ExBank> Banks { get; set; }
        //public DbSet<ExCountry> Countries { get; set; }
        //public DbSet<Currency> CurrenciesMains { get; set; }
        //public DbSet<ExIdsource> IdentitySources { get; set; }
        //public DbSet<ExClientJob> Jobs { get; set; }
        //public DbSet<ExExchangePurpose> TransferPurposes { get; set; }

        //public DbSet<Screens> Screens { get; set; }
        //public DbSet<PrivilageType> PrivilageType { get; set; }
        //public DbSet<Privilage> Privilage { get; set; }


        public DBContext(     ) : base()
        {
            //this.session = session;
            //this.userConfiguration = userConfiguration;
            //this.roleConfiguration = roleConfiguration;
            //this.userRolesConfiguration = userRolesConfiguration;
            ////temperory solution to prevent deleted users, should be move to DynamoAuthorize or AppAuthorize
            //if (this.session.UserId != null)
            //{
            //    var user = this.Users.Find(this.session.UserId);
            //    if (user == null)
            //    {
            //        throw new DynamoException("User not existed!");
            //    }
            //}
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {

            base.OnModelCreating(builder);
            ApplyConfigurations(builder);
            SetProductMapping(builder);
            SetAttachmentMapping(builder);

            builder.Entity<ExBank>()
           .Property(e => e.IsActve)
           .HasDefaultValue(ActiveEnum.Active);

            //builder.Entity<ExClientJob>()
            //.Property(e => e.IsActve)
            //.HasDefaultValue(ActiveEnum.Active);

            builder.Entity<ExCountry>()
            .Property(e => e.IsActve)
            .HasDefaultValue(ActiveEnum.Active);

            //builder.Entity<Currency>()
            //.Property(e => e.IsActve)
            //.HasDefaultValue(ActiveEnum.Active);

            //builder.Entity<ExIdsource>()
            //.Property(e => e.IsActve)
            //.HasDefaultValue(ActiveEnum.Active);
            //builder.Entity<ExExchangePurpose>()
            //.Property(e => e.IsActve)
            //.HasDefaultValue(ActiveEnum.Active);



            builder.Entity<AAccount>(entity =>
            {
                entity.HasKey(e => e.AccountId);

                entity.ToTable("A_Accounts", tb =>
                {
                    ////tb.HasTrigger("TRG_A_Accounts_Delete");
                    ////tb.HasTrigger("TRG_A_Accounts_DxDelete");
                    ////tb.HasTrigger("TRG_A_Accounts_DxInsert");
                    ////tb.HasTrigger("TRG_A_Accounts_DxUpdate");
                });

                entity.Property(e => e.AccountId)
                    .ValueGeneratedNever()
                    .HasColumnName("AccountID");
                entity.Property(e => e.AccountName)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.CostCenterId).HasColumnName("CostCenterID");
                entity.Property(e => e.CurrencyId).HasColumnName("CurrencyID");
                entity.Property(e => e.DepreciationAccountId).HasColumnName("DepreciationAccountID");
                entity.Property(e => e.LimitOverflow).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.ParentId).HasColumnName("ParentID");
                entity.Property(e => e.ProvisionAccountId).HasColumnName("ProvisionAccountID");

                entity.HasOne(d => d.DepreciationAccount).WithMany(p => p.InverseDepreciationAccount)
                    .HasForeignKey(d => d.DepreciationAccountId)
                    .HasConstraintName("FK_A_Accounts_A_Accounts_Depreciation");

                entity.HasOne(d => d.Parent).WithMany(p => p.InverseParent)
                    .HasForeignKey(d => d.ParentId)
                    .HasConstraintName("FK_A_Accounts_A_Accounts_Parent");

                entity.HasOne(d => d.ProvisionAccount).WithMany(p => p.InverseProvisionAccount)
                    .HasForeignKey(d => d.ProvisionAccountId)
                    .HasConstraintName("FK_A_Accounts_A_Accounts_Provision");
            });

            builder.Entity<AAccountClassification>(entity =>
            {
                entity.HasKey(e => e.ClassificationId);

                entity.ToTable("A_AccountClassification");

                entity.Property(e => e.ClassificationId)
                    .ValueGeneratedNever()
                    .HasColumnName("ClassificationID");
                entity.Property(e => e.ClassificationNameAr)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.ClassificationNameEn)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            builder.Entity<ACashFlow>(entity =>
            {
                entity.HasKey(e => e.VoucherId);

                entity.ToTable("A_CashFlow", tb =>
                {
                    ////tb.HasTrigger("TRG_A_CashFlow_DxDelete");
                    ////tb.HasTrigger("TRG_A_CashFlow_DxInsert");
                    ////tb.HasTrigger("TRG_A_CashFlow_DxUpdate");
                });

                entity.Property(e => e.VoucherId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("VoucherID");
                entity.Property(e => e.Amount).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.BankId).HasColumnName("BankID");
                entity.Property(e => e.CheckNo).HasMaxLength(20);
                entity.Property(e => e.CurrencyId).HasColumnName("CurrencyID");
                entity.Property(e => e.Remarks).HasMaxLength(200);
                entity.Property(e => e.StatusId)
                    .HasDefaultValue(1)
                    .HasColumnName("StatusID");
                entity.Property(e => e.SupplierId).HasColumnName("SupplierID");
                entity.Property(e => e.UserId).HasColumnName("UserID");
                entity.Property(e => e.VoucherDate).HasColumnType("datetime");
                entity.Property(e => e.VoucherTime).HasColumnType("datetime");
                entity.Property(e => e.VoucherTypeId).HasColumnName("VoucherTypeID");

                entity.HasOne(d => d.Currency).WithMany(p => p.ACashFlows)
                    .HasForeignKey(d => d.CurrencyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_A_CashFlow_EX_Currencies");

                entity.HasOne(d => d.Status).WithMany(p => p.ACashFlows)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_A_CashFlow_A_CashFlowStatus");

                entity.HasOne(d => d.Supplier).WithMany(p => p.ACashFlows)
                    .HasForeignKey(d => d.SupplierId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_A_CashFlow_EX_Suppliers");

                entity.HasOne(d => d.User).WithMany(p => p.ACashFlows)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_A_CashFlow_Sec_Users");

                entity.HasOne(d => d.VoucherType).WithMany(p => p.ACashFlows)
                    .HasForeignKey(d => d.VoucherTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_A_CashFlow_A_CashFlowType");
            });

            builder.Entity<ACashFlowStatus>(entity =>
            {
                entity.HasKey(e => e.StatusId);

                entity.ToTable("A_CashFlowStatus");

                entity.Property(e => e.StatusId)
                    .ValueGeneratedNever()
                    .HasColumnName("StatusID");
                entity.Property(e => e.StatusNameAr)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.StatusNameEn)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            builder.Entity<ACashFlowType>(entity =>
            {
                entity.HasKey(e => e.VoucherTypeId);

                entity.ToTable("A_CashFlowType");

                entity.Property(e => e.VoucherTypeId)
                    .ValueGeneratedNever()
                    .HasColumnName("VoucherTypeID");
                entity.Property(e => e.VoucherTypeNameAr)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.VoucherTypeNameEn)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            builder.Entity<AJv>(entity =>
            {
                entity.HasKey(e => e.Jvid);

                entity.ToTable("A_JVs", tb =>
                {
                    ////tb.HasTrigger("TRG_A_JVs_Delete");
                    ////tb.HasTrigger("TRG_A_JVs_DxDelete");
                    ////tb.HasTrigger("TRG_A_JVs_DxInsert");
                    ////tb.HasTrigger("TRG_A_JVs_DxUpdate");
                });

                entity.HasIndex(e => new { e.Generated, e.Jvtime }, "IX_A_JVs_01");

                entity.Property(e => e.Jvid)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("JVID");
                entity.Property(e => e.BranchTransferId).HasColumnName("BranchTransferID");
                entity.Property(e => e.CashFlowId).HasColumnName("CashFlowID");
                entity.Property(e => e.InvoiceId).HasColumnName("InvoiceID");
                entity.Property(e => e.Jvdate)
                    .HasColumnType("datetime")
                    .HasColumnName("JVDate");
                entity.Property(e => e.Jvno).HasColumnName("JVNo");
                entity.Property(e => e.JvstatusId).HasColumnName("JVStatusID");
                entity.Property(e => e.Jvtime)
                    .HasColumnType("datetime")
                    .HasColumnName("JVTime");
                entity.Property(e => e.JvtypeId).HasColumnName("JVTypeID");
                entity.Property(e => e.Remarks).HasMaxLength(200);
                entity.Property(e => e.WholeInvoiceId).HasColumnName("WholeInvoiceID");

                entity.HasOne(d => d.BranchTransfer).WithMany(p => p.AJvs)
                    .HasForeignKey(d => d.BranchTransferId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_A_JVs_EX_BranchTransfers");

                entity.HasOne(d => d.CashFlow).WithMany(p => p.AJvs)
                    .HasForeignKey(d => d.CashFlowId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_A_JVs_A_CashFlow");

                entity.HasOne(d => d.Invoice).WithMany(p => p.AJvs)
                    .HasForeignKey(d => d.InvoiceId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_A_JVs_EX_Invoices");

                entity.HasOne(d => d.Jvstatus).WithMany(p => p.AJvs)
                    .HasForeignKey(d => d.JvstatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_A_JVs_A_JVStatus");

                entity.HasOne(d => d.Jvtype).WithMany(p => p.AJvs)
                    .HasForeignKey(d => d.JvtypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_A_JVs_A_JVType");

                entity.HasOne(d => d.WholeInvoice).WithMany(p => p.AJvs)
                    .HasForeignKey(d => d.WholeInvoiceId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_A_JVs_EX_WholeInvoices");
            });

            builder.Entity<AJvsDetail>(entity =>
            {
                entity.HasKey(e => e.JvdetailId);

                entity.ToTable("A_JVsDetails", tb =>
                {
                    ////tb.HasTrigger("TRG_A_JVsDetails_DxDelete");
                    ////tb.HasTrigger("TRG_A_JVsDetails_DxInsert");
                    ////tb.HasTrigger("TRG_A_JVsDetails_DxUpdate");
                });

                entity.HasIndex(e => e.CurrencyId, "IX_A_JVsDetails_01");

                entity.HasIndex(e => e.Jvid, "IX_A_JVsDetails_02");

                entity.Property(e => e.JvdetailId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("JVDetailID");
                entity.Property(e => e.AccountId).HasColumnName("AccountID");
                entity.Property(e => e.Credit).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.CurrencyId).HasColumnName("CurrencyID");
                entity.Property(e => e.Debit).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.ForeignCredit).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.ForeignDebit).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.Jvid).HasColumnName("JVID");

                entity.HasOne(d => d.Account).WithMany(p => p.AJvsDetails)
                    .HasForeignKey(d => d.AccountId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_A_JVsDetails_A_Accounts");

                entity.HasOne(d => d.Currency).WithMany(p => p.AJvsDetails)
                    .HasForeignKey(d => d.CurrencyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_A_JVsDetails_EX_Currencies");

                entity.HasOne(d => d.Jv).WithMany(p => p.AJvsDetails)
                    .HasForeignKey(d => d.Jvid)
                    .HasConstraintName("FK_A_JVsDetails_A_JVs");
            });

            builder.Entity<AJvstatus>(entity =>
            {
                entity.HasKey(e => e.StatusId);

                entity.ToTable("A_JVStatus");

                entity.Property(e => e.StatusId)
                    .ValueGeneratedNever()
                    .HasColumnName("StatusID");
                entity.Property(e => e.StatusNameAr)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.StatusNameEn)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            builder.Entity<AJvtype>(entity =>
            {
                entity.HasKey(e => e.JvtypeId);

                entity.ToTable("A_JVType");

                entity.Property(e => e.JvtypeId)
                    .ValueGeneratedNever()
                    .HasColumnName("JVTypeID");
                entity.Property(e => e.JvtypeNameAr)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("JVTypeNameAr");
                entity.Property(e => e.JvtypeNameEn)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("JVTypeNameEn");
            });

            builder.Entity<ASettlement>(entity =>
            {
                entity.HasKey(e => e.SettlementId);

                entity.ToTable("A_Settlements", tb =>
                {
                    ////tb.HasTrigger("TRG_A_Settlements_DxDelete");
                    ////tb.HasTrigger("TRG_A_Settlements_DxInsert");
                    ////tb.HasTrigger("TRG_A_Settlements_DxUpdate");
                });

                entity.Property(e => e.SettlementId)
                    .ValueGeneratedNever()
                    .HasColumnName("SettlementID");
                entity.Property(e => e.CreationDate).HasColumnType("datetime");
                entity.Property(e => e.SettlementEndDate).HasColumnType("datetime");
                entity.Property(e => e.SettlementStartDate).HasColumnType("datetime");
                entity.Property(e => e.UserId).HasColumnName("UserID");
            });

            //builder.Entity<Bank>(entity =>
            //{
            //    entity.Property(e => e.IsActve).HasDefaultValue(1);
            //});

            //builder.Entity<Country>(entity =>
            //{
            //    entity.Property(e => e.IsActve).HasDefaultValue(1);
            //});

            //builder.Entity<CurrenciesMain>(entity =>
            //{
            //    entity.HasKey(e => e.Id).HasName("PK_Currencies");

            //    entity.ToTable("CurrenciesMain");

            //    entity.HasIndex(e => e.CountryId, "IX_Currencies_CountryId");

            //    entity.Property(e => e.IsActve).HasDefaultValue(1);

            //    entity.HasOne(d => d.Country).WithMany(p => p.CurrenciesMains)
            //        .HasForeignKey(d => d.CountryId)
            //        .HasConstraintName("FK_Currencies_Countries_CountryId");
            //});

            builder.Entity<Currency>(entity =>
            {
                entity.HasKey(e => e.CurrencyId).HasName("PK_Ex_Currencies");

                //entity.ToTable(tb =>
                //{
                //    ////tb.HasTrigger("TRG_EX_Currencies_DxDelete");
                //    ////tb.HasTrigger("TRG_EX_Currencies_DxInsert");
                //    ////tb.HasTrigger("TRG_EX_Currencies_DxUpdate");
                //});

                entity.HasIndex(e => e.CurrencyId, "IX_EX_Currencies");

                //entity.HasIndex(e => e.CurrencyCode, "UQ_EX_Currencies_Code").IsUnique();

                //entity.HasIndex(e => e.CurrencyNameAr, "UQ_Ex_Currencies_NameAr").IsUnique();

                //entity.HasIndex(e => e.CurrencyNameEn, "UQ_Ex_Currencies_NameEn").IsUnique();

                entity.Property(e => e.CurrencyId)
                    .ValueGeneratedNever()
                    .HasColumnName("CurrencyID");
                entity.Property(e => e.BuyPrice).HasColumnType("decimal(18, 14)");
                entity.Property(e => e.CurrencyNameAr).HasMaxLength(50);
                entity.Property(e => e.CurrencyNameEn).HasMaxLength(50);
                entity.Property(e => e.OpeningBalance).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.OpeningPrice).HasColumnType("decimal(18, 14)");
                entity.Property(e => e.SalePrice).HasColumnType("decimal(18, 14)");
                entity.Property(e => e.ShowInPricesScreen).HasDefaultValue(true);
                entity.Property(e => e.Sign)
                    .IsRequired()
                    .HasMaxLength(4);
                entity.Property(e => e.ValuationPrice).HasColumnType("decimal(18, 14)");
            });

            builder.Entity<DxTransaction>(entity =>
            {
                entity.HasKey(e => e.TransactionId).HasName("PK_DX_Transactions_1");

                entity.ToTable("DX_Transactions");

                entity.Property(e => e.TransactionId).HasColumnName("TransactionID");
                entity.Property(e => e.CreationDate).HasColumnType("datetime");
                entity.Property(e => e.SqlStatement).IsRequired();
            });

            builder.Entity<ExAttachmentType>(entity =>
            {
                entity.HasKey(e => e.TypeId);

                entity.ToTable("EX_AttachmentType");

                entity.Property(e => e.TypeId)
                    .ValueGeneratedNever()
                    .HasColumnName("TypeID");
                entity.Property(e => e.TypeNameAr).HasMaxLength(50);
                entity.Property(e => e.TypeNameEn).HasMaxLength(50);
            });

            builder.Entity<ExBank>(entity =>
            {
                entity.HasKey(e => e.BankId);

                entity.ToTable("EX_Banks", tb =>
                {
                    //tb.HasTrigger("TRG_EX_Banks_DxDelete");
                    //tb.HasTrigger("TRG_EX_Banks_DxInsert");
                    //tb.HasTrigger("TRG_EX_Banks_DxUpdate");
                });

                entity.Property(e => e.BankId)
                    .ValueGeneratedNever()
                    .HasColumnName("BankID");
                entity.Property(e => e.AccountId).HasColumnName("AccountID");
                entity.Property(e => e.BankAccountNameAr).HasMaxLength(80);
                entity.Property(e => e.BankAccountNameEn).HasMaxLength(80);

                entity.HasOne(d => d.Account).WithMany(p => p.ExBanks)
                    .HasForeignKey(d => d.AccountId)
                    .HasConstraintName("FK_EX_Banks_A_Accounts");
            });

            builder.Entity<ExBranch>(entity =>
            {
                entity.HasKey(e => e.BranchId).HasName("PK_Branches");

                entity.ToTable("EX_Branches");

                entity.Property(e => e.BranchId)
                    .ValueGeneratedNever()
                    .HasColumnName("BranchID");
                entity.Property(e => e.AccountId).HasColumnName("AccountID");
                entity.Property(e => e.BranchCode)
                    .IsRequired()
                    .HasMaxLength(10);
                entity.Property(e => e.BranchNameAr)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.BranchNameEn)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            builder.Entity<SecPermissionType>(entity =>
            {
                entity.HasKey(e => e.PermissionTypeId).HasName("PK_PermissionTypes");

                entity.ToTable("SecPermissionType");

                entity.Property(e => e.PermissionTypeId)
                    .ValueGeneratedNever()
                    .HasColumnName("PermissionTypeId");
                entity.Property(e => e.PermissionTypeNameEn)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.PermissionTypeNameAr)
                    .IsRequired()
                    .HasMaxLength(50);
            });


            builder.Entity<ExBranchTransfer>(entity =>
            {
                entity.HasKey(e => e.VoucherId);

                entity.ToTable("EX_BranchTransfers", tb =>
                {
                    //tb.HasTrigger("TRG_EX_BranchTransfers_DxDelete");
                    //tb.HasTrigger("TRG_EX_BranchTransfers_DxInsert");
                    //tb.HasTrigger("TRG_EX_BranchTransfers_DxUpdate");
                });

                entity.Property(e => e.VoucherId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("VoucherID");
                entity.Property(e => e.BranchId).HasColumnName("BranchID");
               // entity.Property(e => e.CashierId).HasColumnName("CashierID");
                entity.Property(e => e.Receptionist).HasMaxLength(100);
                entity.Property(e => e.Remarks).HasMaxLength(200);
                entity.Property(e => e.StatusId)
                    .HasDefaultValue(1)
                    .HasColumnName("StatusID");
                entity.Property(e => e.TypeId).HasColumnName("TypeID");
                entity.Property(e => e.VoucherDate).HasColumnType("datetime");
                entity.Property(e => e.VoucherTime).HasColumnType("datetime");

                entity.HasOne(d => d.Branch).WithMany(p => p.ExBranchTransfers)
                    .HasForeignKey(d => d.BranchId)
                    .HasConstraintName("FK_EX_BranchTransfers_Sys_Branches");

                //entity.HasOne(d => d.Cashier).WithMany(p => p.ExBranchTransfers)
                //    .HasForeignKey(d => d.CashierId)
                //    .OnDelete(DeleteBehavior.ClientSetNull)
                //    .HasConstraintName("FK_EX_BranchTransfers_EX_Cashiers");

                entity.HasOne(d => d.Status).WithMany(p => p.ExBranchTransfers)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EX_BranchTransfers_EX_BranchTransferStatus");

                entity.HasOne(d => d.Type).WithMany(p => p.ExBranchTransfers)
                    .HasForeignKey(d => d.TypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EX_BranchTransfers_EX_BranchTransferType");
            });

            builder.Entity<ExBranchTransferStatus>(entity =>
            {
                entity.HasKey(e => e.StatusId);

                entity.ToTable("EX_BranchTransferStatus");

                entity.Property(e => e.StatusId)
                    .ValueGeneratedNever()
                    .HasColumnName("StatusID");
                entity.Property(e => e.StatusNameAr)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.StatusNameEn)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            builder.Entity<ExBranchTransferType>(entity =>
            {
                entity.HasKey(e => e.TypeId);

                entity.ToTable("EX_BranchTransferType");

                entity.Property(e => e.TypeId)
                    .ValueGeneratedNever()
                    .HasColumnName("TypeID");
                entity.Property(e => e.TypeNameAr)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.TypeNameEn)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            builder.Entity<ExBranchTransfersDetail>(entity =>
            {
                entity.HasKey(e => e.VoucherDetailId);

                entity.ToTable("EX_BranchTransfersDetails", tb =>
                {
                    //tb.HasTrigger("TRG_EX_BranchTransfersDetails_DxDelete");
                    //tb.HasTrigger("TRG_EX_BranchTransfersDetails_DxInsert");
                    //tb.HasTrigger("TRG_EX_BranchTransfersDetails_DxUpdate");
                });

                entity.Property(e => e.VoucherDetailId)
                    .ValueGeneratedNever()
                    .HasColumnName("VoucherDetailID");
                entity.Property(e => e.Amount).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.CurrencyId).HasColumnName("CurrencyID");
                entity.Property(e => e.ExRate).HasColumnType("decimal(18, 14)");
                entity.Property(e => e.VoucherId).HasColumnName("VoucherID");

                entity.HasOne(d => d.Currency).WithMany(p => p.ExBranchTransfersDetails)
                    .HasForeignKey(d => d.CurrencyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EX_BranchTransfersDetails_EX_Currencies");

                entity.HasOne(d => d.Voucher).WithMany(p => p.ExBranchTransfersDetails)
                    .HasForeignKey(d => d.VoucherId)
                    .HasConstraintName("FK_EX_BranchTransfersDetails_EX_BranchTransfers");
            });

            //builder.Entity<ExCashier>(entity =>
            //{
            //    entity.HasKey(e => e.CashierId);

            //    entity.ToTable("EX_Cashiers");

            //    entity.Property(e => e.CashierId)
            //        .ValueGeneratedNever()
            //        .HasColumnName("CashierID");
            //    entity.Property(e => e.BranchId).HasColumnName("BranchID");
            //    entity.Property(e => e.CashierNameAr).HasMaxLength(200);
            //    entity.Property(e => e.CashierNameEn).HasMaxLength(200);
            //});

            //builder.Entity<ExClient>()
            //.HasKey(e => e.ClientId);

            //builder.Entity<ExClient>()
            //.Property(e => e.ClientId)
            //.ValueGeneratedOnAdd();

            builder.Entity<ExClient>(entity =>
            {
               entity.HasKey(e => e.ClientId);
                entity.Property(e => e.ClientId)
                .ValueGeneratedOnAdd();

                entity.ToTable("EX_Clients", tb =>
                {
                    ////tb.HasTrigger("TRG_EX_Clients_DxDelete");
                    ////tb.HasTrigger("TRG_EX_Clients_DxInsert");
                    ////tb.HasTrigger("TRG_EX_Clients_DxUpdate");
                    ////tb.HasTrigger("TRG_EX_Clients_Modify");
                });

                //entity.Property(e => e.ClientId)
                //    .ValueGeneratedNever()
                //    .HasColumnName("ClientID");
                entity.Property(e => e.Address).HasMaxLength(200);
                entity.Property(e => e.BirthCityId).HasColumnName("BirthCityID");
                entity.Property(e => e.BirthCountryId).HasColumnName("BirthCountryID");
                entity.Property(e => e.Birthdate).HasColumnType("datetime");
                entity.Property(e => e.Capital).HasColumnType("decimal(18, 0)");
                entity.Property(e => e.ClientCode)
                    .IsRequired()
                    .HasMaxLength(16);
                entity.Property(e => e.ClientNameAr).HasMaxLength(100);
                entity.Property(e => e.ClientNameEn).HasMaxLength(100);
                entity.Property(e => e.ClientTypeId).HasColumnName("ClientTypeID");
                entity.Property(e => e.CountryId).HasColumnName("CountryID");
                entity.Property(e => e.CreationDate).HasColumnType("datetime");
                entity.Property(e => e.CrexpiredDate)
                    .HasColumnType("datetime")
                    .HasColumnName("CRExpiredDate");
                
                entity.Property(e => e.Crnumber)
                    .HasMaxLength(10)
                    .HasColumnName("CRNumber");
                entity.Property(e => e.ExchangePurposeId).HasColumnName("ExchangePurposeID");
                entity.Property(e => e.IdexpiredDate)
                    .HasColumnType("datetime")
                    .HasColumnName("IDExpiredDate");
                entity.Property(e => e.IdexpiryDate)
                    .HasMaxLength(10)
                    .HasColumnName("IDExpiryDate");
                entity.Property(e => e.Idnumber)
                    .HasMaxLength(20)
                    .HasColumnName("IDNumber");
                entity.Property(e => e.Idsource)
                    .HasMaxLength(30)
                    .HasColumnName("IDSource");
                entity.Property(e => e.IdsourceId).HasColumnName("IDSourceID");
                entity.Property(e => e.IdtypeId).HasColumnName("IDTypeID");
                entity.Property(e => e.Income).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.IncomeSource).HasMaxLength(50);
                entity.Property(e => e.IncomeSourceId).HasColumnName("IncomeSourceID");
                entity.Property(e => e.JobAuthority).HasMaxLength(50);
                entity.Property(e => e.JobId).HasColumnName("JobID");
                entity.Property(e => e.JobTitle).HasMaxLength(50);
                entity.Property(e => e.Mobile).HasMaxLength(15);
                entity.Property(e => e.OtherMobile).HasMaxLength(20);
                entity.Property(e => e.OthrePhone).HasMaxLength(20);
                entity.Property(e => e.PurposeOfExchange).HasMaxLength(100);
                entity.Property(e => e.Specialty).HasMaxLength(50);
                entity.Property(e => e.Sponsor).HasMaxLength(50);
                entity.Property(e => e.UnifiedNumber).HasMaxLength(10);

                entity.HasOne(d => d.BirthCity).WithMany(p => p.ExClientBirthCities)
                    .HasForeignKey(d => d.BirthCityId)
                    .HasConstraintName("FK_EX_Clients_BirthCity");

                entity.HasOne(d => d.BirthCountry).WithMany(p => p.ExClientBirthCountries)
                    .HasForeignKey(d => d.BirthCountryId)
                    .HasConstraintName("FK_EX_Clients_BirthCountry");

                entity.HasOne(d => d.Country).WithMany(p => p.ExClientCountries)
                    .HasForeignKey(d => d.CountryId)
                    .HasConstraintName("FK_EX_Clients_Nationality");

                entity.HasOne(d => d.ExchangePurpose).WithMany(p => p.ExClients)
                    .HasForeignKey(d => d.ExchangePurposeId)
                    .HasConstraintName("FK_EX_Clients_EX_ExchangePurposes");

                entity.HasOne(d => d.IdsourceNavigation).WithMany(p => p.ExClientIdsourceNavigations)
                    .HasForeignKey(d => d.IdsourceId)
                    .HasConstraintName("FK_EX_Clients_EX_IDSources");

                entity.HasOne(d => d.IncomeSourceNavigation).WithMany(p => p.ExClients)
                    .HasForeignKey(d => d.IncomeSourceId)
                    .HasConstraintName("FK_EX_Clients_EX_IncomeSources");
            });

            builder.Entity<ExClientJob>(entity =>
            {
                entity.HasKey(e => e.JobId);

                entity.ToTable("EX_ClientJob", tb =>
                {
                    //tb.HasTrigger("TRG_EX_ClientJob_DxDelete");
                    //tb.HasTrigger("TRG_EX_ClientJob_DxInsert");
                    //tb.HasTrigger("TRG_EX_ClientJob_DxUpdate");
                });

                entity.HasIndex(e => e.JobCode, "UQ_EX_ClientJob_JobCode").IsUnique();

                entity.HasIndex(e => e.JobName, "UQ_EX_ClientJob_JobName").IsUnique();

                entity.Property(e => e.JobId)
                    .ValueGeneratedNever()
                    .HasColumnName("JobID");
                entity.Property(e => e.JobCode)
                    .IsRequired()
                    .HasMaxLength(10);
                entity.Property(e => e.JobName)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.SeverityId).HasColumnName("SeverityID");

                entity.HasOne(d => d.Severity).WithMany(p => p.ExClientJobs)
                    .HasForeignKey(d => d.SeverityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EX_ClientJob_EX_ClientJobSeverity");
            });

            builder.Entity<ExClientJobSeverity>(entity =>
            {
                entity.HasKey(e => e.SeverityId);

                entity.ToTable("EX_ClientJobSeverity");

                entity.Property(e => e.SeverityId)
                    .ValueGeneratedNever()
                    .HasColumnName("SeverityID");
                entity.Property(e => e.SeverityNameAr)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.SeverityNameEn)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            builder.Entity<ExClientsAttachment>(entity =>
            {
                entity.HasKey(e => e.ClientAttachmentId);

                entity.ToTable("EX_ClientsAttachments", tb =>
                {
                    //tb.HasTrigger("TRG_EX_ClientsAttachments_DxDelete");
                    //tb.HasTrigger("TRG_EX_ClientsAttachments_DxInsert");
                    //tb.HasTrigger("TRG_EX_ClientsAttachments_DxUpdate");
                });

                entity.Property(e => e.ClientAttachmentId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ClientAttachmentID");
                entity.Property(e => e.AttachmentFilePath)
                    .HasMaxLength(10)
                    .IsUnicode(false);
                entity.Property(e => e.AttachmentTypeId).HasColumnName("AttachmentTypeID");
                entity.Property(e => e.ClientId).HasColumnName("ClientID");

                entity.HasOne(d => d.AttachmentType).WithMany(p => p.ExClientsAttachments)
                    .HasForeignKey(d => d.AttachmentTypeId)
                    .HasConstraintName("FK_EX_ClientsAttachments_EX_AttachmentType");

                entity.HasOne(d => d.Client).WithMany(p => p.ExClientsAttachments)
                    .HasForeignKey(d => d.ClientId)
                    .HasConstraintName("FK_EX_ClientsAttachments_EX_Clients");
            });

            builder.Entity<ExClientsMembership>(entity =>
            {
                entity.HasKey(e => e.MembershipId).HasName("PK_EX_ClientMemberships");

                entity.ToTable("EX_ClientsMemberships", tb =>
                {
                    //tb.HasTrigger("TRG_EX_ClientsMemberships_DxDelete");
                    //tb.HasTrigger("TRG_EX_ClientsMemberships_DxInsert");
                    //tb.HasTrigger("TRG_EX_ClientsMemberships_DxUpdate");
                });

                entity.Property(e => e.MembershipId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("MembershipID");
                entity.Property(e => e.ClientId).HasColumnName("ClientID");
                entity.Property(e => e.CreationDate).HasColumnType("datetime");
                entity.Property(e => e.EndDate).HasColumnType("datetime");
                entity.Property(e => e.JobTitle).HasMaxLength(50);
                entity.Property(e => e.Salary).HasColumnType("decimal(18, 0)");
                entity.Property(e => e.StartDate).HasColumnType("datetime");

                entity.HasOne(d => d.Client).WithMany(p => p.ExClientsMemberships)
                    .HasForeignKey(d => d.ClientId)
                    .HasConstraintName("FK_EX_ClientMemberships_EX_Clients");
            });

            builder.Entity<ExClientsRepresentative>(entity =>
            {
                entity.HasKey(e => e.RepresentativeId);

                entity.ToTable("EX_ClientsRepresentatives", tb =>
                {
                    //tb.HasTrigger("TRG_EX_ClientsRepresentatives_DxDelete");
                    //tb.HasTrigger("TRG_EX_ClientsRepresentatives_DxInsert");
                    //tb.HasTrigger("TRG_EX_ClientsRepresentatives_DxUpdate");
                });

                entity.Property(e => e.RepresentativeId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("RepresentativeID");
                entity.Property(e => e.ClientId).HasColumnName("ClientID");
                entity.Property(e => e.RepresentativeName).HasMaxLength(50);

                entity.HasOne(d => d.Client).WithMany(p => p.ExClientsRepresentatives)
                    .HasForeignKey(d => d.ClientId)
                    .HasConstraintName("FK_EX_ClientsRepresentatives_EX_Clients");
            });

            builder.Entity<ExClientsType>(entity =>
            {
                entity.HasKey(e => e.ClientTypeId);

                entity.ToTable("EX_ClientsType");

                entity.Property(e => e.ClientTypeId)
                    .ValueGeneratedNever()
                    .HasColumnName("ClientTypeID");
                entity.Property(e => e.ClientTypeNameAr)
                    .IsRequired()
                    .HasMaxLength(40);
                entity.Property(e => e.ClientTypeNameEn)
                    .IsRequired()
                    .HasMaxLength(40);
                entity.Property(e => e.MonetaryAgencyReportId).HasColumnName("MonetaryAgencyReportID");
            });

            builder.Entity<ExCountry>(entity =>
            {
                entity.HasKey(e => e.CountryId).HasName("PK_Country");

                entity.ToTable("EX_Countries", tb =>
                {
                    //tb.HasTrigger("TRG_Countries_DxDelete");
                    //tb.HasTrigger("TRG_Countries_DxInsert");
                    //tb.HasTrigger("TRG_Countries_DxUpdate");
                });

                entity.Property(e => e.CountryId)
                    .ValueGeneratedNever()
                    .HasColumnName("CountryID");
                entity.Property(e => e.CountryNameAr).HasMaxLength(100);
                entity.Property(e => e.CountryNameEn).HasMaxLength(100);
                entity.Property(e => e.SeverityId)
                    .HasDefaultValue(1)
                    .HasColumnName("SeverityID");

                entity.HasOne(d => d.Severity).WithMany(p => p.ExCountries)
                    .HasForeignKey(d => d.SeverityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Countries_EX_ClientJobSeverity");
            });

            builder.Entity<ExCurrenciesBvr>(entity =>
            {
                entity.HasKey(e => e.Id).HasName("PK_EX_CurrenciesValRates");

                entity.ToTable("EX_CurrenciesBVR", tb =>
                {
                    //tb.HasTrigger("TRG_EX_CurrenciesBVR_DxDelete");
                    //tb.HasTrigger("TRG_EX_CurrenciesBVR_DxInsert");
                    //tb.HasTrigger("TRG_EX_CurrenciesBVR_DxUpdate");
                });

                entity.Property(e => e.Id).HasColumnName("ID");
                entity.Property(e => e.ActionDetailId).HasColumnName("ActionDetailID");
                entity.Property(e => e.ActionId).HasColumnName("ActionID");
                entity.Property(e => e.ActionTime).HasColumnType("datetime");
                entity.Property(e => e.ActionType)
                    .IsRequired()
                    .HasMaxLength(10);
                entity.Property(e => e.Amount).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.Balance).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.CurrencyId).HasColumnName("CurrencyID");
                entity.Property(e => e.Rate).HasColumnType("decimal(18, 14)");
                entity.Property(e => e.ValRate).HasColumnType("decimal(18, 14)");

                entity.HasOne(d => d.Currency).WithMany(p => p.ExCurrenciesBvrs)
                    .HasForeignKey(d => d.CurrencyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EX_CurrenciesValRates_EX_Currencies");
            });

            builder.Entity<ExCurrenciesMarketPrice>(entity =>
            {
                entity.ToTable("EX_CurrenciesMarketPrices", tb =>
                {
                    //tb.HasTrigger("TRG_EX_CurrenciesMarketPrices_DxDelete");
                    //tb.HasTrigger("TRG_EX_CurrenciesMarketPrices_DxInsert");
                    //tb.HasTrigger("TRG_EX_CurrenciesMarketPrices_DxUpdate");
                });

                entity.HasIndex(e => new { e.CurrencyId, e.MarketPriceDay }, "UQ_EX_CurrenciesMarketPrices").IsUnique();

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");
                entity.Property(e => e.CurrencyId).HasColumnName("CurrencyID");
                entity.Property(e => e.MarketPrice).HasColumnType("decimal(18, 14)");
                entity.Property(e => e.MarketPriceDay).HasColumnType("datetime");
            });

            builder.Entity<ExExchangePurpose>(entity =>
            {
                entity.HasKey(e => e.ExchangePurposeId);

                entity.ToTable("EX_ExchangePurposes", tb =>
                {
                    //tb.HasTrigger("TRG_EX_ExchangePurposes_DxDelete");
                    //tb.HasTrigger("TRG_EX_ExchangePurposes_DxInsert");
                    //tb.HasTrigger("TRG_EX_ExchangePurposes_DxUpdate");
                });

                entity.HasIndex(e => e.ExchangePurposeNameAr, "UQ_EX_ExchangePurposes").IsUnique();

                entity.Property(e => e.ExchangePurposeId)
                    .ValueGeneratedNever()
                    .HasColumnName("ExchangePurposeID");
                entity.Property(e => e.ExchangePurposeNameAr)
                    .IsRequired()
                    .HasMaxLength(100);
                entity.Property(e => e.ExchangePurposeNameEn).HasMaxLength(100);
            });

            builder.Entity<ExFormingStatus>(entity =>
            {
                entity.HasKey(e => e.FormingStatusId);

                entity.ToTable("EX_FormingStatus");

                entity.Property(e => e.FormingStatusId)
                    .ValueGeneratedNever()
                    .HasColumnName("FormingStatusID");
                entity.Property(e => e.FormingStatusNameAr)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.FormingStatusNameEn)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            builder.Entity<ExIdsource>(entity =>
            {
                entity.HasKey(e => e.IdsourceId);

                entity.ToTable("EX_IDSources", tb =>
                {
                    //tb.HasTrigger("TRG_EX_IDSources_DxDelete");
                    //tb.HasTrigger("TRG_EX_IDSources_DxInsert");
                    //tb.HasTrigger("TRG_EX_IDSources_DxUpdate");
                });

                entity.Property(e => e.IdsourceId)
                    .ValueGeneratedNever()
                    .HasColumnName("IDSourceID");
                entity.Property(e => e.CountryId).HasColumnName("CountryID");
                entity.Property(e => e.IdsourceNameAr)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasColumnName("IDSourceNameAr");
                entity.Property(e => e.IdsourceNameEn)
                    .HasMaxLength(100)
                    .HasColumnName("IDSourceNameEn");

                entity.HasOne(d => d.Country).WithMany(p => p.ExIdsources)
                    .HasForeignKey(d => d.CountryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EX_IDSources_Countries");
            });

            builder.Entity<ExIncomeSource>(entity =>
            {
                entity.HasKey(e => e.IncomeSourceId);

                entity.ToTable("EX_IncomeSources", tb =>
                {
                    //tb.HasTrigger("TRG_EX_IncomeSources_DxDelete");
                    //tb.HasTrigger("TRG_EX_IncomeSources_DxInsert");
                    //tb.HasTrigger("TRG_EX_IncomeSources_DxUpdate");
                });

                entity.HasIndex(e => e.IncomeSourceNameAr, "UQ_EX_IncomeSource_NameAr").IsUnique();

                entity.Property(e => e.IncomeSourceId)
                    .ValueGeneratedNever()
                    .HasColumnName("IncomeSourceID");
                entity.Property(e => e.IncomeSourceNameAr)
                    .IsRequired()
                    .HasMaxLength(100);
                entity.Property(e => e.IncomeSourceNameEn).HasMaxLength(100);
            });

            builder.Entity<ExInternalTransfer>(entity =>
            {
                entity.HasKey(e => e.TransferId);

                entity.ToTable("EX_InternalTransfers", tb =>
                {
                    //tb.HasTrigger("TRG_EX_InternalTransfers_DxDelete");
                    //tb.HasTrigger("TRG_EX_InternalTransfers_DxInsert");
                    //tb.HasTrigger("TRG_EX_InternalTransfers_DxUpdate");
                });

                entity.Property(e => e.TransferId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("TransferID");
                //entity.Property(e => e.CashierId).HasColumnName("CashierID");
                entity.Property(e => e.Remarks).HasMaxLength(200);
                entity.Property(e => e.TransferClosingDate).HasColumnType("datetime");
                entity.Property(e => e.TransferDate).HasColumnType("datetime");

                //entity.HasOne(d => d.Cashier).WithMany(p => p.ExInternalTransfers)
                //    .HasForeignKey(d => d.CashierId)
                //    .OnDelete(DeleteBehavior.ClientSetNull)
                //    .HasConstraintName("FK_EX_InternalTransfers_EX_Cashiers");
            });

            builder.Entity<ExInternalTransfersClosingDetail>(entity =>
            {
                entity.HasKey(e => e.TransferClosingDetailId).HasName("PK_EX_InternalTransfers_ClosingDetails");

                entity.ToTable("EX_InternalTransfersClosingDetails", tb =>
                {
                    //tb.HasTrigger("TRG_EX_InternalTransfersClosingDetails_DxDelete");
                    //tb.HasTrigger("TRG_EX_InternalTransfersClosingDetails_DxInsert");
                    //tb.HasTrigger("TRG_EX_InternalTransfersClosingDetails_DxUpdate");
                });

                entity.HasIndex(e => new { e.TransferId, e.CurrencyId }, "UQ_EX_InternalTransfersClosingDetails_Currency").IsUnique();

                entity.Property(e => e.TransferClosingDetailId)
                    .ValueGeneratedNever()
                    .HasColumnName("TransferClosingDetailID");
                entity.Property(e => e.ActualRemainder).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.CurrencyId).HasColumnName("CurrencyID");
                entity.Property(e => e.TransferId).HasColumnName("TransferID");

                entity.HasOne(d => d.Transfer).WithMany(p => p.ExInternalTransfersClosingDetails)
                    .HasForeignKey(d => d.TransferId)
                    .HasConstraintName("FK_EX_InternalTransfersClosingDetails_EX_InternalTransfers");
            });

            builder.Entity<ExInternalTransfersDetail>(entity =>
            {
                entity.HasKey(e => e.TransferDetailId).HasName("PK_EX_InternalTransfers_Details");

                entity.ToTable("EX_InternalTransfersDetails", tb =>
                {
                    //tb.HasTrigger("TRG_EX_InternalTransfersDetails_DxDelete");
                    //tb.HasTrigger("TRG_EX_InternalTransfersDetails_DxInsert");
                    //tb.HasTrigger("TRG_EX_InternalTransfersDetails_DxUpdate");
                });

                entity.Property(e => e.TransferDetailId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("TransferDetailID");
                entity.Property(e => e.CurrencyId).HasColumnName("CurrencyID");
                entity.Property(e => e.TransferAmount).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.TransferId).HasColumnName("TransferID");
                entity.Property(e => e.TransferRemarks).HasMaxLength(200);
                entity.Property(e => e.TransferTime).HasColumnType("datetime");
                entity.Property(e => e.TransferType).HasDefaultValue(1);
                entity.Property(e => e.TransferWithUserId).HasColumnName("TransferWithUserID");

                entity.HasOne(d => d.Currency).WithMany(p => p.ExInternalTransfersDetails)
                    .HasForeignKey(d => d.CurrencyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EX_InternalTransfers_Details_Ex_Currencies");

                entity.HasOne(d => d.Transfer).WithMany(p => p.ExInternalTransfersDetails)
                    .HasForeignKey(d => d.TransferId)
                    .HasConstraintName("FK_EX_InternalTransfers_Details_EX_InternalTransfers");
            });

            builder.Entity<ExInternalTransfersDetailsTemp>(entity =>
            {
                entity.HasKey(e => e.TransferDetailId);

                entity.ToTable("EX_InternalTransfersDetailsTemp", tb =>
                {
                    //tb.HasTrigger("TRG_EX_InternalTransfersDetailsTemp_DxDelete");
                    //tb.HasTrigger("TRG_EX_InternalTransfersDetailsTemp_DxInsert");
                    //tb.HasTrigger("TRG_EX_InternalTransfersDetailsTemp_DxUpdate");
                });

                entity.Property(e => e.TransferDetailId)
                    .ValueGeneratedNever()
                    .HasColumnName("TransferDetailID");
                entity.Property(e => e.CurrencyId).HasColumnName("CurrencyID");
                entity.Property(e => e.ParentTransferDetailId).HasColumnName("ParentTransferDetailID");
                entity.Property(e => e.TransferAmount).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.TransferId).HasColumnName("TransferID");
                entity.Property(e => e.TransferRemarks).HasMaxLength(200);
                entity.Property(e => e.TransferTime).HasColumnType("datetime");
                entity.Property(e => e.TransferType).HasDefaultValue(1);
                entity.Property(e => e.TransferWithUserId).HasColumnName("TransferWithUserID");

                entity.HasOne(d => d.Currency).WithMany(p => p.ExInternalTransfersDetailsTemps)
                    .HasForeignKey(d => d.CurrencyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EX_InternalTransfersDetailsTemp_EX_Currencies");

                entity.HasOne(d => d.Transfer).WithMany(p => p.ExInternalTransfersDetailsTemps)
                    .HasForeignKey(d => d.TransferId)
                    .HasConstraintName("FK_EX_InternalTransfersDetailsTemp_EX_InternalTransfers");
            });

            builder.Entity<ExInvoice>(entity =>
            {
                entity.HasKey(e => e.InvoiceId);

                entity.ToTable("EX_Invoices", tb =>
                {
                    //tb.HasTrigger("TRG_EX_Invoices_DxDelete");
                    //tb.HasTrigger("TRG_EX_Invoices_DxInsert");
                    //tb.HasTrigger("TRG_EX_Invoices_DxUpdate");
                });

                entity.HasIndex(e => new { e.InvoiceTypeId, e.PaymentMethod, e.InternalTransferId, e.InvoiceTime }, "IX_EX_Invoices_01");

                entity.HasIndex(e => new { e.InvoiceTime, e.StatusId }, "IX_EX_Invoices_02");

                entity.HasIndex(e => new { e.InternalTransferId, e.StatusId }, "IX_EX_Invoices_03");

                entity.HasIndex(e => new { e.InvoiceTypeId, e.InternalTransferId, e.StatusId }, "IX_EX_Invoices_04");

                entity.HasIndex(e => new { e.InvoiceTypeId, e.InvoiceTime, e.StatusId }, "IX_EX_Invoices_05");

                entity.HasIndex(e => new { e.InvoiceNo, e.InvoiceDate }, "UQ_EX_Invoices_InvoiceNo").IsUnique();

                entity.Property(e => e.InvoiceId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("InvoiceID");
                entity.Property(e => e.AvTaxAmount).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.AvTaxPercentage).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.BankId).HasColumnName("BankID");
                //entity.Property(e => e.CashierId).HasColumnName("CashierID");
                entity.Property(e => e.ClientId).HasColumnName("ClientID");
                entity.Property(e => e.Commission).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.FormingResponsibleId).HasColumnName("FormingResponsibleID");
                entity.Property(e => e.FormingStatusIds)
                    .IsRequired()
                    .HasMaxLength(10)
                    .HasDefaultValueSql("((1))")
                    .HasColumnName("FormingStatusIDs");
                entity.Property(e => e.InternalTransferId).HasColumnName("InternalTransferID");
                entity.Property(e => e.InvoiceDate).HasColumnType("datetime");
                entity.Property(e => e.InvoiceTime).HasColumnType("datetime");
                entity.Property(e => e.InvoiceTypeId).HasColumnName("InvoiceTypeID");
                entity.Property(e => e.IsPos).HasColumnName("IsPOS");
                entity.Property(e => e.Paid).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.PurposeOfExchange).HasMaxLength(100);
                entity.Property(e => e.Remain).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.Remarks).HasMaxLength(200);
                entity.Property(e => e.StatusId)
                    .HasDefaultValue(1)
                    .HasColumnName("StatusID");

                entity.HasOne(d => d.Bank).WithMany(p => p.ExInvoices)
                    .HasForeignKey(d => d.BankId)
                    .HasConstraintName("FK_EX_Invoices_EX_Banks");

                //entity.HasOne(d => d.Cashier).WithMany(p => p.ExInvoices)
                //    .HasForeignKey(d => d.CashierId)
                //    .OnDelete(DeleteBehavior.ClientSetNull)
                //    .HasConstraintName("FK_EX_Invoices_EX_Cashiers");

                entity.HasOne(d => d.Client).WithMany(p => p.ExInvoices)
                    .HasForeignKey(d => d.ClientId)
                    .HasConstraintName("FK_EX_Invoices_EX_Clients");

                entity.HasOne(d => d.FormingResponsible).WithMany(p => p.ExInvoices)
                    .HasForeignKey(d => d.FormingResponsibleId)
                    .HasConstraintName("FK_EX_Invoices_Sec_Users");

                entity.HasOne(d => d.InternalTransfer).WithMany(p => p.ExInvoices)
                    .HasForeignKey(d => d.InternalTransferId)
                    .HasConstraintName("FK_EX_Invoices_EX_InternalTransfers");

                entity.HasOne(d => d.InvoiceType).WithMany(p => p.ExInvoices)
                    .HasForeignKey(d => d.InvoiceTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EX_Invoices_EX_InvoicesType");

                entity.HasOne(d => d.Status).WithMany(p => p.ExInvoices)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EX_Invoices_EX_InvoiceStatus");
            });

            builder.Entity<ExInvoiceStatus>(entity =>
            {
                entity.HasKey(e => e.StatusId);

                entity.ToTable("EX_InvoiceStatus");

                entity.Property(e => e.StatusId)
                    .ValueGeneratedNever()
                    .HasColumnName("StatusID");
                entity.Property(e => e.StatusNameAr)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.StatusNameEn)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            builder.Entity<ExInvoicesDetail>(entity =>
            {
                entity.HasKey(e => e.InvoiceDetailId);

                entity.ToTable("EX_InvoicesDetails", tb =>
                {
                    //tb.HasTrigger("TRG_EX_InvoicesDetails_DxDelete");
                    //tb.HasTrigger("TRG_EX_InvoicesDetails_DxInsert");
                    //tb.HasTrigger("TRG_EX_InvoicesDetails_DxUpdate");
                });

                entity.HasIndex(e => e.CurrencyId, "IX_EX_InvoicesDetails_00");

                entity.Property(e => e.InvoiceDetailId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("InvoiceDetailID");
                entity.Property(e => e.Amount).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.CurrencyId).HasColumnName("CurrencyID");
                entity.Property(e => e.ExRate).HasColumnType("decimal(18, 14)");
                entity.Property(e => e.InvoiceId).HasColumnName("InvoiceID");

                entity.HasOne(d => d.Currency).WithMany(p => p.ExInvoicesDetails)
                    .HasForeignKey(d => d.CurrencyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EX_InvoicesDetails_EX_Currencies");

                entity.HasOne(d => d.Invoice).WithMany(p => p.ExInvoicesDetails)
                    .HasForeignKey(d => d.InvoiceId)
                    .HasConstraintName("FK_EX_InvoicesDetails_EX_Invoices");
            });

            builder.Entity<ExInvoicesType>(entity =>
            {
                entity.HasKey(e => e.InvoiceTypeId);

                entity.ToTable("EX_InvoicesType");

                entity.Property(e => e.InvoiceTypeId)
                    .ValueGeneratedNever()
                    .HasColumnName("InvoiceTypeID");
                entity.Property(e => e.InvoiceTypeNameAr)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.InvoiceTypeNameEn)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            builder.Entity<ExLocallyWanted>(entity =>
            {
                entity.HasKey(e => e.LocallyWantedId);

                entity.ToTable("EX_LocallyWanted", tb =>
                {
                    //tb.HasTrigger("TRG_EX_LocallyWanted_DxDelete");
                    //tb.HasTrigger("TRG_EX_LocallyWanted_DxInsert");
                    //tb.HasTrigger("TRG_EX_LocallyWanted_DxUpdate");
                });

                entity.HasIndex(e => e.Name, "UQ_EX_LocallyWanted_Name").IsUnique();

                entity.Property(e => e.LocallyWantedId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("LocallyWantedID");
                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);
                entity.Property(e => e.Nid)
                    .HasMaxLength(20)
                    .HasColumnName("NID");
            });

            builder.Entity<ExMonetaryAgency>(entity =>
            {
                entity.HasKey(e => e.MonetaryAgencyReportId);

                entity.ToTable("EX_MonetaryAgency");

                entity.Property(e => e.MonetaryAgencyReportId)
                    .ValueGeneratedNever()
                    .HasColumnName("MonetaryAgencyReportID");
                entity.Property(e => e.MonetaryAgencyReportName)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            builder.Entity<ExPaymentMethod>(entity =>
            {
                entity.HasKey(e => e.PaymentMethod);

                entity.ToTable("EX_PaymentMethod");

                entity.Property(e => e.PaymentMethod).ValueGeneratedNever();
                entity.Property(e => e.PaymentMethodNameAr).HasMaxLength(50);
                entity.Property(e => e.PaymentMethodNameEn).HasMaxLength(50);
            });

            builder.Entity<ExSamaCurrency>(entity =>
            {
                entity
                    .HasNoKey()
                    .ToView("EX_SamaCurrencies");

                entity.Property(e => e.Sign)
                    .IsRequired()
                    .HasMaxLength(3)
                    .IsUnicode(false);
            });

            builder.Entity<ExSetting>(entity =>
            {
                entity.ToTable("EX_Settings", tb =>
                {
                    //tb.HasTrigger("TRG_EX_Settings_DxDelete");
                    //tb.HasTrigger("TRG_EX_Settings_DxInsert");
                    //tb.HasTrigger("TRG_EX_Settings_DxUpdate");
                });

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");
                entity.Property(e => e.AccountIdAvTax).HasColumnName("AccountID_AvTax");
                entity.Property(e => e.AccountIdBanks).HasColumnName("AccountID_Banks");
                entity.Property(e => e.AccountIdCapital).HasColumnName("AccountID_Capital");
                entity.Property(e => e.AccountIdCash).HasColumnName("AccountID_Cash");
                entity.Property(e => e.AccountIdCommission).HasColumnName("AccountID_Commission");
                entity.Property(e => e.AccountIdInvEnd).HasColumnName("AccountID_InvEnd");
                entity.Property(e => e.AccountIdInvStart).HasColumnName("AccountID_InvStart");
                entity.Property(e => e.AccountIdMainBranch).HasColumnName("AccountID_MainBranch");
                entity.Property(e => e.AccountIdProfitLoss).HasColumnName("AccountID_ProfitLoss");
                entity.Property(e => e.AccountIdPurchases).HasColumnName("AccountID_Purchases");
                entity.Property(e => e.AccountIdSales).HasColumnName("AccountID_Sales");
                entity.Property(e => e.AccountIdSuppliers).HasColumnName("AccountID_Suppliers");
                entity.Property(e => e.AccountIdZakatExp).HasColumnName("AccountID_ZakatExp");
                entity.Property(e => e.AccountIdZakatProv).HasColumnName("AccountID_ZakatProv");

                entity.HasOne(d => d.AccountIdBanksNavigation).WithMany(p => p.ExSettingAccountIdBanksNavigations)
                    .HasForeignKey(d => d.AccountIdBanks)
                    .HasConstraintName("FK_EX_Settings_AccountID_Banks");

                entity.HasOne(d => d.AccountIdCapitalNavigation).WithMany(p => p.ExSettingAccountIdCapitalNavigations)
                    .HasForeignKey(d => d.AccountIdCapital)
                    .HasConstraintName("FK_EX_Settings_AccountID_Capital");

                entity.HasOne(d => d.AccountIdCashNavigation).WithMany(p => p.ExSettingAccountIdCashNavigations)
                    .HasForeignKey(d => d.AccountIdCash)
                    .HasConstraintName("FK_EX_Settings_AccountID_Cash");

                entity.HasOne(d => d.AccountIdCommissionNavigation).WithMany(p => p.ExSettingAccountIdCommissionNavigations)
                    .HasForeignKey(d => d.AccountIdCommission)
                    .HasConstraintName("FK_EX_Settings_AccountID_Commission");

                entity.HasOne(d => d.AccountIdInvStartNavigation).WithMany(p => p.ExSettingAccountIdInvStartNavigations)
                    .HasForeignKey(d => d.AccountIdInvStart)
                    .HasConstraintName("FK_EX_Settings_AccountID_Currencies");

                entity.HasOne(d => d.AccountIdMainBranchNavigation).WithMany(p => p.ExSettingAccountIdMainBranchNavigations)
                    .HasForeignKey(d => d.AccountIdMainBranch)
                    .HasConstraintName("FK_EX_Settings_AccountID_MainBranch");

                entity.HasOne(d => d.AccountIdPurchasesNavigation).WithMany(p => p.ExSettingAccountIdPurchasesNavigations)
                    .HasForeignKey(d => d.AccountIdPurchases)
                    .HasConstraintName("FK_EX_Settings_AccountID_Purchases");

                entity.HasOne(d => d.AccountIdSalesNavigation).WithMany(p => p.ExSettingAccountIdSalesNavigations)
                    .HasForeignKey(d => d.AccountIdSales)
                    .HasConstraintName("FK_EX_Settings_AccountID_Sales");

                entity.HasOne(d => d.AccountIdSuppliersNavigation).WithMany(p => p.ExSettingAccountIdSuppliersNavigations)
                    .HasForeignKey(d => d.AccountIdSuppliers)
                    .HasConstraintName("FK_EX_Settings_AccountID_Suppliers");

                entity.HasOne(d => d.AccountIdZakatExpNavigation).WithMany(p => p.ExSettingAccountIdZakatExpNavigations)
                    .HasForeignKey(d => d.AccountIdZakatExp)
                    .HasConstraintName("FK_EX_Settings_AccountID_Zakat");
            });

            builder.Entity<ExStatisticalDataVar>(entity =>
            {
                entity.ToTable("EX_StatisticalDataVars", tb =>
                {
                    //tb.HasTrigger("TRG_EX_StatisticalDataVars_DxDelete");
                    //tb.HasTrigger("TRG_EX_StatisticalDataVars_DxInsert");
                    //tb.HasTrigger("TRG_EX_StatisticalDataVars_DxUpdate");
                });

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");
                entity.Property(e => e.CellRange)
                    .IsRequired()
                    .HasMaxLength(10);
                entity.Property(e => e.CellValue).HasMaxLength(100);
                entity.Property(e => e.VarCaption)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            builder.Entity<ExSupplier>(entity =>
            {
                entity.HasKey(e => e.SupplierId);

                entity.ToTable("EX_Suppliers", tb =>
                {
                    ////tb.HasTrigger("TRG_EX_Suppliers_DxDelete");
                    ////tb.HasTrigger("TRG_EX_Suppliers_DxInsert");
                    ////tb.HasTrigger("TRG_EX_Suppliers_DxUpdate");
                });

                entity.Property(e => e.SupplierId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("SupplierID");
                entity.Property(e => e.AccountId).HasColumnName("AccountID");
                entity.Property(e => e.BankAccount).HasMaxLength(200);
                entity.Property(e => e.BranchId).HasColumnName("BranchID");
                entity.Property(e => e.CountryId).HasColumnName("CountryID");
                entity.Property(e => e.CreditLimit).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.CrexpiredDate)
                    .HasColumnType("datetime")
                    .HasColumnName("CRExpiredDate");
                entity.Property(e => e.Crnumber)
                    .HasMaxLength(10)
                    .HasColumnName("CRNumber");
                entity.Property(e => e.CurrencyExRate).HasColumnType("decimal(18, 8)");
                entity.Property(e => e.CurrencyId).HasColumnName("CurrencyID");
                entity.Property(e => e.Email).HasMaxLength(200);
                entity.Property(e => e.Fax).HasMaxLength(20);
                entity.Property(e => e.LicenseExpiredDate).HasColumnType("datetime");
                entity.Property(e => e.LicenseNo).HasMaxLength(10);
                entity.Property(e => e.Phone).HasMaxLength(20);
                entity.Property(e => e.SupplierNameAr).HasMaxLength(100);
                entity.Property(e => e.SupplierNameEn).HasMaxLength(100);
                entity.Property(e => e.SupplierTypeId).HasColumnName("SupplierTypeID");
                entity.Property(e => e.UnifiedNumber).HasMaxLength(10);

                entity.HasOne(d => d.Account).WithMany(p => p.ExSuppliers)
                    .HasForeignKey(d => d.AccountId)
                    .HasConstraintName("FK_EX_Suppliers_A_Accounts");

                entity.HasOne(d => d.Country).WithMany(p => p.ExSuppliers)
                    .HasForeignKey(d => d.CountryId)
                    .HasConstraintName("FK_EX_Suppliers_Countries");

                //entity.HasOne(d => d.Currency).WithMany(p => p.ExSuppliers)
                //    .HasForeignKey(d => d.CurrencyId)
                //    .OnDelete(DeleteBehavior.ClientSetNull)
                //    .HasConstraintName("FK_EX_Suppliers_EX_Currencies");

                entity.HasOne(d => d.SupplierType).WithMany(p => p.ExSuppliers)
                    .HasForeignKey(d => d.SupplierTypeId)
                    .HasConstraintName("FK_EX_Suppliers_EX_SuppliersType");
            });

            builder.Entity<ExSuppliersAsBranch>(entity =>
            {
                entity
                    .HasNoKey()
                    .ToView("EX_SuppliersAsBranches");

                entity.Property(e => e.AccountId).HasColumnName("AccountID");
                entity.Property(e => e.BankAccount).HasMaxLength(200);
                entity.Property(e => e.BranchId).HasColumnName("BranchID");
                entity.Property(e => e.CountryId).HasColumnName("CountryID");
                entity.Property(e => e.CreditLimit).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.CrexpiredDate)
                    .HasColumnType("datetime")
                    .HasColumnName("CRExpiredDate");
                entity.Property(e => e.Crnumber)
                    .HasMaxLength(10)
                    .HasColumnName("CRNumber");
                entity.Property(e => e.CurrencyExRate).HasColumnType("decimal(10, 8)");
                entity.Property(e => e.CurrencyId).HasColumnName("CurrencyID");
                entity.Property(e => e.Email).HasMaxLength(200);
                entity.Property(e => e.Fax).HasMaxLength(20);
                entity.Property(e => e.LicenseExpiredDate).HasColumnType("datetime");
                entity.Property(e => e.LicenseNo).HasMaxLength(10);
                entity.Property(e => e.Phone).HasMaxLength(20);
                entity.Property(e => e.SupplierId).HasColumnName("SupplierID");
                entity.Property(e => e.SupplierNameAr).HasMaxLength(100);
                entity.Property(e => e.SupplierNameEn).HasMaxLength(100);
                entity.Property(e => e.SupplierTypeId).HasColumnName("SupplierTypeID");
                entity.Property(e => e.UnifiedNumber).HasMaxLength(10);
            });

            builder.Entity<ExSuppliersType>(entity =>
            {
                entity.HasKey(e => e.SupplierTypeId);

                entity.ToTable("EX_SuppliersType");

                entity.Property(e => e.SupplierTypeId)
                    .ValueGeneratedNever()
                    .HasColumnName("SupplierTypeID");
                entity.Property(e => e.MonetaryAgencyReportId).HasColumnName("MonetaryAgencyReportID");
                entity.Property(e => e.SupplierTypeNameAr)
                    .IsRequired()
                    .HasMaxLength(40);
                entity.Property(e => e.SupplierTypeNameEn)
                    .IsRequired()
                    .HasMaxLength(40);
            });

            builder.Entity<ExSuppliersWithoutBranch>(entity =>
            {
                entity
                    .HasNoKey()
                    .ToView("EX_SuppliersWithoutBranches");

                entity.Property(e => e.AccountId).HasColumnName("AccountID");
                entity.Property(e => e.BankAccount).HasMaxLength(200);
                entity.Property(e => e.BranchId).HasColumnName("BranchID");
                entity.Property(e => e.CountryId).HasColumnName("CountryID");
                entity.Property(e => e.CreditLimit).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.CrexpiredDate)
                    .HasColumnType("datetime")
                    .HasColumnName("CRExpiredDate");
                entity.Property(e => e.Crnumber)
                    .HasMaxLength(10)
                    .HasColumnName("CRNumber");
                entity.Property(e => e.CurrencyExRate).HasColumnType("decimal(10, 8)");
                entity.Property(e => e.CurrencyId).HasColumnName("CurrencyID");
                entity.Property(e => e.Email).HasMaxLength(200);
                entity.Property(e => e.Fax).HasMaxLength(20);
                entity.Property(e => e.LicenseExpiredDate).HasColumnType("datetime");
                entity.Property(e => e.LicenseNo).HasMaxLength(10);
                entity.Property(e => e.Phone).HasMaxLength(20);
                entity.Property(e => e.SupplierId).HasColumnName("SupplierID");
                entity.Property(e => e.SupplierNameAr).HasMaxLength(100);
                entity.Property(e => e.SupplierNameEn).HasMaxLength(100);
                entity.Property(e => e.SupplierTypeId).HasColumnName("SupplierTypeID");
                entity.Property(e => e.UnifiedNumber).HasMaxLength(10);
            });

            builder.Entity<ExWholeInvoice>(entity =>
            {
                entity.HasKey(e => e.InvoiceId);

                entity.ToTable("EX_WholeInvoices", tb =>
                {
                    //tb.HasTrigger("TRG_EX_WholeInvoices_DxDelete");
                    //tb.HasTrigger("TRG_EX_WholeInvoices_DxInsert");
                    //tb.HasTrigger("TRG_EX_WholeInvoices_DxUpdate");
                });

                entity.HasIndex(e => new { e.InvoiceDate, e.InvoiceNo }, "UQ_EX_WholeInvoices_InvoiceNo").IsUnique();

                entity.HasIndex(e => new { e.InvoiceTypeId, e.PaymentMethod, e.InvoiceTime, e.StatusId }, "UQ_EX_WholeInvoices_PaidRemain");

                entity.Property(e => e.InvoiceId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("InvoiceID");
                entity.Property(e => e.AvTaxAmount).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.AvTaxPercentage).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.BankId).HasColumnName("BankID");
               // entity.Property(e => e.CashierId).HasColumnName("CashierID");
                entity.Property(e => e.InvoiceDate).HasColumnType("datetime");
                entity.Property(e => e.InvoiceTime).HasColumnType("datetime");
                entity.Property(e => e.InvoiceTypeId).HasColumnName("InvoiceTypeID");
                entity.Property(e => e.Paid).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.Receptionist).HasMaxLength(100);
                entity.Property(e => e.Remain).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.Remarks).HasMaxLength(200);
                entity.Property(e => e.StatusId)
                    .HasDefaultValue(1)
                    .HasColumnName("StatusID");
                entity.Property(e => e.SupplierCurrencyExRate).HasColumnType("decimal(18, 8)");
                entity.Property(e => e.SupplierCurrencyId).HasColumnName("SupplierCurrencyID");
                entity.Property(e => e.SupplierId).HasColumnName("SupplierID");

                entity.HasOne(d => d.Bank).WithMany(p => p.ExWholeInvoices)
                    .HasForeignKey(d => d.BankId)
                    .HasConstraintName("FK_EX_WholeInvoices_EX_Banks");

                //entity.HasOne(d => d.Cashier).WithMany(p => p.ExWholeInvoices)
                //    .HasForeignKey(d => d.CashierId)
                //    .OnDelete(DeleteBehavior.ClientSetNull)
                //    .HasConstraintName("FK_EX_WholeInvoices_EX_Cashiers");

                entity.HasOne(d => d.InvoiceType).WithMany(p => p.ExWholeInvoices)
                    .HasForeignKey(d => d.InvoiceTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EX_WholeInvoices_EX_InvoicesType");

                entity.HasOne(d => d.Status).WithMany(p => p.ExWholeInvoices)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EX_WholeInvoices_EX_WholeInvoiceStatus");

                entity.HasOne(d => d.SupplierCurrency).WithMany(p => p.ExWholeInvoices)
                    .HasForeignKey(d => d.SupplierCurrencyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EX_WholeInvoices_EX_Currencies");

                entity.HasOne(d => d.Supplier).WithMany(p => p.ExWholeInvoices)
                    .HasForeignKey(d => d.SupplierId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EX_WholeInvoices_EX_Suppliers");
            });

            builder.Entity<ExWholeInvoiceStatus>(entity =>
            {
                entity.HasKey(e => e.StatusId);

                entity.ToTable("EX_WholeInvoiceStatus");

                entity.Property(e => e.StatusId)
                    .ValueGeneratedNever()
                    .HasColumnName("StatusID");
                entity.Property(e => e.StatusNameAr)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.StatusNameEn)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            builder.Entity<ExWholeInvoicesDetail>(entity =>
            {
                entity.HasKey(e => e.InvoiceDetailId).HasName("PK_EX_WholeInvoices_Details");

                entity.ToTable("EX_WholeInvoicesDetails", tb =>
                {
                    //tb.HasTrigger("TRG_EX_WholeInvoicesDetails_DxDelete");
                    //tb.HasTrigger("TRG_EX_WholeInvoicesDetails_DxInsert");
                    //tb.HasTrigger("TRG_EX_WholeInvoicesDetails_DxUpdate");
                });

                entity.HasIndex(e => e.CurrencyId, "UQ_EX_WholeInvoices_Amount");

                entity.Property(e => e.InvoiceDetailId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("InvoiceDetailID");
                entity.Property(e => e.Amount).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.CurrencyId).HasColumnName("CurrencyID");
                entity.Property(e => e.InvoiceId).HasColumnName("InvoiceID");
                entity.Property(e => e.SupplierExRate).HasColumnType("decimal(18, 14)");
                entity.Property(e => e.SystemExRate).HasColumnType("decimal(18, 8)");

                entity.HasOne(d => d.Currency).WithMany(p => p.ExWholeInvoicesDetails)
                    .HasForeignKey(d => d.CurrencyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EX_WholeInvoices_Details_EX_Currencies");

                entity.HasOne(d => d.Invoice).WithMany(p => p.ExWholeInvoicesDetails)
                    .HasForeignKey(d => d.InvoiceId)
                    .HasConstraintName("FK_EX_WholeInvoices_Details_EX_WholeInvoices");
            });

            builder.Entity<ExWholePaymentMethod>(entity =>
            {
                entity.HasKey(e => e.PaymentMethod);

                entity.ToTable("EX_WholePaymentMethod");

                entity.Property(e => e.PaymentMethod).ValueGeneratedNever();
                entity.Property(e => e.PaymentMethodNameAr).HasMaxLength(50);
                entity.Property(e => e.PaymentMethodNameEn).HasMaxLength(50);
            });

         

            builder.Entity<IsilList>(entity =>
            {
                entity.ToTable("ISIL_List");

                entity.Property(e => e.Id)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");
                entity.Property(e => e.Address).HasMaxLength(200);
                entity.Property(e => e.AliasName)
                    .IsRequired()
                    .HasMaxLength(200);
                entity.Property(e => e.FullName)
                    .IsRequired()
                    .HasMaxLength(200);
                entity.Property(e => e.Nationality).HasMaxLength(200);
                entity.Property(e => e.Uid).HasColumnName("UID");
            });

            builder.Entity<IsilXmlDatum>(entity =>
            {
                entity.ToTable("ISIL_XmlData");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");
                entity.Property(e => e.IsilLastUpdate).HasColumnType("datetime");
                entity.Property(e => e.LastUpdate).HasColumnType("datetime");
                entity.Property(e => e.XmlData).HasColumnType("xml");
            });

           

 //           builder.Entity<Notification>(entity =>
 //           {
 //               entity.HasKey(n => n.Id);

 //               entity.HasOne(n => n.User)
 //               .WithMany()
 //               .HasForeignKey(n => n.UserId);



 //               entity.Property(e => e.CreateUser).HasMaxLength(450);
 //               entity.Property(e => e.CreateUserName).HasMaxLength(256);
 //               entity.Property(e => e.DataDesc).IsRequired();
 //               entity.Property(e => e.DataId).IsRequired();
 //               entity.Property(e => e.Message)
 //                   .IsRequired()
 //                   .HasMaxLength(250);
 //               entity.Property(e => e.UpdateUser).HasMaxLength(450);
 //               entity.Property(e => e.UpdateUserName).HasMaxLength(256);
 //               entity.Property(e => e.UserId).IsRequired();
 //           })
 //;

            //builder.Entity<Permission>(entity =>
            //{
            //    entity.Property(e => e.Desc)
            //        .IsRequired()
            //        .HasMaxLength(250);
            //    entity.Property(e => e.Name)
            //        .IsRequired()
            //        .HasMaxLength(250);
            //});

           

            builder.Entity<Privilage2>(entity =>
            {
                entity
                    .HasNoKey()
                    .ToTable("Privilage2");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();
            });

           

            //builder.Entity<Role>(entity =>
            //{
            //    entity.HasIndex(e => e.NormalizedName, "RoleNameIndex")
            //        .IsUnique()
            //        .HasFilter("([NormalizedName] IS NOT NULL)");

            //    entity.Property(e => e.Name).HasMaxLength(256);
            //    entity.Property(e => e.NormalizedName).HasMaxLength(256);
            //});

            //builder.Entity<RolePermission>(entity =>
            //{
            //    entity.HasIndex(e => e.PermissionId, "IX_RolePermissions_PermissionId");

            //    entity.HasIndex(e => e.RoleId, "IX_RolePermissions_RoleId");

            //    entity.HasOne(d => d.Permission).WithMany(p => p.RolePermissions)
            //        .HasForeignKey(d => d.PermissionId)
            //        .OnDelete(DeleteBehavior.ClientSetNull);

            //    entity.HasOne(d => d.Role).WithMany(p => p.RolePermissions)
            //        .HasForeignKey(d => d.RoleId)
            //        .OnDelete(DeleteBehavior.Cascade);
            //});

         
            builder.Entity<SecForm>(entity =>
            {
                entity.HasKey(e => e.FormId);

                entity.ToTable("Sec_Forms");

                entity.HasIndex(e => new { e.ParentId, e.FormOrder }, "IX_Sec_Forms");

                entity.Property(e => e.FormId)
                    .ValueGeneratedNever()
                    .HasColumnName("FormID");
                entity.Property(e => e.DisplayNameAr).HasMaxLength(200);
                entity.Property(e => e.DisplayNameEn).HasMaxLength(200);
                entity.Property(e => e.FormName).HasMaxLength(200);
                entity.Property(e => e.ParentId).HasColumnName("ParentID");
                entity.Property(e => e.TablesForLog).HasMaxLength(200);
            });

            builder.Entity<SecFormsFunction>(entity =>
            {
                entity.HasKey(e => e.FormFunctionId);

                entity.ToTable("Sec_FormsFunctions");

                entity.HasIndex(e => new { e.FormId, e.FunctionId }, "UQ_Sec_FormsFunctions").IsUnique();

                entity.Property(e => e.FormFunctionId)
                    .ValueGeneratedNever()
                    .HasColumnName("FormFunctionID");
                entity.Property(e => e.FormId).HasColumnName("FormID");
                entity.Property(e => e.FunctionId).HasColumnName("FunctionID");

                entity.HasOne(d => d.Form).WithMany(p => p.SecFormsFunctions)
                    .HasForeignKey(d => d.FormId)
                    .HasConstraintName("FK_Sec_FormsFunctions_Sec_Forms");

                entity.HasOne(d => d.Function).WithMany(p => p.SecFormsFunctions)
                    .HasForeignKey(d => d.FunctionId)
                    .HasConstraintName("FK_Sec_FormsFunctions_Sec_Functions");
            });

            builder.Entity<SecFunction>(entity =>
            {
                entity.HasKey(e => e.FunctionId);

                entity.ToTable("Sec_Functions");

                entity.HasIndex(e => e.FunctionName, "UQ_Sec_Functions");

                entity.Property(e => e.FunctionId)
                    .ValueGeneratedNever()
                    .HasColumnName("FunctionID");
                entity.Property(e => e.FunctionName)
                    .IsRequired()
                    .HasMaxLength(100);
                entity.Property(e => e.FunctionNameAr)
                    .IsRequired()
                    .HasMaxLength(100);
                entity.Property(e => e.FunctionNameEn)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            builder.Entity<SecTransactionLog>(entity =>
            {
                entity.HasKey(e => e.LogId);

                entity.ToTable("Sec_TransactionLog");

                entity.Property(e => e.LogId)
                    .ValueGeneratedNever()
                    .HasColumnName("LogID");
                entity.Property(e => e.ActionDate).HasColumnType("datetime");
                entity.Property(e => e.ActionDetails).IsRequired();
                entity.Property(e => e.FormId).HasColumnName("FormID");
                entity.Property(e => e.FunctionId).HasColumnName("FunctionID");
                entity.Property(e => e.ItemId).HasColumnName("ItemID");
                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Form).WithMany(p => p.SecTransactionLogs)
                    .HasForeignKey(d => d.FormId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Sec_TransactionLog_Sec_Forms");

                entity.HasOne(d => d.Function).WithMany(p => p.SecTransactionLogs)
                    .HasForeignKey(d => d.FunctionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Sec_TransactionLog_Sec_Functions");

                entity.HasOne(d => d.User).WithMany(p => p.SecTransactionLogs)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Sec_TransactionLog_Sec_Users");
            });

            builder.Entity<SecUser>(entity =>
            {
                //entity.Property(u => u.UserId).ValueGeneratedOnAdd();
                entity.HasKey(e => e.UserId);

                entity.ToTable("Sec_Users", tb =>
                {
                    //tb.HasTrigger("TRG_Sec_Users_Delete");
                    //tb.HasTrigger("TRG_Sec_Users_DxDelete");
                    //tb.HasTrigger("TRG_Sec_Users_DxInsert");
                    //tb.HasTrigger("TRG_Sec_Users_DxUpdate");
                    //tb.HasTrigger("TRG_Sec_Users_Insert");
                    //tb.HasTrigger("TRG_Sec_Users_Update");
                });

                entity.HasIndex(e => e.UserCode, "UQ_SecurityUsers_Code");

                entity.HasIndex(e => e.LoginName, "UQ_SecurityUsers_LoginName").IsUnique();

                entity.Property(e => e.UserId)
                    .ValueGeneratedNever()
                    .HasColumnName("UserID");
                entity.Property(e => e.BranchId).HasColumnName("BranchID");
                entity.Property(e => e.CreatedDate).HasColumnType("datetime");
                entity.Property(e => e.LocalIpaddress)
                    .HasMaxLength(50)
                    .HasColumnName("LocalIPAddress");
                entity.Property(e => e.LoginName)
                    .IsRequired()
                    .HasMaxLength(200);
                entity.Property(e => e.OnlineStatus).HasMaxLength(50);
                entity.Property(e => e.Password).HasMaxLength(200);
                entity.Property(e => e.ThemeName).HasMaxLength(100);
                entity.Property(e => e.UserCode)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.UserNameAr).HasMaxLength(200);
                entity.Property(e => e.UserNameEn).HasMaxLength(200);

                entity.HasOne(d => d.Branch).WithMany(p => p.SecUsers)
                    .HasForeignKey(d => d.BranchId)
                    .HasConstraintName("FK_Sec_Users_Branches");

                entity.HasOne(d => d.PermissionType).WithMany(p => p.SecUsers)
            .HasForeignKey(d => d.PermissionTypeId)
            .HasConstraintName("FK_Sec_Users_PermissionTypes");
            });

            builder.Entity<SecUsersForm>(entity =>
            {
               
                entity.ToTable("Sec_UsersForms", tb =>
                {
                    //tb.HasTrigger("TRG_Sec_UsersForms_DxDelete");
                    //tb.HasTrigger("TRG_Sec_UsersForms_DxInsert");
                    //tb.HasTrigger("TRG_Sec_UsersForms_DxUpdate");
                });

                entity.HasIndex(e => new { e.PermissionTypeId, e.FormId }, "UQ_Sec_UsersForms").IsUnique();

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");
                entity.Property(e => e.FormId).HasColumnName("FormID");
                entity.Property(e => e.PermissionTypeId).HasColumnName("PermissionTypeId");

                entity.HasOne(d => d.Form).WithMany(p => p.SecUsersForms)
                    .HasForeignKey(d => d.FormId)
                    .HasConstraintName("FK_Sec_UsersForms_Sec_Forms");

                entity.HasOne(d => d.PermissionType).WithMany(p => p.SecUsersForms)
                    .HasForeignKey(d => d.PermissionTypeId)
                    .HasConstraintName("FK_Sec_UsersForms_Sec_Users");
            });

            builder.Entity<SecUsersFunction>(entity =>
            {
                entity.ToTable("Sec_UsersFunctions", tb =>
                {
                    //tb.HasTrigger("TRG_Sec_UsersFunctions_DxDelete");
                    //tb.HasTrigger("TRG_Sec_UsersFunctions_DxInsert");
                    //tb.HasTrigger("TRG_Sec_UsersFunctions_DxUpdate");
                });

                entity.HasIndex(e => new { e.PermissionTypeId, e.FormFunctionId }, "UQ_Sec_UsersFunctions").IsUnique();

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");
                entity.Property(e => e.FormFunctionId).HasColumnName("FormFunctionID");
                entity.Property(e => e.PermissionTypeId).HasColumnName("PermissionTypeId");

                entity.HasOne(d => d.FormFunction).WithMany(p => p.SecUsersFunctions)
                    .HasForeignKey(d => d.FormFunctionId)
                    .HasConstraintName("FK_Sec_UsersFunctions_Sec_FormsFunctions");

                entity.HasOne(d => d.PermissionType).WithMany(p => p.SecUsersFunctions)
                    .HasForeignKey(d => d.PermissionTypeId)
                    .HasConstraintName("FK_Sec_UsersFunctions_Sec_Users");
            });

            builder.Entity<SysAssembly>(entity =>
            {
                entity.HasKey(e => e.AssemblyId);

                entity.ToTable("Sys_Assemblies");

                entity.Property(e => e.AssemblyId)
                    .ValueGeneratedNever()
                    .HasColumnName("AssemblyID");
                entity.Property(e => e.AssemblyFile).HasColumnType("image");
                entity.Property(e => e.AssemblyModifiedDate).HasColumnType("datetime");
                entity.Property(e => e.AssemblyName)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            builder.Entity<SysBackup>(entity =>
            {
                entity.HasKey(e => e.BackupId);

                entity.ToTable("Sys_Backups");

                entity.Property(e => e.BackupId)
                    .ValueGeneratedNever()
                    .HasColumnName("BackupID");
                entity.Property(e => e.BackupAssemblyDate).HasColumnType("datetime");
                entity.Property(e => e.BackupDateTime).HasColumnType("datetime");
                entity.Property(e => e.BackupFilePath)
                    .IsRequired()
                    .HasMaxLength(500);
                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.User).WithMany(p => p.SysBackups)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Sys_Backups_Sec_Users");
            });

            builder.Entity<SysBranch>(entity =>
            {
                entity.HasKey(e => e.BranchId);

            entity.ToTable("Sys_Branches");//, tb =>); //tb.HasTrigger("TRG_Sys_Branches")
                                                    // );

                entity.Property(e => e.BranchId)
                    .ValueGeneratedNever()
                    .HasColumnName("BranchID");
                entity.Property(e => e.AccountId).HasColumnName("AccountID");
                entity.Property(e => e.BranchName)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.BranchNameAr)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.BranchNameEn)
                    .IsRequired()
                    .HasMaxLength(50);
                entity.Property(e => e.DbsynchDownloaded).HasColumnName("DBSynchDownloaded");
                entity.Property(e => e.DbsynchFinished).HasColumnName("DBSynchFinished");
                entity.Property(e => e.DbsynchLastUpdatedDate)
                    .HasColumnType("datetime")
                    .HasColumnName("DBSynchLastUpdatedDate");
                entity.Property(e => e.DbsynchRemarks)
                    .HasMaxLength(1000)
                    .HasColumnName("DBSynchRemarks");
                entity.Property(e => e.DbsynchRequested).HasColumnName("DBSynchRequested");
                entity.Property(e => e.DbsynchRestored).HasColumnName("DBSynchRestored");
                entity.Property(e => e.DbsynchStarted).HasColumnName("DBSynchStarted");
                entity.Property(e => e.DbsynchStopped).HasColumnName("DBSynchStopped");
                entity.Property(e => e.LastSyncTime).HasColumnType("datetime");

                entity.HasOne(d => d.Account).WithMany(p => p.SysBranches)
                    .HasForeignKey(d => d.AccountId)
                    .HasConstraintName("FK_Sys_Branches_A_Accounts");
            });

            builder.Entity<SysBranchesAuto>(entity =>
            {
                entity.ToTable("Sys_BranchesAuto");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");
                entity.Property(e => e.Remarks).HasMaxLength(50);
                entity.Property(e => e.ScheduleTime).HasColumnType("datetime");
            });

            builder.Entity<SysMobileIntegration>(entity =>
            {
                entity.ToTable("Sys_MobileIntegration");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");
                entity.Property(e => e.ApiUrl).HasMaxLength(100);
                entity.Property(e => e.ClientIdc)
                    .HasMaxLength(100)
                    .HasColumnName("ClientIDC");
            });

            builder.Entity<SysReplicationSetting>(entity =>
            {
                entity.ToTable("Sys_ReplicationSettings");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");
                entity.Property(e => e.AccessKeyId).HasMaxLength(200);
                entity.Property(e => e.BranchName).HasMaxLength(50);
                entity.Property(e => e.QueueUrl).HasMaxLength(200);
                entity.Property(e => e.SecretAccessKey).HasMaxLength(200);
                entity.Property(e => e.ServiceUrl).HasMaxLength(200);
            });

            builder.Entity<SysSetting>(entity =>
            {
                entity.ToTable("Sys_Settings", tb =>
                {
                    //tb.HasTrigger("TRG_Sys_Settings_DxDelete");
                    //tb.HasTrigger("TRG_Sys_Settings_DxInsert");
                    //tb.HasTrigger("TRG_Sys_Settings_DxUpdate");
                });

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");
                entity.Property(e => e.AvTaxPercentage).HasColumnType("decimal(18, 2)");
                entity.Property(e => e.IdleTimeBeforeLogout).HasDefaultValue(600);
                entity.Property(e => e.InvoiceBgcForPurchase).HasMaxLength(20);
                entity.Property(e => e.InvoiceBgcForSale).HasMaxLength(20);
                entity.Property(e => e.JvnoScope).HasColumnName("JVNoScope");
                entity.Property(e => e.JvnoScopeByType).HasColumnName("JVNoScopeByType");
                entity.Property(e => e.MainServerConString).HasMaxLength(255);
                entity.Property(e => e.MsDisplayName)
                    .HasMaxLength(255)
                    .HasColumnName("MS_DisplayName");
                entity.Property(e => e.MsNotifySuppliers).HasColumnName("MS_NotifySuppliers");
                entity.Property(e => e.MsNotifySuppliersCc)
                    .HasMaxLength(255)
                    .HasColumnName("MS_NotifySuppliersCC");
                entity.Property(e => e.MsNotifySuppliersInterval).HasColumnName("MS_NotifySuppliersInterval");
                entity.Property(e => e.MsNotifySuppliersMailFooter)
                    .HasMaxLength(300)
                    .HasColumnName("MS_NotifySuppliersMailFooter");
                entity.Property(e => e.MsPassword)
                    .HasMaxLength(255)
                    .HasColumnName("MS_Password");
                entity.Property(e => e.MsSmtpPort).HasColumnName("MS_SmtpPort");
                entity.Property(e => e.MsSmtpServer)
                    .HasMaxLength(255)
                    .HasColumnName("MS_SmtpServer");
                entity.Property(e => e.MsSsl).HasColumnName("MS_SSL");
                entity.Property(e => e.MsUsername)
                    .HasMaxLength(255)
                    .HasColumnName("MS_Username");
                entity.Property(e => e.PriceScreenBackColor)
                    .HasMaxLength(20)
                    .HasColumnName("PriceScreen_BackColor");
                entity.Property(e => e.PriceScreenForeColor)
                    .HasMaxLength(20)
                    .HasColumnName("PriceScreen_ForeColor");
                entity.Property(e => e.PriceScreenNotes)
                    .HasMaxLength(200)
                    .HasColumnName("PriceScreen_Notes");
                entity.Property(e => e.ReportHeaderLeft).HasMaxLength(400);
                entity.Property(e => e.ReportHeaderRight).HasMaxLength(400);
                entity.Property(e => e.SamaSignature1)
                    .HasMaxLength(50)
                    .HasColumnName("SAMA_Signature1");
                entity.Property(e => e.SamaSignature2)
                    .HasMaxLength(50)
                    .HasColumnName("SAMA_Signature2");
                entity.Property(e => e.SamaSignature3)
                    .HasMaxLength(50)
                    .HasColumnName("SAMA_Signature3");
                entity.Property(e => e.SamalimitEnabled).HasColumnName("SAMALimit_Enabled");
                entity.Property(e => e.SamalimitForNonSaudi)
                    .HasColumnType("decimal(18, 0)")
                    .HasColumnName("SAMALimit_ForNonSaudi");
                entity.Property(e => e.SamalimitForSaudi)
                    .HasColumnType("decimal(18, 0)")
                    .HasColumnName("SAMALimit_ForSaudi");
            });

            builder.Entity<SysSystemInfo>(entity =>
            {
                entity.ToTable("Sys_SystemInfo", tb =>
                {
                    //tb.HasTrigger("TRG_Sys_SystemInfo_DxDelete");
                    //tb.HasTrigger("TRG_Sys_SystemInfo_DxInsert");
                    //tb.HasTrigger("TRG_Sys_SystemInfo_DxUpdate");
                });

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");
                entity.Property(e => e.BranchName).HasMaxLength(50);
                entity.Property(e => e.ClientIdentifier).HasMaxLength(100);
                entity.Property(e => e.CompanyNameAr).HasMaxLength(2000);
                entity.Property(e => e.CompanyNameEn).HasMaxLength(2000);
                entity.Property(e => e.Crno)
                    .HasMaxLength(12)
                    .HasColumnName("CRNo");
                entity.Property(e => e.ExInvoiceCompanyNameAr)
                    .HasMaxLength(200)
                    .HasColumnName("EX_InvoiceCompanyNameAr");
                entity.Property(e => e.ExInvoiceCompanyNameEn)
                    .HasMaxLength(200)
                    .HasColumnName("EX_InvoiceCompanyNameEn");
                entity.Property(e => e.ExInvoiceFooter)
                    .HasMaxLength(1000)
                    .HasColumnName("EX_InvoiceFooter");
                entity.Property(e => e.ExInvoiceHeader)
                    .HasMaxLength(400)
                    .HasColumnName("EX_InvoiceHeader");
                entity.Property(e => e.ExInvoiceLogo).HasColumnName("EX_InvoiceLogo");
                entity.Property(e => e.ExPortName)
                    .HasMaxLength(50)
                    .HasColumnName("EX_PortName");
                entity.Property(e => e.ExSystemCurrencyId)
                    .HasDefaultValue(1)
                    .HasColumnName("EX_SystemCurrencyID");
                entity.Property(e => e.ExWholesaleInvoiceHeaderAr)
                    .HasMaxLength(400)
                    .HasColumnName("EX_WholesaleInvoiceHeaderAr");
                entity.Property(e => e.ExWholesaleInvoiceHeaderEn)
                    .HasMaxLength(400)
                    .HasColumnName("EX_WholesaleInvoiceHeaderEn");
                entity.Property(e => e.InternalDataLastModifiedDate)
                    .HasColumnType("datetime")
                    .HasColumnName("InternalData_LastModifiedDate");
                entity.Property(e => e.LicenseNo).HasMaxLength(12);
            });

            builder.Entity<SysSystemOption>(entity =>
            {
                entity.ToTable("Sys_SystemOptions", tb =>
                {
                    //tb.HasTrigger("TRG_Sys_SystemOptions_DxDelete");
                    //tb.HasTrigger("TRG_Sys_SystemOptions_DxInsert");
                    //tb.HasTrigger("TRG_Sys_SystemOptions_DxUpdate");
                });

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");
                entity.Property(e => e.Isil).HasColumnName("ISIL");
            });

            builder.Entity<SysWebsiteIntegration>(entity =>
            {
                entity.ToTable("Sys_WebsiteIntegration");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");
                entity.Property(e => e.WebsiteUrl).HasMaxLength(100);
            });

            builder.Entity<TechSupTicket>(entity =>
            {
                entity.ToTable("TechSup_Tickets");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");
                entity.Property(e => e.CreationDate).HasColumnType("datetime");
                entity.Property(e => e.Summary).IsRequired();
                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(100);
            });



            //builder.Entity<User>(entity =>
            //{
            //    entity.HasIndex(e => e.NormalizedEmail, "EmailIndex");

            //    entity.HasIndex(e => e.NormalizedUserName, "UserNameIndex")
            //        .IsUnique()
            //        .HasFilter("([NormalizedUserName] IS NOT NULL)");

            //    entity.Property(e => e.Email).HasMaxLength(256);
            //    entity.Property(e => e.NormalizedEmail).HasMaxLength(256);
            //    entity.Property(e => e.NormalizedUserName).HasMaxLength(256);
            //    entity.Property(e => e.Type).HasColumnName("type");
            //    entity.Property(e => e.UserName).HasMaxLength(256);

            //    entity.HasMany(d => d.Roles).WithMany(p => p.Users)
            //        .UsingEntity<Dictionary<string, object>>(
            //            "UserRole",
            //            r => r.HasOne<Role>().WithMany()
            //                .HasForeignKey("RoleId")
            //                .OnDelete(DeleteBehavior.ClientSetNull),
            //            l => l.HasOne<User>().WithMany().HasForeignKey("UserId"),
            //            j =>
            //            {
            //                j.HasKey("UserId", "RoleId");
            //                j.ToTable("UserRoles");
            //                j.HasIndex(new[] { "RoleId" }, "IX_UserRoles_RoleId");
            //            });
            //});

            //OnModelCreatingPartial(modelBuilder);

        }
       

        private void SetProductMapping(ModelBuilder builder)
        {
            //builder.Entity<ProductAddition>()
            //.HasOne(bc => bc.Product)
            //.WithMany(c => c.ProductAdditions)
            //.HasForeignKey(bc => bc.ProductId);


         
        }

        private void SetAttachmentMapping(ModelBuilder builder)
        {
          
        }

        //protected override void ApplyGlobalFilters(ModelBuilder builder)
        //{
        //    //base.ApplyGlobalFilters(builder);
        //    //builder.SetQueryFilterByInterfce<ISoftDelete>(p => !p.IsDeleted);
        //}

        //protected override void EntityAdding(object entity)
        //{
     
        //}

        private void ApplyConfigurations(ModelBuilder builder)
        {
            //builder.ApplyConfiguration(userConfiguration);
            //builder.ApplyConfiguration(roleConfiguration);
            //builder.ApplyConfiguration(userRolesConfiguration);
        }

        public async Task fill_Privilage()
        {
            try
            {
                using (var connection = Database.GetDbConnection())
                {
                    // Open the connection if it's closed
                    if (connection.State != System.Data.ConnectionState.Open)
                        await connection.OpenAsync();
                    using (var command = connection.CreateCommand())
                    {
                        Thread.SpinWait(2000);
                        command.CommandText = "EXEC fill_Privilage ";

                        // Execute the query and return the result
                        await command.ExecuteNonQueryAsync();
                    }

                    //await Database.ExecuteSqlRawAsync("EXEC fill_Privilage ");

                }
            }
            catch (Exception ex)
            {
               await  Database.RollbackTransactionAsync();
                using (var connection = Database.GetDbConnection())
                {
                    // Open the connection if it's closed
                    if (connection.State != System.Data.ConnectionState.Open)
                        await connection.OpenAsync();
                    using (var command = connection.CreateCommand())
                    {
                        Thread.SpinWait(2000);
                        command.CommandText = "EXEC fill_Privilage ";

                        // Execute the query and return the result
                        await command.ExecuteNonQueryAsync();
                    }

                    //await Database.ExecuteSqlRawAsync("EXEC fill_Privilage ");

                }
            }

          //  await Database.ExecuteSqlRawAsync("EXEC fill_Privilage ");
        }

    }
}

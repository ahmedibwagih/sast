use iExchange_Alnatheer
go
--users
IF not EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Sec_TransactionLog_new')
   select * into Sec_TransactionLog_new from Sec_TransactionLog


IF not EXISTS (SELECT * from  EX_Branches where BranchID =4)
insert into EX_Branches(BranchID,BranchCode,BranchNameAr,BranchNameEn,AccountID,ManagerId)
values (4,4,'المروج','المروج',null,2244)

-------------------------------------------

delete from Setting
delete from SecPermissionTypeBranches
delete from Sec_FormsFunctions
delete from Sec_UsersForms
delete from Sec_UsersFunctions
delete from Privilage2
delete from Sec_TransactionLog
delete from Sec_Functions
delete from Sec_Users where userid > 100
delete from SecPermissionType
delete from Sys_Backups
--
delete from Sec_Forms
go
ALTER TABLE Sec_UsersForms
ADD PermissionTypeId int NOT NULL ;
go
ALTER TABLE [dbo].[Sec_UsersForms] DROP CONSTRAINT [UQ_Sec_UsersForms]
GO
go
ALTER TABLE Sec_UsersForms
DROP COLUMN UserID;
go
ALTER TABLE Sec_UsersForms
ADD SecUserUserId int  NULL ;
go

-------
go
ALTER TABLE [dbo].Sec_UsersFunctions DROP CONSTRAINT UQ_Sec_UsersFunctions
GO
ALTER TABLE Sec_UsersFunctions
ADD PermissionTypeId int NOT NULL ;
go

ALTER TABLE Sec_UsersFunctions
DROP COLUMN UserID;
go
ALTER TABLE Sec_UsersFunctions
ADD SecUserUserId int  NULL ;
go
ALTER TABLE Sec_UsersFunctions
ADD FunValue nvarchar(max)  NULL ;



-----------------------------------------------

IF not EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'sec_users_tmp')
select * into [sec_users_tmp] from Sec_Users where 1= 0
delete from [sec_users_tmp]
--insert into Sec_Users select * from 
--insert into Sec_Forms
--insert into Sec_Functions
--insert into SecPermissionType
--insert into Privilage2
--insert into Sec_FormsFunctions
--insert into Sec_UsersForms
--insert into Sec_UsersFunctions
--insert into SecPermissionTypeBranches
--insert into Setting

GO
INSERT [dbo].[SecPermissionType] ([PermissionTypeId], [PermissionTypeNameEn], [PermissionTypeNameAr]) VALUES (1, N'صلاحيه1', N'مدير')
GO
INSERT [dbo].[SecPermissionType] ([PermissionTypeId], [PermissionTypeNameEn], [PermissionTypeNameAr]) VALUES (2, N'صلاحيه2', N'صلاحيه2')
GO
INSERT [dbo].[SecPermissionType] ([PermissionTypeId], [PermissionTypeNameEn], [PermissionTypeNameAr]) VALUES (3, N'امين خرينه المروج', N'امين خرينه المروج')
GO
INSERT [dbo].[SecPermissionType] ([PermissionTypeId], [PermissionTypeNameEn], [PermissionTypeNameAr]) VALUES (4, N'امين خرينه النسيم', N'امين خرينه النسيم')
GO
INSERT [dbo].[SecPermissionType] ([PermissionTypeId], [PermissionTypeNameEn], [PermissionTypeNameAr]) VALUES (5, N'امين خرينه الجبيل', N'امين خرينه الجبيل')
GO
INSERT [dbo].[SecPermissionType] ([PermissionTypeId], [PermissionTypeNameEn], [PermissionTypeNameAr]) VALUES (6, N'امين خرينه الخبر', N'امين خرينه الخبر')
GO
INSERT [dbo].[SecPermissionType] ([PermissionTypeId], [PermissionTypeNameEn], [PermissionTypeNameAr]) VALUES (7, N'صراف المروج', N'صراف المروج')
GO
INSERT [dbo].[SecPermissionType] ([PermissionTypeId], [PermissionTypeNameEn], [PermissionTypeNameAr]) VALUES (8, N'صراف النسيم', N'صراف النسيم')
GO
INSERT [dbo].[SecPermissionType] ([PermissionTypeId], [PermissionTypeNameEn], [PermissionTypeNameAr]) VALUES (9, N'صراف الجبيل', N'صراف الجبيل')
GO
INSERT [dbo].[SecPermissionType] ([PermissionTypeId], [PermissionTypeNameEn], [PermissionTypeNameAr]) VALUES (10, N'صراف الخبر', N'صراف الخبر')
GO



INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2244, N'TI45FeML07ARumVzpe7Qdw==', N'nSbkdwMn0ZC7r3q20gslAw==', N'0LzmB9ahnzA/kTwkrTk7rQ==', N'nSbkdwMn0ZC7r3q20gslAw==', N'nSbkdwMn0ZC7r3q20gslAw==', 1, CAST(N'2024-08-17T04:54:07.853' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 1, CAST(N'2025-04-29T17:16:52.9210360' AS DateTime2), N'\ClientsMembershipAttachement\72bf5aa5-401b-4445-81ae-f75101fd0312.jpg')
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2245, N'QJv99TwKx+hJDW5ZpcD21A==', N'D3YsNDVW3Y+h0w+jCZvJGWOIpa52Pg8X9Ynz31HoLLk=', N'Wtyc1/YLH6cyKSkqiFH1kr1SVetoY/iSk/mNQfAYLng=', N'jP/ItavGnL653EOxbs3jSQ==', N'SQc877bXW2L9l2OjxtNLMQ==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2246, N'JksihEPTQzrlkfYEJKTruw==', N'UE1YvzeCKLqfPv89ZQbI7/FxAmA6FxBb3tTJ9/ho02w=', N'QsZMHUW6vFKGnuIvS5RGJK8ns1tKbyjs6Hh1Ef2IZAc=', N'pXLUwX9f5TMwy/AktvC19w==', N'uQvYL6IgkK0h6FvdwFv2jQ==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2247, N'/aukiMqCkfnqDOU1NcxDbA==', N'RS6N3fsRGRvCvCwwG87R7a9jXM2FBg98I//Tx2qhPlQ=', N'DGA6GGgJ8SJ6roxiS2ZT/fRwLnnQUdULvQtHVePL9XE=', N'uVWr+Fhf5Kne4tfNhIvXuw==', N'h8kr01LBs28aBP9wzs2oqA==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2248, N'p0tjx+dtdzd7oSWGsZU/cA==', N'zpF2trcsB6UiTfS2BavE4Q==', N'1QrocAuO5COH1/6pXQkR1Q==', N't5WlwGAzuYtEEKbv3DJsHg==', N'YDxI70V7Z4TnI6Ll70QzXw==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, CAST(N'2024-12-14T23:21:57.3172548' AS DateTime2), NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2249, N'p0tjx+dtdzd7oSWGsZU/cA==', N'KyHS4h7Gv3029BeX8YnIzg==', N'6Gbj4M2vEllRuEf7EGvvzA==', N'KyHS4h7Gv3029BeX8YnIzg==', N'569u9yrm83ZzQr6wzEyTxg==', 1, NULL, NULL, 0, 1, 3, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2250, N'WEbls6TkiohfcfGWaZqYpg==', N'wDOo18ukdaiv7Q/ZcsIdbg==', N'wDOo18ukdaiv7Q/ZcsIdbg==', N'wDOo18ukdaiv7Q/ZcsIdbg==', N'WEbls6TkiohfcfGWaZqYpg==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2251, N'Tszys71sztfksMb+0giSWw==', N'Tszys71sztfksMb+0giSWw==', N'Tszys71sztfksMb+0giSWw==', N'Tszys71sztfksMb+0giSWw==', N'Tszys71sztfksMb+0giSWw==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2252, N'kRnx/yLWCfX4Q/SEL+cdKw==', N'kRnx/yLWCfX4Q/SEL+cdKw==', N'kRnx/yLWCfX4Q/SEL+cdKw==', N'kRnx/yLWCfX4Q/SEL+cdKw==', N'kRnx/yLWCfX4Q/SEL+cdKw==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2253, N'PEUF1tyalWbc5gAP+w6heA==', N'PEUF1tyalWbc5gAP+w6heA==', N'PEUF1tyalWbc5gAP+w6heA==', N'PEUF1tyalWbc5gAP+w6heA==', N'PEUF1tyalWbc5gAP+w6heA==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2254, N'569u9yrm83ZzQr6wzEyTxg==', N'PEUF1tyalWbc5gAP+w6heA==', N'n7iWbEdmHnJnxhS37iv7GQ==', N'n7iWbEdmHnJnxhS37iv7GQ==', N'fr+zVPhiXynH/9QGj8J2DQ==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2255, N'H8nF168h6gTyrPcH4O1tgg==', N'H8nF168h6gTyrPcH4O1tgg==', N'H8nF168h6gTyrPcH4O1tgg==', N'H8nF168h6gTyrPcH4O1tgg==', N'H8nF168h6gTyrPcH4O1tgg==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2256, N'8Ci3fiev+rr5/Ky4KyXSlg==', N'8Ci3fiev+rr5/Ky4KyXSlg==', N'8Ci3fiev+rr5/Ky4KyXSlg==', N'8Ci3fiev+rr5/Ky4KyXSlg==', N'8Ci3fiev+rr5/Ky4KyXSlg==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2257, N'ylwUKqXbjDCaSKSWtQB8/w==', N'ylwUKqXbjDCaSKSWtQB8/w==', N'ylwUKqXbjDCaSKSWtQB8/w==', N'ylwUKqXbjDCaSKSWtQB8/w==', N'ylwUKqXbjDCaSKSWtQB8/w==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2258, N'xaAdZsxMcneX8puOHBKl0Q==', N'xaAdZsxMcneX8puOHBKl0Q==', N'xaAdZsxMcneX8puOHBKl0Q==', N'xaAdZsxMcneX8puOHBKl0Q==', N'xaAdZsxMcneX8puOHBKl0Q==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2259, N'9z2v6UllOnbNE9E2d7bPHQ==', N'9z2v6UllOnbNE9E2d7bPHQ==', N'9z2v6UllOnbNE9E2d7bPHQ==', N'9z2v6UllOnbNE9E2d7bPHQ==', N'9z2v6UllOnbNE9E2d7bPHQ==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2260, N'bh3xgkRzd9Kaf+HLXhuFgA==', N'bh3xgkRzd9Kaf+HLXhuFgA==', N'bh3xgkRzd9Kaf+HLXhuFgA==', N'bh3xgkRzd9Kaf+HLXhuFgA==', N'bh3xgkRzd9Kaf+HLXhuFgA==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2261, N'jobc7KPqXf++oPbpNVyW+g==', N'jobc7KPqXf++oPbpNVyW+g==', N'jobc7KPqXf++oPbpNVyW+g==', N'jobc7KPqXf++oPbpNVyW+g==', N'jobc7KPqXf++oPbpNVyW+g==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2262, N's6j0e0geILC9dCyAOJWqEg==', N's6j0e0geILC9dCyAOJWqEg==', N's6j0e0geILC9dCyAOJWqEg==', N's6j0e0geILC9dCyAOJWqEg==', N's6j0e0geILC9dCyAOJWqEg==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2263, N'+ifamBaKaEKWEQvFYeQzyA==', N'+ifamBaKaEKWEQvFYeQzyA==', N'+ifamBaKaEKWEQvFYeQzyA==', N'+ifamBaKaEKWEQvFYeQzyA==', N'+ifamBaKaEKWEQvFYeQzyA==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2264, N'y6t4zF1yRWNQDOIO3H1rFA==', N'Tp3ajCdWMoMlNfnBhpJtMg==', N'Tp3ajCdWMoMlNfnBhpJtMg==', N'Tp3ajCdWMoMlNfnBhpJtMg==', N'Tp3ajCdWMoMlNfnBhpJtMg==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2265, N'/20El4W4yGhrMIBeUCcoDA==', N'/20El4W4yGhrMIBeUCcoDA==', N'/20El4W4yGhrMIBeUCcoDA==', N'/20El4W4yGhrMIBeUCcoDA==', N'/20El4W4yGhrMIBeUCcoDA==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2266, N'BEK++O0eIWV0IIXxnD/G8A==', N'pKePIURAjx2wl2E9AnFp3g==', N'pKePIURAjx2wl2E9AnFp3g==', N'pKePIURAjx2wl2E9AnFp3g==', N'pKePIURAjx2wl2E9AnFp3g==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2267, N'plhFN2KvJ6f3DqYAEvwmrA==', N'plhFN2KvJ6f3DqYAEvwmrA==', N'plhFN2KvJ6f3DqYAEvwmrA==', N'plhFN2KvJ6f3DqYAEvwmrA==', N'plhFN2KvJ6f3DqYAEvwmrA==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2268, N'fgyYt+Ow8HdxrFQKBuEmyg==', N'fgyYt+Ow8HdxrFQKBuEmyg==', N'fgyYt+Ow8HdxrFQKBuEmyg==', N'fgyYt+Ow8HdxrFQKBuEmyg==', N'fgyYt+Ow8HdxrFQKBuEmyg==', 0, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2269, N'EFhGbPrcg0J9e9hQqD18Tw==', N'EFhGbPrcg0J9e9hQqD18Tw==', N'EFhGbPrcg0J9e9hQqD18Tw==', N'EFhGbPrcg0J9e9hQqD18Tw==', N'EFhGbPrcg0J9e9hQqD18Tw==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (2270, N'gWGX0n7FpUD1Dzv7SbW43w==', N'gWGX0n7FpUD1Dzv7SbW43w==', N'gWGX0n7FpUD1Dzv7SbW43w==', N'gWGX0n7FpUD1Dzv7SbW43w==', N'gWGX0n7FpUD1Dzv7SbW43w==', 1, NULL, NULL, 0, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3245, N'hbulPti1bf1kDLyWPsNEwQ==', N'Wp9RhwgpunvwgbakS/2X6g==', N'10VTleKhrzBjhhVRub4KO32eOPGXx5OT4fVXypuG+v8=', N'kk+qKnjlOFMwNf6AyhRj9g==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2024-10-23T09:39:20.700' AS DateTime), NULL, 0, 1, 4, NULL, NULL, 3, CAST(N'2025-03-24T07:15:29.0236832' AS DateTime2), NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3246, N'zxXcybPbY51M0LkX5hXrnQ==', N'madvdpdArQubVckFDeUFlg==', N'i53rvAIzM2rAxkCe+7X1WkRmXMCQD4DUvkhOKyaBdvc=', N'DEsmjhtLoJr1jfIDBaXfig==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2024-10-23T09:43:44.227' AS DateTime), NULL, 0, 1, 4, NULL, NULL, 7, CAST(N'2024-11-23T01:44:24.4322669' AS DateTime2), NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3247, N'G6FI5IHMH3XhsEPXlc9N9A==', N'pqymrb2UckmDoRPcBOabsg==', N'kE6B7RQaANZEobTYny7orbl9AEs3TB5wG+Kj44GN4Wc=', N'pqymrb2UckmDoRPcBOabsg==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2024-10-23T09:44:50.580' AS DateTime), NULL, 0, 1, 1, NULL, NULL, 4, CAST(N'2025-03-24T07:12:05.8138751' AS DateTime2), NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3248, N'cXjlXAyDLF3oRtojB/zKQw==', N'NEsTWQHN9YIrRYPBU8ktlw==', N'NEsTWQHN9YIrRYPBU8ktlw==', N'NEsTWQHN9YIrRYPBU8ktlw==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2024-10-23T09:46:02.717' AS DateTime), NULL, 0, 1, 1, NULL, NULL, 8, CAST(N'2024-10-26T09:15:59.4014223' AS DateTime2), NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3249, N'5fXfw0srhpPe/Ib0cOqDXQ==', N'/YyaaDychejp7wzehRlgiw==', N'/YyaaDychejp7wzehRlgiw==', N'/YyaaDychejp7wzehRlgiw==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2024-10-23T09:47:08.390' AS DateTime), NULL, 0, 1, 2, NULL, NULL, 5, CAST(N'2024-12-15T02:47:32.9227015' AS DateTime2), NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3250, N'zZf01wBcaDoELcW/9FS19A==', N'zZf01wBcaDoELcW/9FS19A==', N'/jOhJV7g58Cwa170B6qd2zmqdA/c+BL6cXG0HlQ7DMw=', N'zZf01wBcaDoELcW/9FS19A==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2024-10-23T09:48:47.903' AS DateTime), NULL, 0, 1, 3, NULL, NULL, 6, CAST(N'2024-10-26T04:17:48.5637033' AS DateTime2), NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3251, N'9y7bXjzolxWx6uUNL/RJ9A==', N'YWaTIgrJkjAtlS6ud4fgFw==', N'/CNLeBNbvFZOoh0mMjXiHaVx8KRr8nYGAIlVlSONpaE=', N'YWaTIgrJkjAtlS6ud4fgFw==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2024-10-23T09:50:04.267' AS DateTime), NULL, 0, 1, 3, NULL, NULL, 10, CAST(N'2024-10-26T23:14:38.6364557' AS DateTime2), NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3252, N'Q986+1XK09T8olJE8Zryng==', N'pbCGqKR/PJuoSzTlr8AL/A==', N'pbCGqKR/PJuoSzTlr8AL/A==', N'pbCGqKR/PJuoSzTlr8AL/A==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2024-10-23T09:58:39.593' AS DateTime), NULL, 0, 1, 2, NULL, NULL, 9, CAST(N'2024-10-26T03:55:58.7876719' AS DateTime2), NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3253, N'TS+mpFtJrXVxMj36uWzhxg==', N'TS+mpFtJrXVxMj36uWzhxg==', N'TS+mpFtJrXVxMj36uWzhxg==', N'TS+mpFtJrXVxMj36uWzhxg==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2024-10-31T16:24:48.820' AS DateTime), NULL, 0, 1, 1, NULL, NULL, 1, CAST(N'2025-04-29T00:28:49.3377248' AS DateTime2), NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3254, N'VkY08dK107td70B1Ndz6zQ==', N'VkY08dK107td70B1Ndz6zQ==', N'VkY08dK107td70B1Ndz6zQ==', N'VkY08dK107td70B1Ndz6zQ==', N'oGUdgA/YTbu5ldsxDRcghA==', 1, CAST(N'2024-10-31T16:34:55.207' AS DateTime), NULL, 0, 1, 1, NULL, NULL, 1, CAST(N'2025-03-19T12:57:56.8997463' AS DateTime2), N'\ClientsMembershipAttachement\cbc53310-0192-4a64-b38a-db5e6c47a491.png')
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3255, N'vLDItcNwYpXSScyzdpORGg==', N'vLDItcNwYpXSScyzdpORGg==', N'vLDItcNwYpXSScyzdpORGg==', N'vLDItcNwYpXSScyzdpORGg==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2024-11-03T07:47:11.787' AS DateTime), NULL, 0, 1, 1, NULL, NULL, 1, CAST(N'2024-11-03T22:48:51.8552620' AS DateTime2), NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3256, N'fr+zVPhiXynH/9QGj8J2DQ==', N'hnuop0woLMtl0WyB3B1OVA==', N'tYN2PFbmuHyS7j6JbUcZHQ==', N'Sk5ilRh1Iryi/QQojUvnfg==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2025-03-17T10:08:17.653' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 1, CAST(N'2025-03-17T10:22:49.2233925' AS DateTime2), NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3257, N'raJjDaOb549aRKws67o+2w==', N'raJjDaOb549aRKws67o+2w==', N'oWjMJsnEQZWDz+cLP2GTrA==', N'raJjDaOb549aRKws67o+2w==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2025-03-18T15:16:52.150' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 1, CAST(N'2025-03-19T06:14:28.6967679' AS DateTime2), NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3258, N'0s7m/DonOjUI3TNk/kvBZA==', N'lr3uEe3MztArx6gCX4+3MeM5h+mOUN9sWYTnV5bR+Sw=', N'kE6B7RQaANZEobTYny7oresFXNU7AFIU/XqTgg3qMoo=', N'0s7m/DonOjUI3TNk/kvBZA==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2025-03-24T07:07:17.690' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 1, CAST(N'2025-03-24T07:07:42.2566151' AS DateTime2), NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3259, N'e01eh2JWikZm5yh0mr8yyQ==', N'x88JdEnLCLfrFdnKJtm3AQ==', N'gwaCa+IS0e6CwO2ggPaZngM40I83CrGpaS5+UKiU0hs=', N'e01eh2JWikZm5yh0mr8yyQ==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2025-03-24T07:08:57.047' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3260, N'NtrIUdsB7bUddTLfpY/Clg==', N'2lBu59MTVoTg0gAjb+8j8g==', N'CQFf3H+d2CfckgBDwwSH6wRlBU3EWZ+lfAhK26IHTf8=', N'NtrIUdsB7bUddTLfpY/Clg==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2025-03-24T07:10:23.093' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3261, N'OAh5oJ1fPZNCkogveQv6YA==', N'OAh5oJ1fPZNCkogveQv6YA==', N'tOZHv7fRisIhaU5PyX8wIA==', N'OAh5oJ1fPZNCkogveQv6YA==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2025-03-24T07:11:17.820' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3262, N'U2Zqx8rGTxfyUn1khbAxNw==', N'U2Zqx8rGTxfyUn1khbAxNw==', N'LzAK7tfeLKB6unat/fCExQ==', N'U2Zqx8rGTxfyUn1khbAxNw==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2025-03-24T07:13:43.410' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3263, N'b0yNSHAFO0Yzv4vRThAViw==', N'pqymrb2UckmDoRPcBOabsg==', N'kE6B7RQaANZEobTYny7ordpeX66h3sARlnotrOZbc3U=', N'b0yNSHAFO0Yzv4vRThAViw==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2025-03-24T07:16:39.597' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3264, N'DiSrhOfAVOi2gBBy7D/4tw==', N'DiSrhOfAVOi2gBBy7D/4tw==', N'tung39QBJf8pT1LLTodacglC1/izxhsapj2A2j9BMuw=', N'DiSrhOfAVOi2gBBy7D/4tw==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2025-03-24T07:17:43.573' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[sec_users_tmp] ([UserID], [UserCode], [UserNameEn], [UserNameAr], [LoginName], [Password], [Enabled], [CreatedDate], [ThemeName], [IsSupervisor], [LiveExchange], [BranchID], [LocalIPAddress], [OnlineStatus], [PermissionTypeId], [LastNotifcationDate], [ImagePath]) VALUES (3265, N'dJf0IK20vrZ8kJOvMHekbw==', N'8Doo1VVVtLYr52d6h0DebQ==', N'2egRiARqZ7/AglDa9Cxz+0RUyQsBn+2eJHBNx7Kiyaw=', N'dJf0IK20vrZ8kJOvMHekbw==', N'WEbls6TkiohfcfGWaZqYpg==', 1, CAST(N'2025-03-24T14:37:25.573' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 1, CAST(N'2025-04-21T12:26:32.1333007' AS DateTime2), NULL)
GO
--end____________________________ 
update s  
set [UserCode]=s2.[UserCode] ,
[UserNameEn]=s2.[UserNameEn] ,
[UserNameAr]=s2.[UserNameAr] ,
[LoginName]=s2.[LoginName] ,
[Password]=s2.[Password] ,
[Enabled]=s2.[Enabled] ,
[CreatedDate]=s2.[CreatedDate] ,
[ThemeName]=s2.[ThemeName] ,
[IsSupervisor]=s2.[IsSupervisor] ,
[LiveExchange]=s2.[LiveExchange] ,
[BranchID]=s2.[BranchID] ,
[LocalIPAddress]=s2.[LocalIPAddress] ,
[OnlineStatus]=s2.[OnlineStatus] ,
[PermissionTypeId]=s2.[PermissionTypeId] ,
[LastNotifcationDate]=s2.[LastNotifcationDate] ,
[ImagePath]=s2.[ImagePath] 
from
sec_users s inner join [sec_users_tmp] s2 on s.[UserID] = s2.[UserID] 
go


IF EXISTS (
    SELECT 1
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[UQ_SecurityUsers_LoginName]')
      AND type = 'UQ'
)
BEGIN
    ALTER TABLE [dbo].[Sec_Users] DROP CONSTRAINT [UQ_SecurityUsers_LoginName];
END

insert into sec_users  
select * from [sec_users_tmp] s2  where s2.UserID not in (select ss.UserID from sec_users ss)


--begin____________________________
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (1, NULL, NULL, N'Exchange', N'الصرافة', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (2, NULL, NULL, N'Accounting', N'الحسابات', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (3, NULL, NULL, N'Settings', N'الإعدادات', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (101, 1, NULL, N'Basic Data', N'بيانات أساسية', 1, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (102, 1, NULL, N'Exchange Operations', N'عمليات الصرافة', 2, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (103, 1, NULL, N'Internal Operations', N'عمليات داخلية', 3, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (104, 1, NULL, N'Reports', N'التقارير', 5, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (105, 1, NULL, N'Data Analysis', N'تحليل البيانات', 6, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (106, 1, NULL, N'Security File', N'الملف الأمني', 4, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (201, 2, NULL, N'Basic Data', N'بيانات أساسية', 1, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (202, 2, NULL, N'Procedures', N'إجراءات', 2, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (203, 2, NULL, N'Financial Reports', N'تقارير مالية', 4, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (204, 2, NULL, N'Follow Reports', N'تقارير متابعة', 3, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (205, 2, NULL, N'banks', N'البنوك', 3, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (301, 3, NULL, N'General Data', N'بيانات عامة', 1, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (302, 3, NULL, N'Security', N'الحماية', 3, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (303, 3, NULL, N'Settings', N'إعدادات', 4, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (304, 3, NULL, N'Actions', N'عمليات', 2, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10101, 101, N'Exchange.FrmCurrencies', N'Currencies', N'العملات', 1, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10102, 101, N'Exchange.FrmCurrenciesPrices', N'Currencies Prices', N'أسعار العملات', 2, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10103, 101, N'Exchange.FrmClients', N'Individual Clients', N'عملاء الأفراد', 4, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10104, 101, N'Exchange.FrmSuppliers', N'Wholesale Clients', N'عملاء الجملة', 5, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10105, 101, N'Exchange.FrmCurrenciesMarketPrices', N'Market Prices', N'أسعار الصرف', 3, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10201, 102, N'Exchange.FrmInvoices', N'Exchange Invoices', N'فواتير الأفراد', NULL, 1, N'EX_Invoices|EX_InvoicesDetails', 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10301, 103, N'Exchange.FrmInternalTransfer', N'Internal Transfers', N'عهد الصرافة', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10302, 102, N'Exchange.FrmWholesaleInvoices', N'Wholesale Invoices', N'فواتير الجملة', NULL, 1, N'EX_WholeInvoices|EX_WholeInvoicesDetails', 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10304, 202, N'Accounting.FrmSettlement', N'Settlements', N'التسوية والإقفال', 9, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10309, 103, N'Exchange.FrmTracking', N'Exchange Tracking', N'تتبع حركة الصرافة', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10401, 101, N'Reports.FrmRV_CurrenciesBalances', N'Currencies Balances', N'أرصدة العملات', 4, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10402, 104, N'Reports.FrmRV_ExchangeTransactions_Individuals', N'Transactions (Individuals)', N'حركة الصرافة - أفراد', 1, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10403, 104, N'Reports.FrmRV_ExchangeTransactions_Wholesale', N'Transactions (Wholesale)', N'حركة الصرافة - جملة', 2, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10404, 204, N'Reports.FrmRV_OfficialReports', N'Official Reports', N'تقارير رسمية', 7, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10405, 204, N'Reports.FrmRV_AccountStatement', N'Account Statement', N'كشوف الحسابات', 1, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10406, 204, N'Reports.FrmRV_Revenue', N'Revenue Report', N'تقرير الربحية', 6, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10407, 204, N'Reports.FrmRV_AssetsBalances', N'Assets Balances', N'أرصدة الأصول', 5, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10408, 204, N'Reports.FrmRV_OfficialReports_old', N'OfficialReports Old', N'OLD تقارير رسمية', 8, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10409, 204, N'Reports.FrmRV_CreditLimitReport', N'Credit Limit Report', N'تقرير الحد الإئتماني', 8, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10410, 104, N'Reports.FrmRV_CurrenciesTransactions', N'Currencies Transactions', N'حركة العملات', 3, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10411, 104, N'Reports.FrmRV_IndividualStatistics', N'Individual Statistics', N'إحصائيات الأفراد', 9, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10489, 101, N'Reports.FrmRV_CurrenciesBalances', N'Currencies Balances', N'أرصدة الافتتاحيه', 4, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10490, 101, N'القطاعات', N'القطاعات', N'القطاعات', 4, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10501, 105, N'Reports.FrmRV_ExchangeAnalysis_Revenue', N'Revenue', N'الربحية', 1, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10502, 105, N'Reports.FrmRV_ExchangeAnalysis_SaleCostRate', N'Sale / Cost Rate', N'سعر البيع / التكلفة', 2, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10503, 105, N'Reports.FrmRV_ExchangeAnalysis_SalePurchaseRate', N'Sale / Purchase Rate', N'سعر البيع / الشراء', 3, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10504, 105, N'Reports.FrmRV_ExchangeAnalysis_SalesBelowCost', N'Sales Below Cost', N'بيع بأقل من التكلفة', 4, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10601, 106, N'Exchange.FrmLocallyWanted', N'Locally Wanted', N'المطلوبين محلياً', 1, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (10602, 106, N'Exchange.FrmInternationallyWanted', N'Internationally Wanted', N'المطلوبين دولياً', 2, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20101, 201, N'Accounting.FrmAccountsIndex', N'Accounts Index', N'دليل الحسابات', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20201, 202, N'Accounting.FrmJVs', N'Journal Vouchers', N'قيود اليومية', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20202, 202, N'Accounting.FrmCashFlow', N'Cash Vouchers', N'سندات الخزينة', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20203, 202, N'Exchange.FrmBranchTransfers', N'Branch Transfers', N'تحويلات الفروع', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20205, 202, N'سندات البنوك', N'سندات البنوك', N'سندات البنوك', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20206, 202, N'ترحيل القيود', N'ترحيل القيود', N'ترحيل القيود', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20301, 203, N'Reports.FrmRV_JVs', N'Journal Vouchers', N'قيود يومية', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20302, 203, N'Reports.FrmRV_AnalyticalStatements', N'Analytical Statements', N'كشوف تحليلية', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20303, 203, N'Reports.FrmRV_FinancialStatement', N'Financial Statement', N'قائمة المركز المالي', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20304, 203, N'Reports.FrmRV_IncomeStatement', N'Income Statements', N'قائمة الدخل', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20305, 203, N'Reports.FrmRV_TrialBalance', N'Trial Balance', N'ميزان المراجعة', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20401, 204, N'Reports.FrmRV_SalesPurchases', N'Purchases & Sales', N'المشتريات والمبيعات', 9, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20499, 204, N'حركه الخزينة', N'حركة الخزينة', N'حركة الخزينة', 9, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20501, 205, N'حسابات البنوك', N'حسابات البنوك', N'حسابات البنوك', 1, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20502, 205, N'الارصده الافتتاحيه للبنوك', N'الارصده الافتتاحيه للبنوك', N'الارصده الافتتاحيه للبنوك', 2, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20503, 205, N'التحويل بين البنوك', N'التحويل بين البنوك', N'التحويل بين البنوك', 3, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20504, 205, N'التحويل بين الخزن والبنوك', N'التحويل بين الخزن والبنوك', N'التحويل بين الخزن والبنوك', 4, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (20505, 205, N'اثبات تحصيل شيك', N'اثبات تحصيل شيك', N'اثبات تحصيل شيك', 5, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (30101, 301, N'Settings.FrmBanks', N'Banks', N'البنوك', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (30102, 301, N'Settings.FrmClientJobs', N'Jobs', N'الوظائف', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (30103, 301, N'Settings.FrmIDSources', N'ID Sources', N'مصادر الهوية', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (30104, 301, N'Settings.FrmIncomeSources', N'Income Sources', N'مصادر الدخل', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (30105, 301, N'Settings.FrmExchangePurposes', N'Exchange Purposes', N'أغراض التحويل', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (30106, 301, N'Settings.FrmCountries', N'Countries', N'الدول', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (30189, 301, N'treasuries', N'treasuries', N'الخزن', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (30201, 302, N'FrmSecurity', N'Users & Privileges', N'الصلاحيات', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (30301, 303, N'Settings.FrmInvoicesPostingSettings', N'Accounts Settings', N'إعدادات الحسابات', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (30302, 303, N'Settings.FrmSettings', N'Settings', N'إعدادات', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (30303, 303, N'سلسه اعتمادات طلبات العمل', N'Settings', N'سلسه اعتمادات طلبات العمل', NULL, 0, NULL, 1)
GO
INSERT [dbo].[Sec_Forms] ([FormID], [ParentID], [FormName], [DisplayNameEn], [DisplayNameAr], [FormOrder], [ShowInLog], [TablesForLog], [Installed]) VALUES (30401, 304, N'Settings.FrmTransactionLog', N'Action Log', N'سجل العمليات', NULL, 0, NULL, 1)
--end____________________________
--begin____________________________
GO

INSERT [dbo].[Sec_Functions] ([FunctionID], [FunctionName], [FunctionNameEn], [FunctionNameAr], [FunctionOrder], [Logged], [HasTextValue]) VALUES (1, N'Open', N'Open', N'فتح', 0, 0, 0)
GO
INSERT [dbo].[Sec_Functions] ([FunctionID], [FunctionName], [FunctionNameEn], [FunctionNameAr], [FunctionOrder], [Logged], [HasTextValue]) VALUES (2, N'Add', N'Add', N'إضافة', 0, 1, 0)
GO
INSERT [dbo].[Sec_Functions] ([FunctionID], [FunctionName], [FunctionNameEn], [FunctionNameAr], [FunctionOrder], [Logged], [HasTextValue]) VALUES (3, N'Edit', N'Edit', N'تعديل', 0, 1, 0)
GO
INSERT [dbo].[Sec_Functions] ([FunctionID], [FunctionName], [FunctionNameEn], [FunctionNameAr], [FunctionOrder], [Logged], [HasTextValue]) VALUES (4, N'Delete', N'Delete', N'حذف', 0, 1, 0)
GO
INSERT [dbo].[Sec_Functions] ([FunctionID], [FunctionName], [FunctionNameEn], [FunctionNameAr], [FunctionOrder], [Logged], [HasTextValue]) VALUES (5, N'Void', N'Void', N'إلغاء', 0, 1, 0)
GO
INSERT [dbo].[Sec_Functions] ([FunctionID], [FunctionName], [FunctionNameEn], [FunctionNameAr], [FunctionOrder], [Logged], [HasTextValue]) VALUES (6, N'Print', N'Print', N'طباعة', 0, 0, 0)
GO
INSERT [dbo].[Sec_Functions] ([FunctionID], [FunctionName], [FunctionNameEn], [FunctionNameAr], [FunctionOrder], [Logged], [HasTextValue]) VALUES (7, N'Search', N'Search', N'بحث', 0, 0, 0)
GO
INSERT [dbo].[Sec_Functions] ([FunctionID], [FunctionName], [FunctionNameEn], [FunctionNameAr], [FunctionOrder], [Logged], [HasTextValue]) VALUES (8, N'ViewDetails', N'View Details', N'عرض التفاصيل', 0, 0, 0)
GO
INSERT [dbo].[Sec_Functions] ([FunctionID], [FunctionName], [FunctionNameEn], [FunctionNameAr], [FunctionOrder], [Logged], [HasTextValue]) VALUES (9, N'Commission', N'Commission', N'العمولة', 0, 0, 0)
GO
INSERT [dbo].[Sec_Functions] ([FunctionID], [FunctionName], [FunctionNameEn], [FunctionNameAr], [FunctionOrder], [Logged], [HasTextValue]) VALUES (10, N'Membership', N'Membership', N'العضوية', 0, 0, 0)
GO
INSERT [dbo].[Sec_Functions] ([FunctionID], [FunctionName], [FunctionNameEn], [FunctionNameAr], [FunctionOrder], [Logged], [HasTextValue]) VALUES (11, N'Forming', N'Forming', N'الإلتزام', 0, 0, 0)
GO
INSERT [dbo].[Sec_Functions] ([FunctionID], [FunctionName], [FunctionNameEn], [FunctionNameAr], [FunctionOrder], [Logged], [HasTextValue]) VALUES (12, N'Susp--end____________________________', N'Susp--end____________________________', N'إيقاف', 0, 0, 0)
GO
INSERT [dbo].[Sec_Functions] ([FunctionID], [FunctionName], [FunctionNameEn], [FunctionNameAr], [FunctionOrder], [Logged], [HasTextValue]) VALUES (13, N'اقصي نسبه خصم', N'Max Discount', N'اقصي نسبه خصم', 0, 0, 1)
GO
--end____________________________ 
--begin____________________________
SET IDENTITY_INSERT [dbo].[Sec_FormsFunctions] ON 
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1, 1, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (2, 2, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (3, 3, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (4, 101, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (5, 102, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (6, 103, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (7, 106, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (8, 104, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (9, 105, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (10, 201, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (11, 202, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (12, 204, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (13, 203, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (14, 301, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (15, 304, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (16, 302, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (17, 303, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (18, 10101, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (19, 10102, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (20, 10105, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (21, 10103, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (22, 10104, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (23, 10201, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (24, 10302, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (25, 10301, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (26, 10309, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (27, 10402, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (28, 10403, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (29, 10410, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (30, 10401, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (31, 10411, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (32, 10501, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (33, 10502, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (34, 10503, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (35, 10504, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (36, 10601, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (37, 10602, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (38, 20101, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (39, 20201, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (40, 20202, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (41, 20203, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (42, 10304, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (43, 20301, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (44, 20302, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (45, 20303, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (46, 20304, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (47, 20305, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (48, 10405, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (49, 10407, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (50, 10406, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (51, 10404, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (52, 10408, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (53, 10409, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (54, 20401, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (55, 30101, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (56, 30102, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (57, 30103, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (58, 30104, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (59, 30105, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (60, 30106, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (61, 30201, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (62, 30301, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (63, 30302, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (64, 30401, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (65, 1, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (66, 2, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (67, 3, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (68, 101, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (69, 102, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (70, 103, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (71, 106, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (72, 104, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (73, 105, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (74, 201, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (75, 202, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (76, 204, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (77, 203, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (78, 301, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (79, 304, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (80, 302, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (81, 303, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (82, 10101, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (83, 10102, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (84, 10105, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (85, 10103, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (86, 10104, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (87, 10201, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (88, 10302, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (89, 10301, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (90, 10309, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (96, 10501, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (97, 10502, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (98, 10503, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (99, 10504, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (100, 10601, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (101, 10602, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (102, 20101, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (103, 20201, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (104, 20202, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (105, 20203, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (106, 10304, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (107, 20301, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (108, 20302, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (109, 20303, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (110, 20304, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (111, 20305, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (112, 10405, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (113, 10407, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (114, 10406, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (115, 10404, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (116, 10408, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (117, 10409, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (118, 20401, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (119, 30101, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (120, 30102, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (121, 30103, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (122, 30104, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (123, 30105, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (124, 30106, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (125, 30201, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (126, 30301, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (127, 30302, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (128, 30401, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (129, 1, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (130, 2, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (131, 3, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (132, 101, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (133, 102, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (134, 103, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (135, 106, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (136, 104, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (137, 105, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (138, 201, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (139, 202, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (140, 204, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (141, 203, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (142, 301, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (143, 304, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (144, 302, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (145, 303, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (146, 10101, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (147, 10102, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (148, 10105, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (149, 10103, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (150, 10104, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (151, 10201, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (152, 10302, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (153, 10301, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (154, 10309, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (160, 10501, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (161, 10502, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (162, 10503, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (163, 10504, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (164, 10601, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (165, 10602, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (166, 20101, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (167, 20201, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (168, 20202, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (169, 20203, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (170, 10304, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (171, 20301, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (172, 20302, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (173, 20303, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (174, 20304, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (175, 20305, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (176, 10405, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (177, 10407, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (178, 10406, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (179, 10404, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (180, 10408, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (181, 10409, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (182, 20401, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (183, 30101, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (184, 30102, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (185, 30103, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (186, 30104, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (187, 30105, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (188, 30106, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (189, 30201, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (190, 30301, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (191, 30302, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (192, 30401, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (193, 1, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (194, 2, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (195, 3, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (196, 101, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (197, 102, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (198, 103, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (199, 106, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (200, 104, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (201, 105, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (202, 201, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (203, 202, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (204, 204, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (205, 203, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (206, 301, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (207, 304, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (208, 302, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (209, 303, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (210, 10101, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (211, 10102, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (212, 10105, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (213, 10103, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (214, 10104, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (215, 10201, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (216, 10302, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (217, 10301, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (218, 10309, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (224, 10501, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (225, 10502, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (226, 10503, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (227, 10504, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (228, 10601, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (229, 10602, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (230, 20101, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (231, 20201, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (232, 20202, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (233, 20203, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (234, 10304, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (235, 20301, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (236, 20302, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (237, 20303, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (238, 20304, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (239, 20305, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (240, 10405, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (241, 10407, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (242, 10406, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (243, 10404, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (244, 10408, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (245, 10409, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (246, 20401, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (247, 30101, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (248, 30102, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (249, 30103, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (250, 30104, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (251, 30105, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (252, 30106, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (253, 30201, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (254, 30301, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (255, 30302, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (256, 30401, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (257, 1, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (258, 2, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (259, 3, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (260, 101, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (261, 102, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (262, 103, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (263, 106, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (264, 104, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (265, 105, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (266, 201, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (267, 202, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (268, 204, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (269, 203, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (270, 301, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (271, 304, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (272, 302, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (273, 303, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (274, 10101, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (275, 10102, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (276, 10105, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (277, 10103, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (278, 10104, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (279, 10201, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (280, 10302, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (281, 10301, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (282, 10309, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (283, 10402, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (284, 10403, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (285, 10410, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (286, 10401, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (287, 10411, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (288, 10501, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (289, 10502, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (290, 10503, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (291, 10504, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (292, 10601, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (293, 10602, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (294, 20101, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (295, 20201, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (296, 20202, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (297, 20203, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (298, 10304, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (299, 20301, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (300, 20302, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (301, 20303, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (302, 20304, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (303, 20305, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (304, 10405, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (305, 10407, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (306, 10406, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (307, 10404, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (308, 10408, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (309, 10409, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (310, 20401, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (311, 30101, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (312, 30102, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (313, 30103, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (314, 30104, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (315, 30105, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (316, 30106, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (317, 30201, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (318, 30301, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (319, 30302, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (320, 30401, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (321, 1, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (322, 2, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (323, 3, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (324, 101, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (325, 102, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (326, 103, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (327, 106, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (328, 104, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (329, 105, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (330, 201, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (331, 202, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (332, 204, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (333, 203, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (334, 301, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (335, 304, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (336, 302, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (337, 303, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (338, 10101, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (339, 10102, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (340, 10105, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (341, 10103, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (342, 10104, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (343, 10201, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (344, 10302, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (345, 10301, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (346, 10309, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (347, 10402, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (348, 10403, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (349, 10410, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (350, 10401, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (351, 10411, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (352, 10501, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (353, 10502, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (354, 10503, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (355, 10504, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (356, 10601, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (357, 10602, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (358, 20101, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (359, 20201, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (360, 20202, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (361, 20203, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (362, 10304, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (363, 20301, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (364, 20302, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (365, 20303, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (366, 20304, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (367, 20305, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (368, 10405, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (369, 10407, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (370, 10406, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (371, 10404, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (372, 10408, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (373, 10409, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (374, 20401, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (375, 30101, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (376, 30102, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (377, 30103, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (378, 30104, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (379, 30105, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (380, 30106, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (381, 30201, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (382, 30301, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (383, 30302, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (384, 30401, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (385, 1, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (386, 2, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (387, 3, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (388, 101, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (389, 102, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (390, 103, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (391, 106, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (392, 104, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (393, 105, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (394, 201, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (395, 202, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (396, 204, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (397, 203, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (398, 301, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (399, 304, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (400, 302, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (401, 303, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (402, 10101, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (403, 10102, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (404, 10105, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (405, 10103, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (406, 10104, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (407, 10201, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (408, 10302, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (409, 10301, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (410, 10309, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (416, 10501, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (417, 10502, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (418, 10503, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (419, 10504, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (420, 10601, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (421, 10602, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (422, 20101, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (423, 20201, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (424, 20202, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (425, 20203, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (426, 10304, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (427, 20301, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (428, 20302, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (429, 20303, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (430, 20304, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (431, 20305, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (432, 10405, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (433, 10407, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (434, 10406, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (435, 10404, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (436, 10408, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (437, 10409, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (438, 20401, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (439, 30101, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (440, 30102, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (441, 30103, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (442, 30104, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (443, 30105, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (444, 30106, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (445, 30201, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (446, 30301, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (447, 30302, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (448, 30401, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (449, 30189, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (450, 30189, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (451, 30189, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (452, 30189, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (453, 30189, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (454, 30189, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (455, 30189, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (456, 10489, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (457, 10489, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (458, 10489, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (459, 10489, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (460, 10489, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (461, 10489, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (462, 10489, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (501, 20205, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (502, 20205, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (503, 20205, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (504, 20205, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (505, 20205, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (506, 20205, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (507, 20205, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (601, 20206, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (602, 20206, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (603, 20206, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (604, 20206, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (605, 20206, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (606, 20206, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (607, 20206, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (991, 30303, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (992, 30303, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (993, 30303, 4)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (999, 30303, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1000, 20501, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1001, 20501, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1002, 20501, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1003, 20501, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1004, 20501, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1005, 20501, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1006, 20501, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1007, 20502, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1008, 20502, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1009, 20502, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1010, 20502, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1011, 20502, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1012, 20502, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1013, 20502, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1014, 20503, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1015, 20503, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1016, 20503, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1017, 20503, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1018, 20503, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1019, 20503, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1020, 20503, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1021, 20504, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1022, 20504, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1023, 20504, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1024, 20504, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1025, 20504, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1026, 20504, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1027, 20504, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1028, 20505, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1029, 20505, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1030, 20505, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1031, 20505, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1032, 20505, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1033, 20505, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1034, 20505, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1035, 10490, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1036, 10490, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1037, 10490, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1038, 10490, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1039, 10490, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1040, 10490, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1041, 10490, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1042, 20499, 1)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1043, 20499, 2)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1044, 20499, 3)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1045, 20499, 5)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1046, 20499, 6)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1047, 20499, 7)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1048, 20499, 8)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1049, 10201, 13)
GO
INSERT [dbo].[Sec_FormsFunctions] ([FormFunctionID], [FormID], [FunctionID]) VALUES (1050, 10302, 13)
GO
--end____________________________ 

SET IDENTITY_INSERT [dbo].[Sec_FormsFunctions] OFF



--begin____________________________
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (1, 1, 1, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (2, 1, 2, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (3, 1, 3, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (4, 1, 101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (5, 1, 102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (6, 1, 103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (7, 1, 104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (8, 1, 105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (9, 1, 106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (10, 1, 201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (11, 1, 202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (12, 1, 203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (13, 1, 204, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (14, 1, 301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (15, 1, 302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (16, 1, 303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (17, 1, 304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (18, 1, 10101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (19, 1, 10102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (20, 1, 10103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (21, 1, 10104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (22, 1, 10105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (23, 1, 10201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (24, 1, 10301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (25, 1, 10302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (26, 1, 10304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (27, 1, 10309, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (28, 1, 10401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (29, 1, 10402, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (30, 1, 10403, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (31, 1, 10404, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (32, 1, 10405, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (33, 1, 10406, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (34, 1, 10407, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (35, 1, 10408, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (36, 1, 10409, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (37, 1, 10410, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (38, 1, 10411, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (39, 1, 10501, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (40, 1, 10502, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (41, 1, 10503, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (42, 1, 10504, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (43, 1, 10601, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (44, 1, 10602, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (45, 1, 20101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (46, 1, 20201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (47, 1, 20202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (48, 1, 20203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (49, 1, 20301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (50, 1, 20302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (51, 1, 20303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (52, 1, 20304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (53, 1, 20305, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (54, 1, 20401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (55, 1, 30101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (56, 1, 30102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (57, 1, 30103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (58, 1, 30104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (59, 1, 30105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (60, 1, 30106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (61, 1, 30201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (62, 1, 30301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (63, 1, 30302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (64, 1, 30401, 0, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (129, 1, 30189, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (130, 1, 10489, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (131, 1, 30303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (132, 2, 1, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (133, 2, 2, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (134, 2, 3, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (135, 2, 101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (136, 2, 102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (137, 2, 103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (138, 2, 104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (139, 2, 105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (140, 2, 106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (141, 2, 201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (142, 2, 202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (143, 2, 203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (144, 2, 204, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (145, 2, 301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (146, 2, 302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (147, 2, 303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (148, 2, 304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (149, 2, 10101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (150, 2, 10102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (151, 2, 10103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (152, 2, 10104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (153, 2, 10105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (154, 2, 10201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (155, 2, 10301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (156, 2, 10302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (157, 2, 10304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (158, 2, 10309, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (159, 2, 10401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (160, 2, 10402, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (161, 2, 10403, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (162, 2, 10404, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (163, 2, 10405, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (164, 2, 10406, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (165, 2, 10407, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (166, 2, 10408, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (167, 2, 10409, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (168, 2, 10410, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (169, 2, 10411, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (170, 2, 10501, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (171, 2, 10502, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (172, 2, 10503, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (173, 2, 10504, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (174, 2, 10601, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (175, 2, 10602, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (176, 2, 20101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (177, 2, 20201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (178, 2, 20202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (179, 2, 20203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (180, 2, 20301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (181, 2, 20302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (182, 2, 20303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (183, 2, 20304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (184, 2, 20305, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (185, 2, 20401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (186, 2, 30101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (187, 2, 30102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (188, 2, 30103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (189, 2, 30104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (190, 2, 30105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (191, 2, 30106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (192, 2, 30201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (193, 2, 30301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (194, 2, 30302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (195, 2, 30401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (196, 2, 30189, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (197, 2, 10489, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (198, 2, 30303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (199, 3, 1, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (200, 3, 2, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (201, 3, 3, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (202, 3, 101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (203, 3, 102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (204, 3, 103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (205, 3, 104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (206, 3, 105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (207, 3, 106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (208, 3, 201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (209, 3, 202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (210, 3, 203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (211, 3, 204, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (212, 3, 301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (213, 3, 302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (214, 3, 303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (215, 3, 304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (216, 3, 10101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (217, 3, 10102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (218, 3, 10103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (219, 3, 10104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (220, 3, 10105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (221, 3, 10201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (222, 3, 10301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (223, 3, 10302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (224, 3, 10304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (225, 3, 10309, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (226, 3, 10401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (227, 3, 10402, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (228, 3, 10403, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (229, 3, 10404, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (230, 3, 10405, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (231, 3, 10406, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (232, 3, 10407, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (233, 3, 10408, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (234, 3, 10409, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (235, 3, 10410, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (236, 3, 10411, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (237, 3, 10501, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (238, 3, 10502, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (239, 3, 10503, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (240, 3, 10504, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (241, 3, 10601, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (242, 3, 10602, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (243, 3, 20101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (244, 3, 20201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (245, 3, 20202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (246, 3, 20203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (247, 3, 20301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (248, 3, 20302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (249, 3, 20303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (250, 3, 20304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (251, 3, 20305, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (252, 3, 20401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (253, 3, 30101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (254, 3, 30102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (255, 3, 30103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (256, 3, 30104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (257, 3, 30105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (258, 3, 30106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (259, 3, 30201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (260, 3, 30301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (261, 3, 30302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (262, 3, 30401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (263, 3, 30189, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (264, 3, 10489, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (265, 3, 30303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (266, 4, 1, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (267, 4, 2, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (268, 4, 3, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (269, 4, 101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (270, 4, 102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (271, 4, 103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (272, 4, 104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (273, 4, 105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (274, 4, 106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (275, 4, 201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (276, 4, 202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (277, 4, 203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (278, 4, 204, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (279, 4, 301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (280, 4, 302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (281, 4, 303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (282, 4, 304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (283, 4, 10101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (284, 4, 10102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (285, 4, 10103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (286, 4, 10104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (287, 4, 10105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (288, 4, 10201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (289, 4, 10301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (290, 4, 10302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (291, 4, 10304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (292, 4, 10309, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (293, 4, 10401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (294, 4, 10402, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (295, 4, 10403, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (296, 4, 10404, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (297, 4, 10405, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (298, 4, 10406, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (299, 4, 10407, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (300, 4, 10408, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (301, 4, 10409, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (302, 4, 10410, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (303, 4, 10411, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (304, 4, 10501, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (305, 4, 10502, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (306, 4, 10503, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (307, 4, 10504, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (308, 4, 10601, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (309, 4, 10602, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (310, 4, 20101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (311, 4, 20201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (312, 4, 20202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (313, 4, 20203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (314, 4, 20301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (315, 4, 20302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (316, 4, 20303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (317, 4, 20304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (318, 4, 20305, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (319, 4, 20401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (320, 4, 30101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (321, 4, 30102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (322, 4, 30103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (323, 4, 30104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (324, 4, 30105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (325, 4, 30106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (326, 4, 30201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (327, 4, 30301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (328, 4, 30302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (329, 4, 30401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (330, 4, 30189, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (331, 4, 10489, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (332, 4, 30303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (333, 5, 1, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (334, 5, 2, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (335, 5, 3, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (336, 5, 101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (337, 5, 102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (338, 5, 103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (339, 5, 104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (340, 5, 105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (341, 5, 106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (342, 5, 201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (343, 5, 202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (344, 5, 203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (345, 5, 204, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (346, 5, 301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (347, 5, 302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (348, 5, 303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (349, 5, 304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (350, 5, 10101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (351, 5, 10102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (352, 5, 10103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (353, 5, 10104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (354, 5, 10105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (355, 5, 10201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (356, 5, 10301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (357, 5, 10302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (358, 5, 10304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (359, 5, 10309, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (360, 5, 10401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (361, 5, 10402, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (362, 5, 10403, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (363, 5, 10404, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (364, 5, 10405, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (365, 5, 10406, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (366, 5, 10407, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (367, 5, 10408, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (368, 5, 10409, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (369, 5, 10410, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (370, 5, 10411, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (371, 5, 10501, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (372, 5, 10502, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (373, 5, 10503, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (374, 5, 10504, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (375, 5, 10601, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (376, 5, 10602, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (377, 5, 20101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (378, 5, 20201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (379, 5, 20202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (380, 5, 20203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (381, 5, 20301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (382, 5, 20302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (383, 5, 20303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (384, 5, 20304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (385, 5, 20305, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (386, 5, 20401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (387, 5, 30101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (388, 5, 30102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (389, 5, 30103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (390, 5, 30104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (391, 5, 30105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (392, 5, 30106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (393, 5, 30201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (394, 5, 30301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (395, 5, 30302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (396, 5, 30401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (397, 5, 30189, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (398, 5, 10489, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (399, 5, 30303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (400, 6, 1, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (401, 6, 2, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (402, 6, 3, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (403, 6, 101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (404, 6, 102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (405, 6, 103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (406, 6, 104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (407, 6, 105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (408, 6, 106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (409, 6, 201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (410, 6, 202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (411, 6, 203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (412, 6, 204, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (413, 6, 301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (414, 6, 302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (415, 6, 303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (416, 6, 304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (417, 6, 10101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (418, 6, 10102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (419, 6, 10103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (420, 6, 10104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (421, 6, 10105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (422, 6, 10201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (423, 6, 10301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (424, 6, 10302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (425, 6, 10304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (426, 6, 10309, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (427, 6, 10401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (428, 6, 10402, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (429, 6, 10403, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (430, 6, 10404, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (431, 6, 10405, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (432, 6, 10406, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (433, 6, 10407, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (434, 6, 10408, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (435, 6, 10409, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (436, 6, 10410, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (437, 6, 10411, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (438, 6, 10501, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (439, 6, 10502, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (440, 6, 10503, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (441, 6, 10504, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (442, 6, 10601, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (443, 6, 10602, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (444, 6, 20101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (445, 6, 20201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (446, 6, 20202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (447, 6, 20203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (448, 6, 20301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (449, 6, 20302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (450, 6, 20303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (451, 6, 20304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (452, 6, 20305, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (453, 6, 20401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (454, 6, 30101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (455, 6, 30102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (456, 6, 30103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (457, 6, 30104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (458, 6, 30105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (459, 6, 30106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (460, 6, 30201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (461, 6, 30301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (462, 6, 30302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (463, 6, 30401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (464, 6, 30189, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (465, 6, 10489, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (466, 6, 30303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (467, 7, 1, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (468, 7, 2, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (469, 7, 3, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (470, 7, 101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (471, 7, 102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (472, 7, 103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (473, 7, 104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (474, 7, 105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (475, 7, 106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (476, 7, 201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (477, 7, 202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (478, 7, 203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (479, 7, 204, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (480, 7, 301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (481, 7, 302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (482, 7, 303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (483, 7, 304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (484, 7, 10101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (485, 7, 10102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (486, 7, 10103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (487, 7, 10104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (488, 7, 10105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (489, 7, 10201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (490, 7, 10301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (491, 7, 10302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (492, 7, 10304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (493, 7, 10309, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (494, 7, 10401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (495, 7, 10402, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (496, 7, 10403, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (497, 7, 10404, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (498, 7, 10405, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (499, 7, 10406, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (500, 7, 10407, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (501, 7, 10408, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (502, 7, 10409, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (503, 7, 10410, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (504, 7, 10411, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (505, 7, 10501, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (506, 7, 10502, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (507, 7, 10503, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (508, 7, 10504, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (509, 7, 10601, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (510, 7, 10602, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (511, 7, 20101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (512, 7, 20201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (513, 7, 20202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (514, 7, 20203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (515, 7, 20301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (516, 7, 20302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (517, 7, 20303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (518, 7, 20304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (519, 7, 20305, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (520, 7, 20401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (521, 7, 30101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (522, 7, 30102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (523, 7, 30103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (524, 7, 30104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (525, 7, 30105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (526, 7, 30106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (527, 7, 30201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (528, 7, 30301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (529, 7, 30302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (530, 7, 30401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (531, 7, 30189, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (532, 7, 10489, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (533, 7, 30303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (534, 8, 1, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (535, 8, 2, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (536, 8, 3, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (537, 8, 101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (538, 8, 102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (539, 8, 103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (540, 8, 104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (541, 8, 105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (542, 8, 106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (543, 8, 201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (544, 8, 202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (545, 8, 203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (546, 8, 204, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (547, 8, 301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (548, 8, 302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (549, 8, 303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (550, 8, 304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (551, 8, 10101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (552, 8, 10102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (553, 8, 10103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (554, 8, 10104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (555, 8, 10105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (556, 8, 10201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (557, 8, 10301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (558, 8, 10302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (559, 8, 10304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (560, 8, 10309, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (561, 8, 10401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (562, 8, 10402, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (563, 8, 10403, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (564, 8, 10404, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (565, 8, 10405, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (566, 8, 10406, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (567, 8, 10407, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (568, 8, 10408, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (569, 8, 10409, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (570, 8, 10410, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (571, 8, 10411, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (572, 8, 10501, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (573, 8, 10502, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (574, 8, 10503, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (575, 8, 10504, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (576, 8, 10601, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (577, 8, 10602, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (578, 8, 20101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (579, 8, 20201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (580, 8, 20202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (581, 8, 20203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (582, 8, 20301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (583, 8, 20302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (584, 8, 20303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (585, 8, 20304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (586, 8, 20305, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (587, 8, 20401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (588, 8, 30101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (589, 8, 30102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (590, 8, 30103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (591, 8, 30104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (592, 8, 30105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (593, 8, 30106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (594, 8, 30201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (595, 8, 30301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (596, 8, 30302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (597, 8, 30401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (598, 8, 30189, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (599, 8, 10489, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (600, 8, 30303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (601, 9, 1, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (602, 9, 2, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (603, 9, 3, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (604, 9, 101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (605, 9, 102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (606, 9, 103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (607, 9, 104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (608, 9, 105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (609, 9, 106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (610, 9, 201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (611, 9, 202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (612, 9, 203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (613, 9, 204, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (614, 9, 301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (615, 9, 302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (616, 9, 303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (617, 9, 304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (618, 9, 10101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (619, 9, 10102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (620, 9, 10103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (621, 9, 10104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (622, 9, 10105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (623, 9, 10201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (624, 9, 10301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (625, 9, 10302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (626, 9, 10304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (627, 9, 10309, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (628, 9, 10401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (629, 9, 10402, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (630, 9, 10403, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (631, 9, 10404, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (632, 9, 10405, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (633, 9, 10406, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (634, 9, 10407, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (635, 9, 10408, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (636, 9, 10409, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (637, 9, 10410, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (638, 9, 10411, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (639, 9, 10501, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (640, 9, 10502, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (641, 9, 10503, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (642, 9, 10504, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (643, 9, 10601, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (644, 9, 10602, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (645, 9, 20101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (646, 9, 20201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (647, 9, 20202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (648, 9, 20203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (649, 9, 20301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (650, 9, 20302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (651, 9, 20303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (652, 9, 20304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (653, 9, 20305, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (654, 9, 20401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (655, 9, 30101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (656, 9, 30102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (657, 9, 30103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (658, 9, 30104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (659, 9, 30105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (660, 9, 30106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (661, 9, 30201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (662, 9, 30301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (663, 9, 30302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (664, 9, 30401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (665, 9, 30189, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (666, 9, 10489, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (667, 9, 30303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (668, 10, 1, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (669, 10, 2, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (670, 10, 3, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (671, 10, 101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (672, 10, 102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (673, 10, 103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (674, 10, 104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (675, 10, 105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (676, 10, 106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (677, 10, 201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (678, 10, 202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (679, 10, 203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (680, 10, 204, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (681, 10, 301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (682, 10, 302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (683, 10, 303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (684, 10, 304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (685, 10, 10101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (686, 10, 10102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (687, 10, 10103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (688, 10, 10104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (689, 10, 10105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (690, 10, 10201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (691, 10, 10301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (692, 10, 10302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (693, 10, 10304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (694, 10, 10309, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (695, 10, 10401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (696, 10, 10402, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (697, 10, 10403, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (698, 10, 10404, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (699, 10, 10405, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (700, 10, 10406, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (701, 10, 10407, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (702, 10, 10408, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (703, 10, 10409, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (704, 10, 10410, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (705, 10, 10411, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (706, 10, 10501, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (707, 10, 10502, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (708, 10, 10503, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (709, 10, 10504, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (710, 10, 10601, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (711, 10, 10602, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (712, 10, 20101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (713, 10, 20201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (714, 10, 20202, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (715, 10, 20203, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (716, 10, 20301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (717, 10, 20302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (718, 10, 20303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (719, 10, 20304, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (720, 10, 20305, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (721, 10, 20401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (722, 10, 30101, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (723, 10, 30102, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (724, 10, 30103, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (725, 10, 30104, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (726, 10, 30105, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (727, 10, 30106, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (728, 10, 30201, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (729, 10, 30301, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (730, 10, 30302, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (731, 10, 30401, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (732, 10, 30189, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (733, 10, 10489, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (734, 10, 30303, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (735, 1, 20205, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (736, 1, 20206, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (737, 1, 205, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (738, 1, 20501, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (739, 1, 20502, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (740, 1, 20503, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (741, 1, 20504, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (742, 1, 20505, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (743, 1, 10490, 1, NULL)
GO
INSERT [dbo].[Sec_UsersForms] ([ID], [PermissionTypeId], [FormID], [Selected], [SecUserUserId]) VALUES (744, 1, 20499, 1, NULL)
GO
--end____________________________ 
--begin____________________________
SET IDENTITY_INSERT [dbo].[SecPermissionTypeBranches] ON 
GO
INSERT [dbo].[SecPermissionTypeBranches] ([ID], [PermissionTypeId], [BranchId], [Selected]) VALUES (3, 1, 1, 1)
GO
INSERT [dbo].[SecPermissionTypeBranches] ([ID], [PermissionTypeId], [BranchId], [Selected]) VALUES (4, 1, 2, 1)
GO
INSERT [dbo].[SecPermissionTypeBranches] ([ID], [PermissionTypeId], [BranchId], [Selected]) VALUES (5, 2, 1, 1)
GO
INSERT [dbo].[SecPermissionTypeBranches] ([ID], [PermissionTypeId], [BranchId], [Selected]) VALUES (6, 2, 2, 0)
GO
INSERT [dbo].[SecPermissionTypeBranches] ([ID], [PermissionTypeId], [BranchId], [Selected]) VALUES (7, 2, 3, 0)
GO
INSERT [dbo].[SecPermissionTypeBranches] ([ID], [PermissionTypeId], [BranchId], [Selected]) VALUES (8, 1, 3, 1)
GO
INSERT [dbo].[SecPermissionTypeBranches] ([ID], [PermissionTypeId], [BranchId], [Selected]) VALUES (9, 1, 4, 1)
GO
INSERT [dbo].[SecPermissionTypeBranches] ([ID], [PermissionTypeId], [BranchId], [Selected]) VALUES (10, 3, 4, 1)
GO
INSERT [dbo].[SecPermissionTypeBranches] ([ID], [PermissionTypeId], [BranchId], [Selected]) VALUES (11, 4, 1, 1)
GO
INSERT [dbo].[SecPermissionTypeBranches] ([ID], [PermissionTypeId], [BranchId], [Selected]) VALUES (12, 5, 2, 1)
GO
INSERT [dbo].[SecPermissionTypeBranches] ([ID], [PermissionTypeId], [BranchId], [Selected]) VALUES (13, 6, 3, 1)
GO
INSERT [dbo].[SecPermissionTypeBranches] ([ID], [PermissionTypeId], [BranchId], [Selected]) VALUES (14, 7, 4, 1)
GO
INSERT [dbo].[SecPermissionTypeBranches] ([ID], [PermissionTypeId], [BranchId], [Selected]) VALUES (15, 8, 1, 1)
GO
INSERT [dbo].[SecPermissionTypeBranches] ([ID], [PermissionTypeId], [BranchId], [Selected]) VALUES (16, 9, 2, 1)
GO
INSERT [dbo].[SecPermissionTypeBranches] ([ID], [PermissionTypeId], [BranchId], [Selected]) VALUES (17, 10, 3, 1)
GO

SET IDENTITY_INSERT [dbo].[SecPermissionTypeBranches] OFF
--end____________________________ 
--begin____________________________

GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (449, 1, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (450, 1, 65, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (451, 1, 129, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (452, 1, 193, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (453, 1, 257, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (454, 1, 321, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (455, 1, 385, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (456, 1, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (457, 1, 66, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (458, 1, 130, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (459, 1, 194, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (460, 1, 258, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (461, 1, 322, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (462, 1, 386, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (463, 1, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (464, 1, 67, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (465, 1, 131, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (466, 1, 195, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (467, 1, 259, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (468, 1, 323, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (469, 1, 387, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (470, 1, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (471, 1, 68, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (472, 1, 132, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (473, 1, 196, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (474, 1, 260, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (475, 1, 324, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (476, 1, 388, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (477, 1, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (478, 1, 69, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (479, 1, 133, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (480, 1, 197, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (481, 1, 261, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (482, 1, 325, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (483, 1, 389, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (484, 1, 6, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (485, 1, 70, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (486, 1, 134, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (487, 1, 198, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (488, 1, 262, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (489, 1, 326, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (490, 1, 390, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (491, 1, 8, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (492, 1, 72, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (493, 1, 136, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (494, 1, 200, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (495, 1, 264, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (496, 1, 328, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (497, 1, 392, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (498, 1, 9, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (499, 1, 73, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (500, 1, 137, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (501, 1, 201, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (502, 1, 265, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (503, 1, 329, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (504, 1, 393, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (505, 1, 7, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (506, 1, 71, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (507, 1, 135, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (508, 1, 199, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (509, 1, 263, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (510, 1, 327, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (511, 1, 391, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (512, 1, 10, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (513, 1, 74, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (514, 1, 138, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (515, 1, 202, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (516, 1, 266, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (517, 1, 330, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (518, 1, 394, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (519, 1, 11, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (520, 1, 75, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (521, 1, 139, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (522, 1, 203, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (523, 1, 267, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (524, 1, 331, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (525, 1, 395, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (526, 1, 13, 0, NULL, N'0')
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (527, 1, 77, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (528, 1, 141, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (529, 1, 205, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (530, 1, 269, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (531, 1, 333, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (532, 1, 397, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (533, 1, 12, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (534, 1, 76, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (535, 1, 140, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (536, 1, 204, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (537, 1, 268, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (538, 1, 332, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (539, 1, 396, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (540, 1, 14, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (541, 1, 78, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (542, 1, 142, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (543, 1, 206, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (544, 1, 270, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (545, 1, 334, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (546, 1, 398, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (547, 1, 16, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (548, 1, 80, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (549, 1, 144, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (550, 1, 208, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (551, 1, 272, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (552, 1, 336, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (553, 1, 400, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (554, 1, 17, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (555, 1, 81, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (556, 1, 145, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (557, 1, 209, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (558, 1, 273, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (559, 1, 337, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (560, 1, 401, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (561, 1, 15, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (562, 1, 79, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (563, 1, 143, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (564, 1, 207, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (565, 1, 271, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (566, 1, 335, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (567, 1, 399, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (568, 1, 18, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (569, 1, 82, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (570, 1, 146, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (571, 1, 210, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (572, 1, 274, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (573, 1, 338, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (574, 1, 402, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (575, 1, 19, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (576, 1, 83, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (577, 1, 147, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (578, 1, 211, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (579, 1, 275, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (580, 1, 339, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (581, 1, 403, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (582, 1, 21, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (583, 1, 85, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (584, 1, 149, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (585, 1, 213, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (586, 1, 277, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (587, 1, 341, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (588, 1, 405, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (589, 1, 22, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (590, 1, 86, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (591, 1, 150, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (592, 1, 214, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (593, 1, 278, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (594, 1, 342, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (595, 1, 406, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (596, 1, 20, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (597, 1, 84, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (598, 1, 148, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (599, 1, 212, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (600, 1, 276, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (601, 1, 340, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (602, 1, 404, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (603, 1, 23, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (604, 1, 87, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (605, 1, 151, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (606, 1, 215, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (607, 1, 279, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (608, 1, 343, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (609, 1, 407, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (610, 1, 25, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (611, 1, 89, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (612, 1, 153, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (613, 1, 217, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (614, 1, 281, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (615, 1, 345, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (616, 1, 409, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (617, 1, 24, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (618, 1, 88, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (619, 1, 152, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (620, 1, 216, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (621, 1, 280, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (622, 1, 344, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (623, 1, 408, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (624, 1, 42, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (625, 1, 106, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (626, 1, 170, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (627, 1, 234, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (628, 1, 298, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (629, 1, 362, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (630, 1, 426, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (631, 1, 26, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (632, 1, 90, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (633, 1, 154, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (634, 1, 218, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (635, 1, 282, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (636, 1, 346, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (637, 1, 410, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (638, 1, 30, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (642, 1, 286, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (643, 1, 350, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (645, 1, 27, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (649, 1, 283, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (650, 1, 347, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (652, 1, 28, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (656, 1, 284, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (657, 1, 348, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (659, 1, 51, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (660, 1, 115, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (661, 1, 179, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (662, 1, 243, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (663, 1, 307, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (664, 1, 371, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (665, 1, 435, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (666, 1, 48, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (667, 1, 112, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (668, 1, 176, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (669, 1, 240, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (670, 1, 304, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (671, 1, 368, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (672, 1, 432, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (673, 1, 50, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (674, 1, 114, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (675, 1, 178, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (676, 1, 242, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (677, 1, 306, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (678, 1, 370, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (679, 1, 434, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (680, 1, 49, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (681, 1, 113, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (682, 1, 177, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (683, 1, 241, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (684, 1, 305, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (685, 1, 369, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (686, 1, 433, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (687, 1, 52, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (688, 1, 116, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (689, 1, 180, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (690, 1, 244, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (691, 1, 308, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (692, 1, 372, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (693, 1, 436, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (694, 1, 53, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (695, 1, 117, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (696, 1, 181, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (697, 1, 245, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (698, 1, 309, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (699, 1, 373, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (700, 1, 437, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (701, 1, 29, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (705, 1, 285, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (706, 1, 349, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (708, 1, 31, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (712, 1, 287, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (713, 1, 351, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (715, 1, 32, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (716, 1, 96, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (717, 1, 160, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (718, 1, 224, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (719, 1, 288, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (720, 1, 352, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (721, 1, 416, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (722, 1, 33, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (723, 1, 97, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (724, 1, 161, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (725, 1, 225, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (726, 1, 289, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (727, 1, 353, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (728, 1, 417, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (729, 1, 34, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (730, 1, 98, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (731, 1, 162, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (732, 1, 226, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (733, 1, 290, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (734, 1, 354, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (735, 1, 418, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (736, 1, 35, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (737, 1, 99, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (738, 1, 163, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (739, 1, 227, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (740, 1, 291, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (741, 1, 355, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (742, 1, 419, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (743, 1, 36, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (744, 1, 100, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (745, 1, 164, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (746, 1, 228, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (747, 1, 292, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (748, 1, 356, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (749, 1, 420, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (750, 1, 37, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (751, 1, 101, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (752, 1, 165, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (753, 1, 229, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (754, 1, 293, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (755, 1, 357, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (756, 1, 421, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (757, 1, 38, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (758, 1, 102, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (759, 1, 166, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (760, 1, 230, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (761, 1, 294, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (762, 1, 358, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (763, 1, 422, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (764, 1, 39, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (765, 1, 103, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (766, 1, 167, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (767, 1, 231, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (768, 1, 295, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (769, 1, 359, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (770, 1, 423, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (771, 1, 40, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (772, 1, 104, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (773, 1, 168, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (774, 1, 232, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (775, 1, 296, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (776, 1, 360, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (777, 1, 424, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (778, 1, 41, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (779, 1, 105, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (780, 1, 169, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (781, 1, 233, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (782, 1, 297, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (783, 1, 361, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (784, 1, 425, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (785, 1, 43, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (786, 1, 107, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (787, 1, 171, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (788, 1, 235, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (789, 1, 299, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (790, 1, 363, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (791, 1, 427, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (792, 1, 44, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (793, 1, 108, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (794, 1, 172, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (795, 1, 236, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (796, 1, 300, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (797, 1, 364, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (798, 1, 428, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (799, 1, 45, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (800, 1, 109, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (801, 1, 173, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (802, 1, 237, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (803, 1, 301, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (804, 1, 365, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (805, 1, 429, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (806, 1, 46, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (807, 1, 110, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (808, 1, 174, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (809, 1, 238, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (810, 1, 302, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (811, 1, 366, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (812, 1, 430, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (813, 1, 47, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (814, 1, 111, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (815, 1, 175, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (816, 1, 239, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (817, 1, 303, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (818, 1, 367, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (819, 1, 431, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (820, 1, 54, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (821, 1, 118, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (822, 1, 182, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (823, 1, 246, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (824, 1, 310, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (825, 1, 374, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (826, 1, 438, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (827, 1, 55, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (828, 1, 119, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (829, 1, 183, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (830, 1, 247, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (831, 1, 311, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (832, 1, 375, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (833, 1, 439, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (834, 1, 56, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (835, 1, 120, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (836, 1, 184, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (837, 1, 248, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (838, 1, 312, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (839, 1, 376, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (840, 1, 440, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (841, 1, 57, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (842, 1, 121, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (843, 1, 185, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (844, 1, 249, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (845, 1, 313, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (846, 1, 377, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (847, 1, 441, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (848, 1, 58, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (849, 1, 122, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (850, 1, 186, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (851, 1, 250, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (852, 1, 314, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (853, 1, 378, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (854, 1, 442, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (855, 1, 59, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (856, 1, 123, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (857, 1, 187, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (858, 1, 251, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (859, 1, 315, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (860, 1, 379, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (861, 1, 443, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (862, 1, 60, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (863, 1, 124, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (864, 1, 188, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (865, 1, 252, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (866, 1, 316, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (867, 1, 380, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (868, 1, 444, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (869, 1, 61, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (870, 1, 125, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (871, 1, 189, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (872, 1, 253, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (873, 1, 317, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (874, 1, 381, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (875, 1, 445, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (876, 1, 62, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (877, 1, 126, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (878, 1, 190, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (879, 1, 254, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (880, 1, 318, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (881, 1, 382, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (882, 1, 446, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (883, 1, 63, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (884, 1, 127, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (885, 1, 191, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (886, 1, 255, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (887, 1, 319, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (888, 1, 383, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (889, 1, 447, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (890, 1, 64, 0, NULL, N'0')
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (891, 1, 128, 0, NULL, N'0')
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (892, 1, 192, 0, NULL, N'0')
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (893, 1, 256, 0, NULL, N'0')
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (894, 1, 320, 0, NULL, N'0')
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (895, 1, 384, 0, NULL, N'0')
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (896, 1, 448, 0, NULL, N'0')
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (897, 1, 449, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (898, 1, 450, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (899, 1, 451, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (900, 1, 452, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (901, 1, 453, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (902, 1, 454, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (903, 1, 455, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (904, 1, 462, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (905, 1, 461, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (906, 1, 460, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (907, 1, 459, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (908, 1, 458, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (909, 1, 457, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (910, 1, 456, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (911, 1, 999, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (912, 1, 991, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (913, 1, 992, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (914, 1, 993, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1000, 2, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1001, 2, 65, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1002, 2, 129, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1003, 2, 193, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1004, 2, 257, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1005, 2, 321, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1006, 2, 385, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1007, 2, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1008, 2, 66, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1009, 2, 130, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1010, 2, 194, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1011, 2, 258, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1012, 2, 322, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1013, 2, 386, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1014, 2, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1015, 2, 67, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1016, 2, 131, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1017, 2, 195, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1018, 2, 259, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1019, 2, 323, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1020, 2, 387, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1021, 2, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1022, 2, 68, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1023, 2, 132, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1024, 2, 196, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1025, 2, 260, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1026, 2, 324, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1027, 2, 388, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1028, 2, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1029, 2, 69, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1030, 2, 133, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1031, 2, 197, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1032, 2, 261, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1033, 2, 325, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1034, 2, 389, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1035, 2, 6, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1036, 2, 70, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1037, 2, 134, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1038, 2, 198, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1039, 2, 262, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1040, 2, 326, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1041, 2, 390, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1042, 2, 8, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1043, 2, 72, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1044, 2, 136, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1045, 2, 200, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1046, 2, 264, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1047, 2, 328, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1048, 2, 392, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1049, 2, 9, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1050, 2, 73, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1051, 2, 137, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1052, 2, 201, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1053, 2, 265, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1054, 2, 329, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1055, 2, 393, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1056, 2, 7, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1057, 2, 71, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1058, 2, 135, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1059, 2, 199, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1060, 2, 263, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1061, 2, 327, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1062, 2, 391, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1063, 2, 10, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1064, 2, 74, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1065, 2, 138, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1066, 2, 202, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1067, 2, 266, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1068, 2, 330, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1069, 2, 394, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1070, 2, 11, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1071, 2, 75, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1072, 2, 139, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1073, 2, 203, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1074, 2, 267, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1075, 2, 331, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1076, 2, 395, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1077, 2, 13, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1078, 2, 77, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1079, 2, 141, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1080, 2, 205, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1081, 2, 269, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1082, 2, 333, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1083, 2, 397, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1084, 2, 12, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1085, 2, 76, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1086, 2, 140, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1087, 2, 204, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1088, 2, 268, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1089, 2, 332, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1090, 2, 396, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1091, 2, 14, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1092, 2, 78, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1093, 2, 142, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1094, 2, 206, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1095, 2, 270, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1096, 2, 334, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1097, 2, 398, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1098, 2, 16, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1099, 2, 80, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1100, 2, 144, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1101, 2, 208, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1102, 2, 272, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1103, 2, 336, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1104, 2, 400, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1105, 2, 17, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1106, 2, 81, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1107, 2, 145, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1108, 2, 209, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1109, 2, 273, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1110, 2, 337, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1111, 2, 401, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1112, 2, 15, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1113, 2, 79, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1114, 2, 143, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1115, 2, 207, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1116, 2, 271, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1117, 2, 335, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1118, 2, 399, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1119, 2, 18, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1120, 2, 82, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1121, 2, 146, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1122, 2, 210, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1123, 2, 274, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1124, 2, 338, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1125, 2, 402, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1126, 2, 19, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1127, 2, 83, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1128, 2, 147, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1129, 2, 211, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1130, 2, 275, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1131, 2, 339, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1132, 2, 403, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1133, 2, 21, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1134, 2, 85, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1135, 2, 149, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1136, 2, 213, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1137, 2, 277, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1138, 2, 341, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1139, 2, 405, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1140, 2, 22, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1141, 2, 86, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1142, 2, 150, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1143, 2, 214, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1144, 2, 278, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1145, 2, 342, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1146, 2, 406, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1147, 2, 20, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1148, 2, 84, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1149, 2, 148, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1150, 2, 212, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1151, 2, 276, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1152, 2, 340, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1153, 2, 404, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1154, 2, 23, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1155, 2, 87, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1156, 2, 151, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1157, 2, 215, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1158, 2, 279, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1159, 2, 343, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1160, 2, 407, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1161, 2, 25, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1162, 2, 89, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1163, 2, 153, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1164, 2, 217, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1165, 2, 281, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1166, 2, 345, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1167, 2, 409, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1168, 2, 24, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1169, 2, 88, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1170, 2, 152, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1171, 2, 216, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1172, 2, 280, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1173, 2, 344, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1174, 2, 408, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1175, 2, 42, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1176, 2, 106, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1177, 2, 170, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1178, 2, 234, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1179, 2, 298, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1180, 2, 362, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1181, 2, 426, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1182, 2, 26, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1183, 2, 90, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1184, 2, 154, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1185, 2, 218, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1186, 2, 282, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1187, 2, 346, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1188, 2, 410, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1189, 2, 30, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1190, 2, 286, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1191, 2, 350, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1192, 2, 27, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1193, 2, 283, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1194, 2, 347, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1195, 2, 28, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1196, 2, 284, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1197, 2, 348, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1198, 2, 51, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1199, 2, 115, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1200, 2, 179, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1201, 2, 243, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1202, 2, 307, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1203, 2, 371, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1204, 2, 435, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1205, 2, 48, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1206, 2, 112, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1207, 2, 176, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1208, 2, 240, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1209, 2, 304, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1210, 2, 368, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1211, 2, 432, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1212, 2, 50, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1213, 2, 114, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1214, 2, 178, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1215, 2, 242, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1216, 2, 306, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1217, 2, 370, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1218, 2, 434, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1219, 2, 49, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1220, 2, 113, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1221, 2, 177, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1222, 2, 241, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1223, 2, 305, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1224, 2, 369, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1225, 2, 433, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1226, 2, 52, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1227, 2, 116, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1228, 2, 180, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1229, 2, 244, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1230, 2, 308, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1231, 2, 372, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1232, 2, 436, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1233, 2, 53, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1234, 2, 117, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1235, 2, 181, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1236, 2, 245, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1237, 2, 309, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1238, 2, 373, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1239, 2, 437, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1240, 2, 29, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1241, 2, 285, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1242, 2, 349, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1243, 2, 31, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1244, 2, 287, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1245, 2, 351, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1246, 2, 32, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1247, 2, 96, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1248, 2, 160, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1249, 2, 224, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1250, 2, 288, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1251, 2, 352, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1252, 2, 416, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1253, 2, 33, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1254, 2, 97, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1255, 2, 161, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1256, 2, 225, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1257, 2, 289, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1258, 2, 353, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1259, 2, 417, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1260, 2, 34, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1261, 2, 98, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1262, 2, 162, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1263, 2, 226, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1264, 2, 290, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1265, 2, 354, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1266, 2, 418, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1267, 2, 35, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1268, 2, 99, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1269, 2, 163, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1270, 2, 227, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1271, 2, 291, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1272, 2, 355, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1273, 2, 419, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1274, 2, 36, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1275, 2, 100, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1276, 2, 164, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1277, 2, 228, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1278, 2, 292, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1279, 2, 356, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1280, 2, 420, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1281, 2, 37, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1282, 2, 101, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1283, 2, 165, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1284, 2, 229, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1285, 2, 293, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1286, 2, 357, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1287, 2, 421, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1288, 2, 38, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1289, 2, 102, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1290, 2, 166, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1291, 2, 230, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1292, 2, 294, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1293, 2, 358, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1294, 2, 422, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1295, 2, 39, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1296, 2, 103, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1297, 2, 167, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1298, 2, 231, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1299, 2, 295, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1300, 2, 359, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1301, 2, 423, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1302, 2, 40, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1303, 2, 104, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1304, 2, 168, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1305, 2, 232, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1306, 2, 296, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1307, 2, 360, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1308, 2, 424, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1309, 2, 41, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1310, 2, 105, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1311, 2, 169, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1312, 2, 233, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1313, 2, 297, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1314, 2, 361, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1315, 2, 425, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1316, 2, 43, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1317, 2, 107, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1318, 2, 171, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1319, 2, 235, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1320, 2, 299, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1321, 2, 363, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1322, 2, 427, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1323, 2, 44, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1324, 2, 108, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1325, 2, 172, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1326, 2, 236, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1327, 2, 300, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1328, 2, 364, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1329, 2, 428, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1330, 2, 45, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1331, 2, 109, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1332, 2, 173, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1333, 2, 237, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1334, 2, 301, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1335, 2, 365, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1336, 2, 429, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1337, 2, 46, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1338, 2, 110, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1339, 2, 174, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1340, 2, 238, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1341, 2, 302, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1342, 2, 366, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1343, 2, 430, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1344, 2, 47, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1345, 2, 111, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1346, 2, 175, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1347, 2, 239, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1348, 2, 303, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1349, 2, 367, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1350, 2, 431, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1351, 2, 54, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1352, 2, 118, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1353, 2, 182, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1354, 2, 246, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1355, 2, 310, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1356, 2, 374, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1357, 2, 438, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1358, 2, 55, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1359, 2, 119, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1360, 2, 183, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1361, 2, 247, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1362, 2, 311, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1363, 2, 375, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1364, 2, 439, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1365, 2, 56, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1366, 2, 120, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1367, 2, 184, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1368, 2, 248, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1369, 2, 312, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1370, 2, 376, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1371, 2, 440, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1372, 2, 57, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1373, 2, 121, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1374, 2, 185, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1375, 2, 249, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1376, 2, 313, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1377, 2, 377, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1378, 2, 441, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1379, 2, 58, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1380, 2, 122, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1381, 2, 186, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1382, 2, 250, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1383, 2, 314, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1384, 2, 378, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1385, 2, 442, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1386, 2, 59, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1387, 2, 123, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1388, 2, 187, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1389, 2, 251, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1390, 2, 315, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1391, 2, 379, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1392, 2, 443, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1393, 2, 60, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1394, 2, 124, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1395, 2, 188, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1396, 2, 252, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1397, 2, 316, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1398, 2, 380, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1399, 2, 444, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1400, 2, 61, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1401, 2, 125, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1402, 2, 189, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1403, 2, 253, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1404, 2, 317, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1405, 2, 381, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1406, 2, 445, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1407, 2, 62, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1408, 2, 126, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1409, 2, 190, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1410, 2, 254, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1411, 2, 318, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1412, 2, 382, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1413, 2, 446, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1414, 2, 63, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1415, 2, 127, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1416, 2, 191, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1417, 2, 255, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1418, 2, 319, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1419, 2, 383, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1420, 2, 447, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1421, 2, 64, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1422, 2, 128, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1423, 2, 192, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1424, 2, 256, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1425, 2, 320, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1426, 2, 384, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1427, 2, 448, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1428, 2, 449, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1429, 2, 450, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1430, 2, 451, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1431, 2, 452, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1432, 2, 453, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1433, 2, 454, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1434, 2, 455, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1435, 2, 462, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1436, 2, 461, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1437, 2, 460, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1438, 2, 459, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1439, 2, 458, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1440, 2, 457, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1441, 2, 456, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1442, 2, 999, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1443, 2, 991, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1444, 2, 992, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1445, 2, 993, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1446, 3, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1447, 3, 65, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1448, 3, 129, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1449, 3, 193, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1450, 3, 257, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1451, 3, 321, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1452, 3, 385, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1453, 3, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1454, 3, 66, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1455, 3, 130, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1456, 3, 194, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1457, 3, 258, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1458, 3, 322, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1459, 3, 386, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1460, 3, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1461, 3, 67, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1462, 3, 131, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1463, 3, 195, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1464, 3, 259, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1465, 3, 323, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1466, 3, 387, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1467, 3, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1468, 3, 68, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1469, 3, 132, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1470, 3, 196, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1471, 3, 260, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1472, 3, 324, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1473, 3, 388, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1474, 3, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1475, 3, 69, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1476, 3, 133, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1477, 3, 197, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1478, 3, 261, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1479, 3, 325, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1480, 3, 389, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1481, 3, 6, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1482, 3, 70, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1483, 3, 134, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1484, 3, 198, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1485, 3, 262, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1486, 3, 326, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1487, 3, 390, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1488, 3, 8, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1489, 3, 72, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1490, 3, 136, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1491, 3, 200, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1492, 3, 264, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1493, 3, 328, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1494, 3, 392, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1495, 3, 9, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1496, 3, 73, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1497, 3, 137, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1498, 3, 201, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1499, 3, 265, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1500, 3, 329, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1501, 3, 393, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1502, 3, 7, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1503, 3, 71, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1504, 3, 135, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1505, 3, 199, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1506, 3, 263, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1507, 3, 327, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1508, 3, 391, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1509, 3, 10, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1510, 3, 74, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1511, 3, 138, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1512, 3, 202, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1513, 3, 266, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1514, 3, 330, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1515, 3, 394, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1516, 3, 11, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1517, 3, 75, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1518, 3, 139, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1519, 3, 203, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1520, 3, 267, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1521, 3, 331, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1522, 3, 395, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1523, 3, 13, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1524, 3, 77, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1525, 3, 141, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1526, 3, 205, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1527, 3, 269, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1528, 3, 333, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1529, 3, 397, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1530, 3, 12, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1531, 3, 76, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1532, 3, 140, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1533, 3, 204, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1534, 3, 268, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1535, 3, 332, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1536, 3, 396, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1537, 3, 14, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1538, 3, 78, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1539, 3, 142, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1540, 3, 206, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1541, 3, 270, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1542, 3, 334, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1543, 3, 398, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1544, 3, 16, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1545, 3, 80, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1546, 3, 144, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1547, 3, 208, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1548, 3, 272, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1549, 3, 336, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1550, 3, 400, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1551, 3, 17, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1552, 3, 81, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1553, 3, 145, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1554, 3, 209, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1555, 3, 273, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1556, 3, 337, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1557, 3, 401, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1558, 3, 15, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1559, 3, 79, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1560, 3, 143, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1561, 3, 207, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1562, 3, 271, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1563, 3, 335, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1564, 3, 399, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1565, 3, 18, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1566, 3, 82, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1567, 3, 146, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1568, 3, 210, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1569, 3, 274, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1570, 3, 338, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1571, 3, 402, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1572, 3, 19, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1573, 3, 83, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1574, 3, 147, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1575, 3, 211, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1576, 3, 275, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1577, 3, 339, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1578, 3, 403, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1579, 3, 21, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1580, 3, 85, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1581, 3, 149, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1582, 3, 213, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1583, 3, 277, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1584, 3, 341, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1585, 3, 405, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1586, 3, 22, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1587, 3, 86, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1588, 3, 150, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1589, 3, 214, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1590, 3, 278, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1591, 3, 342, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1592, 3, 406, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1593, 3, 20, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1594, 3, 84, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1595, 3, 148, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1596, 3, 212, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1597, 3, 276, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1598, 3, 340, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1599, 3, 404, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1600, 3, 23, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1601, 3, 87, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1602, 3, 151, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1603, 3, 215, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1604, 3, 279, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1605, 3, 343, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1606, 3, 407, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1607, 3, 25, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1608, 3, 89, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1609, 3, 153, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1610, 3, 217, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1611, 3, 281, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1612, 3, 345, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1613, 3, 409, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1614, 3, 24, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1615, 3, 88, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1616, 3, 152, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1617, 3, 216, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1618, 3, 280, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1619, 3, 344, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1620, 3, 408, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1621, 3, 42, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1622, 3, 106, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1623, 3, 170, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1624, 3, 234, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1625, 3, 298, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1626, 3, 362, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1627, 3, 426, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1628, 3, 26, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1629, 3, 90, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1630, 3, 154, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1631, 3, 218, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1632, 3, 282, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1633, 3, 346, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1634, 3, 410, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1635, 3, 30, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1636, 3, 286, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1637, 3, 350, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1638, 3, 27, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1639, 3, 283, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1640, 3, 347, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1641, 3, 28, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1642, 3, 284, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1643, 3, 348, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1644, 3, 51, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1645, 3, 115, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1646, 3, 179, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1647, 3, 243, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1648, 3, 307, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1649, 3, 371, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1650, 3, 435, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1651, 3, 48, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1652, 3, 112, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1653, 3, 176, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1654, 3, 240, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1655, 3, 304, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1656, 3, 368, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1657, 3, 432, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1658, 3, 50, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1659, 3, 114, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1660, 3, 178, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1661, 3, 242, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1662, 3, 306, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1663, 3, 370, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1664, 3, 434, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1665, 3, 49, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1666, 3, 113, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1667, 3, 177, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1668, 3, 241, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1669, 3, 305, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1670, 3, 369, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1671, 3, 433, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1672, 3, 52, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1673, 3, 116, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1674, 3, 180, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1675, 3, 244, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1676, 3, 308, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1677, 3, 372, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1678, 3, 436, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1679, 3, 53, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1680, 3, 117, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1681, 3, 181, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1682, 3, 245, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1683, 3, 309, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1684, 3, 373, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1685, 3, 437, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1686, 3, 29, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1687, 3, 285, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1688, 3, 349, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1689, 3, 31, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1690, 3, 287, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1691, 3, 351, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1692, 3, 32, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1693, 3, 96, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1694, 3, 160, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1695, 3, 224, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1696, 3, 288, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1697, 3, 352, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1698, 3, 416, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1699, 3, 33, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1700, 3, 97, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1701, 3, 161, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1702, 3, 225, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1703, 3, 289, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1704, 3, 353, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1705, 3, 417, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1706, 3, 34, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1707, 3, 98, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1708, 3, 162, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1709, 3, 226, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1710, 3, 290, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1711, 3, 354, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1712, 3, 418, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1713, 3, 35, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1714, 3, 99, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1715, 3, 163, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1716, 3, 227, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1717, 3, 291, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1718, 3, 355, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1719, 3, 419, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1720, 3, 36, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1721, 3, 100, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1722, 3, 164, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1723, 3, 228, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1724, 3, 292, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1725, 3, 356, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1726, 3, 420, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1727, 3, 37, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1728, 3, 101, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1729, 3, 165, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1730, 3, 229, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1731, 3, 293, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1732, 3, 357, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1733, 3, 421, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1734, 3, 38, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1735, 3, 102, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1736, 3, 166, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1737, 3, 230, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1738, 3, 294, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1739, 3, 358, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1740, 3, 422, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1741, 3, 39, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1742, 3, 103, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1743, 3, 167, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1744, 3, 231, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1745, 3, 295, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1746, 3, 359, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1747, 3, 423, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1748, 3, 40, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1749, 3, 104, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1750, 3, 168, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1751, 3, 232, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1752, 3, 296, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1753, 3, 360, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1754, 3, 424, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1755, 3, 41, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1756, 3, 105, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1757, 3, 169, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1758, 3, 233, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1759, 3, 297, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1760, 3, 361, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1761, 3, 425, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1762, 3, 43, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1763, 3, 107, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1764, 3, 171, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1765, 3, 235, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1766, 3, 299, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1767, 3, 363, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1768, 3, 427, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1769, 3, 44, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1770, 3, 108, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1771, 3, 172, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1772, 3, 236, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1773, 3, 300, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1774, 3, 364, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1775, 3, 428, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1776, 3, 45, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1777, 3, 109, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1778, 3, 173, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1779, 3, 237, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1780, 3, 301, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1781, 3, 365, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1782, 3, 429, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1783, 3, 46, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1784, 3, 110, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1785, 3, 174, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1786, 3, 238, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1787, 3, 302, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1788, 3, 366, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1789, 3, 430, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1790, 3, 47, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1791, 3, 111, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1792, 3, 175, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1793, 3, 239, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1794, 3, 303, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1795, 3, 367, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1796, 3, 431, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1797, 3, 54, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1798, 3, 118, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1799, 3, 182, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1800, 3, 246, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1801, 3, 310, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1802, 3, 374, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1803, 3, 438, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1804, 3, 55, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1805, 3, 119, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1806, 3, 183, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1807, 3, 247, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1808, 3, 311, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1809, 3, 375, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1810, 3, 439, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1811, 3, 56, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1812, 3, 120, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1813, 3, 184, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1814, 3, 248, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1815, 3, 312, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1816, 3, 376, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1817, 3, 440, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1818, 3, 57, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1819, 3, 121, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1820, 3, 185, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1821, 3, 249, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1822, 3, 313, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1823, 3, 377, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1824, 3, 441, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1825, 3, 58, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1826, 3, 122, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1827, 3, 186, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1828, 3, 250, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1829, 3, 314, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1830, 3, 378, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1831, 3, 442, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1832, 3, 59, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1833, 3, 123, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1834, 3, 187, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1835, 3, 251, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1836, 3, 315, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1837, 3, 379, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1838, 3, 443, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1839, 3, 60, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1840, 3, 124, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1841, 3, 188, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1842, 3, 252, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1843, 3, 316, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1844, 3, 380, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1845, 3, 444, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1846, 3, 61, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1847, 3, 125, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1848, 3, 189, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1849, 3, 253, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1850, 3, 317, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1851, 3, 381, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1852, 3, 445, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1853, 3, 62, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1854, 3, 126, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1855, 3, 190, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1856, 3, 254, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1857, 3, 318, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1858, 3, 382, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1859, 3, 446, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1860, 3, 63, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1861, 3, 127, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1862, 3, 191, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1863, 3, 255, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1864, 3, 319, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1865, 3, 383, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1866, 3, 447, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1867, 3, 64, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1868, 3, 128, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1869, 3, 192, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1870, 3, 256, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1871, 3, 320, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1872, 3, 384, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1873, 3, 448, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1874, 3, 449, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1875, 3, 450, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1876, 3, 451, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1877, 3, 452, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1878, 3, 453, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1879, 3, 454, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1880, 3, 455, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1881, 3, 462, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1882, 3, 461, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1883, 3, 460, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1884, 3, 459, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1885, 3, 458, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1886, 3, 457, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1887, 3, 456, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1888, 3, 999, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1889, 3, 991, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1890, 3, 992, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1891, 3, 993, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1892, 4, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1893, 4, 65, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1894, 4, 129, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1895, 4, 193, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1896, 4, 257, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1897, 4, 321, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1898, 4, 385, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1899, 4, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1900, 4, 66, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1901, 4, 130, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1902, 4, 194, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1903, 4, 258, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1904, 4, 322, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1905, 4, 386, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1906, 4, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1907, 4, 67, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1908, 4, 131, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1909, 4, 195, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1910, 4, 259, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1911, 4, 323, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1912, 4, 387, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1913, 4, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1914, 4, 68, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1915, 4, 132, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1916, 4, 196, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1917, 4, 260, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1918, 4, 324, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1919, 4, 388, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1920, 4, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1921, 4, 69, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1922, 4, 133, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1923, 4, 197, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1924, 4, 261, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1925, 4, 325, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1926, 4, 389, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1927, 4, 6, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1928, 4, 70, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1929, 4, 134, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1930, 4, 198, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1931, 4, 262, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1932, 4, 326, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1933, 4, 390, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1934, 4, 8, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1935, 4, 72, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1936, 4, 136, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1937, 4, 200, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1938, 4, 264, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1939, 4, 328, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1940, 4, 392, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1941, 4, 9, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1942, 4, 73, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1943, 4, 137, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1944, 4, 201, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1945, 4, 265, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1946, 4, 329, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1947, 4, 393, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1948, 4, 7, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1949, 4, 71, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1950, 4, 135, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1951, 4, 199, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1952, 4, 263, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1953, 4, 327, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1954, 4, 391, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1955, 4, 10, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1956, 4, 74, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1957, 4, 138, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1958, 4, 202, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1959, 4, 266, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1960, 4, 330, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1961, 4, 394, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1962, 4, 11, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1963, 4, 75, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1964, 4, 139, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1965, 4, 203, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1966, 4, 267, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1967, 4, 331, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1968, 4, 395, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1969, 4, 13, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1970, 4, 77, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1971, 4, 141, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1972, 4, 205, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1973, 4, 269, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1974, 4, 333, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1975, 4, 397, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1976, 4, 12, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1977, 4, 76, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1978, 4, 140, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1979, 4, 204, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1980, 4, 268, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1981, 4, 332, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1982, 4, 396, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1983, 4, 14, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1984, 4, 78, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1985, 4, 142, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1986, 4, 206, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1987, 4, 270, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1988, 4, 334, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1989, 4, 398, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1990, 4, 16, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1991, 4, 80, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1992, 4, 144, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1993, 4, 208, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1994, 4, 272, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1995, 4, 336, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1996, 4, 400, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1997, 4, 17, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1998, 4, 81, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (1999, 4, 145, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2000, 4, 209, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2001, 4, 273, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2002, 4, 337, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2003, 4, 401, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2004, 4, 15, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2005, 4, 79, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2006, 4, 143, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2007, 4, 207, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2008, 4, 271, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2009, 4, 335, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2010, 4, 399, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2011, 4, 18, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2012, 4, 82, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2013, 4, 146, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2014, 4, 210, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2015, 4, 274, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2016, 4, 338, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2017, 4, 402, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2018, 4, 19, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2019, 4, 83, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2020, 4, 147, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2021, 4, 211, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2022, 4, 275, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2023, 4, 339, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2024, 4, 403, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2025, 4, 21, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2026, 4, 85, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2027, 4, 149, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2028, 4, 213, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2029, 4, 277, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2030, 4, 341, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2031, 4, 405, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2032, 4, 22, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2033, 4, 86, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2034, 4, 150, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2035, 4, 214, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2036, 4, 278, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2037, 4, 342, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2038, 4, 406, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2039, 4, 20, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2040, 4, 84, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2041, 4, 148, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2042, 4, 212, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2043, 4, 276, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2044, 4, 340, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2045, 4, 404, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2046, 4, 23, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2047, 4, 87, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2048, 4, 151, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2049, 4, 215, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2050, 4, 279, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2051, 4, 343, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2052, 4, 407, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2053, 4, 25, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2054, 4, 89, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2055, 4, 153, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2056, 4, 217, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2057, 4, 281, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2058, 4, 345, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2059, 4, 409, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2060, 4, 24, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2061, 4, 88, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2062, 4, 152, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2063, 4, 216, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2064, 4, 280, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2065, 4, 344, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2066, 4, 408, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2067, 4, 42, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2068, 4, 106, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2069, 4, 170, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2070, 4, 234, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2071, 4, 298, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2072, 4, 362, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2073, 4, 426, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2074, 4, 26, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2075, 4, 90, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2076, 4, 154, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2077, 4, 218, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2078, 4, 282, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2079, 4, 346, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2080, 4, 410, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2081, 4, 30, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2082, 4, 286, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2083, 4, 350, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2084, 4, 27, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2085, 4, 283, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2086, 4, 347, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2087, 4, 28, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2088, 4, 284, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2089, 4, 348, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2090, 4, 51, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2091, 4, 115, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2092, 4, 179, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2093, 4, 243, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2094, 4, 307, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2095, 4, 371, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2096, 4, 435, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2097, 4, 48, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2098, 4, 112, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2099, 4, 176, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2100, 4, 240, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2101, 4, 304, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2102, 4, 368, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2103, 4, 432, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2104, 4, 50, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2105, 4, 114, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2106, 4, 178, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2107, 4, 242, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2108, 4, 306, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2109, 4, 370, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2110, 4, 434, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2111, 4, 49, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2112, 4, 113, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2113, 4, 177, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2114, 4, 241, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2115, 4, 305, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2116, 4, 369, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2117, 4, 433, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2118, 4, 52, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2119, 4, 116, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2120, 4, 180, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2121, 4, 244, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2122, 4, 308, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2123, 4, 372, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2124, 4, 436, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2125, 4, 53, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2126, 4, 117, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2127, 4, 181, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2128, 4, 245, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2129, 4, 309, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2130, 4, 373, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2131, 4, 437, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2132, 4, 29, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2133, 4, 285, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2134, 4, 349, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2135, 4, 31, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2136, 4, 287, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2137, 4, 351, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2138, 4, 32, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2139, 4, 96, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2140, 4, 160, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2141, 4, 224, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2142, 4, 288, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2143, 4, 352, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2144, 4, 416, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2145, 4, 33, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2146, 4, 97, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2147, 4, 161, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2148, 4, 225, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2149, 4, 289, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2150, 4, 353, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2151, 4, 417, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2152, 4, 34, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2153, 4, 98, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2154, 4, 162, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2155, 4, 226, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2156, 4, 290, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2157, 4, 354, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2158, 4, 418, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2159, 4, 35, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2160, 4, 99, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2161, 4, 163, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2162, 4, 227, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2163, 4, 291, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2164, 4, 355, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2165, 4, 419, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2166, 4, 36, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2167, 4, 100, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2168, 4, 164, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2169, 4, 228, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2170, 4, 292, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2171, 4, 356, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2172, 4, 420, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2173, 4, 37, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2174, 4, 101, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2175, 4, 165, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2176, 4, 229, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2177, 4, 293, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2178, 4, 357, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2179, 4, 421, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2180, 4, 38, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2181, 4, 102, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2182, 4, 166, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2183, 4, 230, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2184, 4, 294, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2185, 4, 358, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2186, 4, 422, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2187, 4, 39, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2188, 4, 103, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2189, 4, 167, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2190, 4, 231, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2191, 4, 295, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2192, 4, 359, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2193, 4, 423, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2194, 4, 40, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2195, 4, 104, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2196, 4, 168, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2197, 4, 232, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2198, 4, 296, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2199, 4, 360, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2200, 4, 424, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2201, 4, 41, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2202, 4, 105, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2203, 4, 169, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2204, 4, 233, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2205, 4, 297, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2206, 4, 361, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2207, 4, 425, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2208, 4, 43, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2209, 4, 107, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2210, 4, 171, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2211, 4, 235, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2212, 4, 299, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2213, 4, 363, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2214, 4, 427, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2215, 4, 44, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2216, 4, 108, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2217, 4, 172, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2218, 4, 236, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2219, 4, 300, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2220, 4, 364, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2221, 4, 428, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2222, 4, 45, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2223, 4, 109, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2224, 4, 173, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2225, 4, 237, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2226, 4, 301, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2227, 4, 365, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2228, 4, 429, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2229, 4, 46, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2230, 4, 110, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2231, 4, 174, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2232, 4, 238, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2233, 4, 302, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2234, 4, 366, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2235, 4, 430, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2236, 4, 47, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2237, 4, 111, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2238, 4, 175, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2239, 4, 239, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2240, 4, 303, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2241, 4, 367, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2242, 4, 431, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2243, 4, 54, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2244, 4, 118, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2245, 4, 182, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2246, 4, 246, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2247, 4, 310, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2248, 4, 374, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2249, 4, 438, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2250, 4, 55, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2251, 4, 119, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2252, 4, 183, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2253, 4, 247, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2254, 4, 311, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2255, 4, 375, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2256, 4, 439, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2257, 4, 56, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2258, 4, 120, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2259, 4, 184, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2260, 4, 248, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2261, 4, 312, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2262, 4, 376, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2263, 4, 440, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2264, 4, 57, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2265, 4, 121, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2266, 4, 185, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2267, 4, 249, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2268, 4, 313, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2269, 4, 377, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2270, 4, 441, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2271, 4, 58, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2272, 4, 122, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2273, 4, 186, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2274, 4, 250, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2275, 4, 314, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2276, 4, 378, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2277, 4, 442, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2278, 4, 59, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2279, 4, 123, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2280, 4, 187, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2281, 4, 251, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2282, 4, 315, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2283, 4, 379, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2284, 4, 443, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2285, 4, 60, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2286, 4, 124, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2287, 4, 188, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2288, 4, 252, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2289, 4, 316, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2290, 4, 380, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2291, 4, 444, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2292, 4, 61, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2293, 4, 125, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2294, 4, 189, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2295, 4, 253, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2296, 4, 317, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2297, 4, 381, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2298, 4, 445, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2299, 4, 62, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2300, 4, 126, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2301, 4, 190, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2302, 4, 254, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2303, 4, 318, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2304, 4, 382, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2305, 4, 446, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2306, 4, 63, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2307, 4, 127, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2308, 4, 191, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2309, 4, 255, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2310, 4, 319, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2311, 4, 383, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2312, 4, 447, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2313, 4, 64, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2314, 4, 128, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2315, 4, 192, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2316, 4, 256, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2317, 4, 320, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2318, 4, 384, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2319, 4, 448, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2320, 4, 449, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2321, 4, 450, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2322, 4, 451, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2323, 4, 452, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2324, 4, 453, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2325, 4, 454, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2326, 4, 455, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2327, 4, 462, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2328, 4, 461, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2329, 4, 460, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2330, 4, 459, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2331, 4, 458, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2332, 4, 457, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2333, 4, 456, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2334, 4, 999, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2335, 4, 991, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2336, 4, 992, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2337, 4, 993, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2338, 5, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2339, 5, 65, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2340, 5, 129, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2341, 5, 193, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2342, 5, 257, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2343, 5, 321, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2344, 5, 385, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2345, 5, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2346, 5, 66, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2347, 5, 130, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2348, 5, 194, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2349, 5, 258, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2350, 5, 322, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2351, 5, 386, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2352, 5, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2353, 5, 67, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2354, 5, 131, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2355, 5, 195, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2356, 5, 259, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2357, 5, 323, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2358, 5, 387, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2359, 5, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2360, 5, 68, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2361, 5, 132, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2362, 5, 196, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2363, 5, 260, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2364, 5, 324, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2365, 5, 388, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2366, 5, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2367, 5, 69, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2368, 5, 133, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2369, 5, 197, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2370, 5, 261, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2371, 5, 325, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2372, 5, 389, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2373, 5, 6, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2374, 5, 70, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2375, 5, 134, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2376, 5, 198, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2377, 5, 262, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2378, 5, 326, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2379, 5, 390, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2380, 5, 8, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2381, 5, 72, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2382, 5, 136, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2383, 5, 200, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2384, 5, 264, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2385, 5, 328, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2386, 5, 392, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2387, 5, 9, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2388, 5, 73, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2389, 5, 137, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2390, 5, 201, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2391, 5, 265, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2392, 5, 329, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2393, 5, 393, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2394, 5, 7, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2395, 5, 71, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2396, 5, 135, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2397, 5, 199, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2398, 5, 263, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2399, 5, 327, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2400, 5, 391, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2401, 5, 10, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2402, 5, 74, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2403, 5, 138, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2404, 5, 202, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2405, 5, 266, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2406, 5, 330, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2407, 5, 394, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2408, 5, 11, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2409, 5, 75, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2410, 5, 139, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2411, 5, 203, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2412, 5, 267, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2413, 5, 331, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2414, 5, 395, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2415, 5, 13, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2416, 5, 77, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2417, 5, 141, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2418, 5, 205, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2419, 5, 269, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2420, 5, 333, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2421, 5, 397, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2422, 5, 12, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2423, 5, 76, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2424, 5, 140, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2425, 5, 204, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2426, 5, 268, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2427, 5, 332, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2428, 5, 396, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2429, 5, 14, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2430, 5, 78, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2431, 5, 142, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2432, 5, 206, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2433, 5, 270, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2434, 5, 334, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2435, 5, 398, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2436, 5, 16, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2437, 5, 80, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2438, 5, 144, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2439, 5, 208, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2440, 5, 272, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2441, 5, 336, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2442, 5, 400, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2443, 5, 17, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2444, 5, 81, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2445, 5, 145, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2446, 5, 209, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2447, 5, 273, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2448, 5, 337, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2449, 5, 401, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2450, 5, 15, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2451, 5, 79, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2452, 5, 143, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2453, 5, 207, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2454, 5, 271, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2455, 5, 335, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2456, 5, 399, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2457, 5, 18, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2458, 5, 82, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2459, 5, 146, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2460, 5, 210, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2461, 5, 274, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2462, 5, 338, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2463, 5, 402, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2464, 5, 19, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2465, 5, 83, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2466, 5, 147, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2467, 5, 211, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2468, 5, 275, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2469, 5, 339, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2470, 5, 403, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2471, 5, 21, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2472, 5, 85, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2473, 5, 149, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2474, 5, 213, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2475, 5, 277, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2476, 5, 341, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2477, 5, 405, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2478, 5, 22, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2479, 5, 86, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2480, 5, 150, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2481, 5, 214, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2482, 5, 278, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2483, 5, 342, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2484, 5, 406, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2485, 5, 20, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2486, 5, 84, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2487, 5, 148, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2488, 5, 212, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2489, 5, 276, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2490, 5, 340, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2491, 5, 404, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2492, 5, 23, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2493, 5, 87, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2494, 5, 151, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2495, 5, 215, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2496, 5, 279, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2497, 5, 343, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2498, 5, 407, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2499, 5, 25, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2500, 5, 89, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2501, 5, 153, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2502, 5, 217, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2503, 5, 281, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2504, 5, 345, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2505, 5, 409, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2506, 5, 24, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2507, 5, 88, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2508, 5, 152, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2509, 5, 216, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2510, 5, 280, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2511, 5, 344, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2512, 5, 408, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2513, 5, 42, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2514, 5, 106, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2515, 5, 170, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2516, 5, 234, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2517, 5, 298, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2518, 5, 362, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2519, 5, 426, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2520, 5, 26, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2521, 5, 90, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2522, 5, 154, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2523, 5, 218, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2524, 5, 282, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2525, 5, 346, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2526, 5, 410, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2527, 5, 30, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2528, 5, 286, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2529, 5, 350, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2530, 5, 27, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2531, 5, 283, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2532, 5, 347, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2533, 5, 28, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2534, 5, 284, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2535, 5, 348, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2536, 5, 51, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2537, 5, 115, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2538, 5, 179, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2539, 5, 243, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2540, 5, 307, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2541, 5, 371, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2542, 5, 435, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2543, 5, 48, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2544, 5, 112, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2545, 5, 176, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2546, 5, 240, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2547, 5, 304, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2548, 5, 368, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2549, 5, 432, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2550, 5, 50, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2551, 5, 114, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2552, 5, 178, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2553, 5, 242, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2554, 5, 306, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2555, 5, 370, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2556, 5, 434, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2557, 5, 49, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2558, 5, 113, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2559, 5, 177, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2560, 5, 241, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2561, 5, 305, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2562, 5, 369, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2563, 5, 433, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2564, 5, 52, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2565, 5, 116, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2566, 5, 180, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2567, 5, 244, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2568, 5, 308, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2569, 5, 372, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2570, 5, 436, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2571, 5, 53, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2572, 5, 117, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2573, 5, 181, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2574, 5, 245, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2575, 5, 309, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2576, 5, 373, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2577, 5, 437, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2578, 5, 29, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2579, 5, 285, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2580, 5, 349, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2581, 5, 31, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2582, 5, 287, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2583, 5, 351, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2584, 5, 32, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2585, 5, 96, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2586, 5, 160, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2587, 5, 224, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2588, 5, 288, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2589, 5, 352, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2590, 5, 416, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2591, 5, 33, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2592, 5, 97, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2593, 5, 161, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2594, 5, 225, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2595, 5, 289, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2596, 5, 353, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2597, 5, 417, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2598, 5, 34, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2599, 5, 98, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2600, 5, 162, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2601, 5, 226, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2602, 5, 290, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2603, 5, 354, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2604, 5, 418, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2605, 5, 35, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2606, 5, 99, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2607, 5, 163, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2608, 5, 227, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2609, 5, 291, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2610, 5, 355, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2611, 5, 419, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2612, 5, 36, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2613, 5, 100, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2614, 5, 164, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2615, 5, 228, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2616, 5, 292, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2617, 5, 356, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2618, 5, 420, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2619, 5, 37, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2620, 5, 101, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2621, 5, 165, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2622, 5, 229, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2623, 5, 293, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2624, 5, 357, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2625, 5, 421, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2626, 5, 38, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2627, 5, 102, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2628, 5, 166, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2629, 5, 230, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2630, 5, 294, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2631, 5, 358, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2632, 5, 422, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2633, 5, 39, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2634, 5, 103, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2635, 5, 167, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2636, 5, 231, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2637, 5, 295, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2638, 5, 359, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2639, 5, 423, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2640, 5, 40, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2641, 5, 104, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2642, 5, 168, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2643, 5, 232, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2644, 5, 296, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2645, 5, 360, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2646, 5, 424, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2647, 5, 41, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2648, 5, 105, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2649, 5, 169, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2650, 5, 233, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2651, 5, 297, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2652, 5, 361, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2653, 5, 425, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2654, 5, 43, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2655, 5, 107, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2656, 5, 171, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2657, 5, 235, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2658, 5, 299, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2659, 5, 363, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2660, 5, 427, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2661, 5, 44, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2662, 5, 108, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2663, 5, 172, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2664, 5, 236, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2665, 5, 300, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2666, 5, 364, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2667, 5, 428, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2668, 5, 45, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2669, 5, 109, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2670, 5, 173, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2671, 5, 237, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2672, 5, 301, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2673, 5, 365, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2674, 5, 429, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2675, 5, 46, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2676, 5, 110, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2677, 5, 174, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2678, 5, 238, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2679, 5, 302, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2680, 5, 366, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2681, 5, 430, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2682, 5, 47, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2683, 5, 111, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2684, 5, 175, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2685, 5, 239, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2686, 5, 303, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2687, 5, 367, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2688, 5, 431, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2689, 5, 54, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2690, 5, 118, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2691, 5, 182, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2692, 5, 246, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2693, 5, 310, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2694, 5, 374, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2695, 5, 438, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2696, 5, 55, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2697, 5, 119, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2698, 5, 183, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2699, 5, 247, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2700, 5, 311, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2701, 5, 375, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2702, 5, 439, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2703, 5, 56, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2704, 5, 120, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2705, 5, 184, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2706, 5, 248, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2707, 5, 312, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2708, 5, 376, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2709, 5, 440, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2710, 5, 57, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2711, 5, 121, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2712, 5, 185, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2713, 5, 249, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2714, 5, 313, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2715, 5, 377, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2716, 5, 441, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2717, 5, 58, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2718, 5, 122, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2719, 5, 186, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2720, 5, 250, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2721, 5, 314, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2722, 5, 378, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2723, 5, 442, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2724, 5, 59, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2725, 5, 123, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2726, 5, 187, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2727, 5, 251, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2728, 5, 315, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2729, 5, 379, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2730, 5, 443, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2731, 5, 60, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2732, 5, 124, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2733, 5, 188, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2734, 5, 252, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2735, 5, 316, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2736, 5, 380, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2737, 5, 444, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2738, 5, 61, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2739, 5, 125, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2740, 5, 189, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2741, 5, 253, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2742, 5, 317, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2743, 5, 381, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2744, 5, 445, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2745, 5, 62, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2746, 5, 126, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2747, 5, 190, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2748, 5, 254, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2749, 5, 318, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2750, 5, 382, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2751, 5, 446, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2752, 5, 63, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2753, 5, 127, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2754, 5, 191, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2755, 5, 255, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2756, 5, 319, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2757, 5, 383, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2758, 5, 447, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2759, 5, 64, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2760, 5, 128, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2761, 5, 192, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2762, 5, 256, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2763, 5, 320, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2764, 5, 384, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2765, 5, 448, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2766, 5, 449, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2767, 5, 450, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2768, 5, 451, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2769, 5, 452, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2770, 5, 453, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2771, 5, 454, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2772, 5, 455, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2773, 5, 462, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2774, 5, 461, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2775, 5, 460, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2776, 5, 459, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2777, 5, 458, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2778, 5, 457, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2779, 5, 456, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2780, 5, 999, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2781, 5, 991, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2782, 5, 992, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2783, 5, 993, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2784, 6, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2785, 6, 65, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2786, 6, 129, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2787, 6, 193, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2788, 6, 257, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2789, 6, 321, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2790, 6, 385, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2791, 6, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2792, 6, 66, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2793, 6, 130, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2794, 6, 194, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2795, 6, 258, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2796, 6, 322, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2797, 6, 386, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2798, 6, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2799, 6, 67, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2800, 6, 131, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2801, 6, 195, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2802, 6, 259, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2803, 6, 323, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2804, 6, 387, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2805, 6, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2806, 6, 68, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2807, 6, 132, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2808, 6, 196, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2809, 6, 260, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2810, 6, 324, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2811, 6, 388, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2812, 6, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2813, 6, 69, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2814, 6, 133, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2815, 6, 197, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2816, 6, 261, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2817, 6, 325, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2818, 6, 389, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2819, 6, 6, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2820, 6, 70, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2821, 6, 134, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2822, 6, 198, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2823, 6, 262, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2824, 6, 326, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2825, 6, 390, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2826, 6, 8, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2827, 6, 72, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2828, 6, 136, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2829, 6, 200, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2830, 6, 264, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2831, 6, 328, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2832, 6, 392, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2833, 6, 9, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2834, 6, 73, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2835, 6, 137, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2836, 6, 201, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2837, 6, 265, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2838, 6, 329, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2839, 6, 393, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2840, 6, 7, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2841, 6, 71, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2842, 6, 135, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2843, 6, 199, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2844, 6, 263, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2845, 6, 327, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2846, 6, 391, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2847, 6, 10, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2848, 6, 74, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2849, 6, 138, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2850, 6, 202, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2851, 6, 266, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2852, 6, 330, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2853, 6, 394, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2854, 6, 11, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2855, 6, 75, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2856, 6, 139, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2857, 6, 203, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2858, 6, 267, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2859, 6, 331, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2860, 6, 395, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2861, 6, 13, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2862, 6, 77, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2863, 6, 141, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2864, 6, 205, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2865, 6, 269, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2866, 6, 333, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2867, 6, 397, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2868, 6, 12, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2869, 6, 76, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2870, 6, 140, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2871, 6, 204, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2872, 6, 268, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2873, 6, 332, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2874, 6, 396, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2875, 6, 14, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2876, 6, 78, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2877, 6, 142, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2878, 6, 206, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2879, 6, 270, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2880, 6, 334, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2881, 6, 398, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2882, 6, 16, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2883, 6, 80, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2884, 6, 144, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2885, 6, 208, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2886, 6, 272, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2887, 6, 336, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2888, 6, 400, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2889, 6, 17, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2890, 6, 81, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2891, 6, 145, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2892, 6, 209, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2893, 6, 273, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2894, 6, 337, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2895, 6, 401, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2896, 6, 15, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2897, 6, 79, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2898, 6, 143, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2899, 6, 207, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2900, 6, 271, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2901, 6, 335, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2902, 6, 399, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2903, 6, 18, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2904, 6, 82, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2905, 6, 146, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2906, 6, 210, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2907, 6, 274, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2908, 6, 338, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2909, 6, 402, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2910, 6, 19, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2911, 6, 83, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2912, 6, 147, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2913, 6, 211, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2914, 6, 275, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2915, 6, 339, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2916, 6, 403, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2917, 6, 21, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2918, 6, 85, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2919, 6, 149, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2920, 6, 213, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2921, 6, 277, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2922, 6, 341, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2923, 6, 405, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2924, 6, 22, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2925, 6, 86, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2926, 6, 150, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2927, 6, 214, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2928, 6, 278, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2929, 6, 342, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2930, 6, 406, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2931, 6, 20, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2932, 6, 84, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2933, 6, 148, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2934, 6, 212, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2935, 6, 276, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2936, 6, 340, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2937, 6, 404, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2938, 6, 23, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2939, 6, 87, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2940, 6, 151, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2941, 6, 215, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2942, 6, 279, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2943, 6, 343, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2944, 6, 407, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2945, 6, 25, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2946, 6, 89, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2947, 6, 153, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2948, 6, 217, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2949, 6, 281, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2950, 6, 345, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2951, 6, 409, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2952, 6, 24, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2953, 6, 88, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2954, 6, 152, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2955, 6, 216, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2956, 6, 280, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2957, 6, 344, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2958, 6, 408, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2959, 6, 42, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2960, 6, 106, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2961, 6, 170, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2962, 6, 234, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2963, 6, 298, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2964, 6, 362, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2965, 6, 426, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2966, 6, 26, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2967, 6, 90, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2968, 6, 154, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2969, 6, 218, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2970, 6, 282, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2971, 6, 346, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2972, 6, 410, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2973, 6, 30, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2974, 6, 286, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2975, 6, 350, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2976, 6, 27, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2977, 6, 283, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2978, 6, 347, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2979, 6, 28, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2980, 6, 284, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2981, 6, 348, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2982, 6, 51, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2983, 6, 115, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2984, 6, 179, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2985, 6, 243, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2986, 6, 307, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2987, 6, 371, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2988, 6, 435, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2989, 6, 48, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2990, 6, 112, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2991, 6, 176, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2992, 6, 240, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2993, 6, 304, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2994, 6, 368, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2995, 6, 432, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2996, 6, 50, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2997, 6, 114, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2998, 6, 178, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (2999, 6, 242, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3000, 6, 306, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3001, 6, 370, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3002, 6, 434, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3003, 6, 49, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3004, 6, 113, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3005, 6, 177, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3006, 6, 241, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3007, 6, 305, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3008, 6, 369, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3009, 6, 433, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3010, 6, 52, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3011, 6, 116, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3012, 6, 180, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3013, 6, 244, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3014, 6, 308, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3015, 6, 372, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3016, 6, 436, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3017, 6, 53, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3018, 6, 117, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3019, 6, 181, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3020, 6, 245, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3021, 6, 309, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3022, 6, 373, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3023, 6, 437, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3024, 6, 29, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3025, 6, 285, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3026, 6, 349, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3027, 6, 31, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3028, 6, 287, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3029, 6, 351, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3030, 6, 32, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3031, 6, 96, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3032, 6, 160, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3033, 6, 224, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3034, 6, 288, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3035, 6, 352, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3036, 6, 416, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3037, 6, 33, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3038, 6, 97, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3039, 6, 161, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3040, 6, 225, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3041, 6, 289, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3042, 6, 353, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3043, 6, 417, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3044, 6, 34, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3045, 6, 98, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3046, 6, 162, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3047, 6, 226, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3048, 6, 290, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3049, 6, 354, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3050, 6, 418, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3051, 6, 35, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3052, 6, 99, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3053, 6, 163, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3054, 6, 227, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3055, 6, 291, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3056, 6, 355, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3057, 6, 419, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3058, 6, 36, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3059, 6, 100, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3060, 6, 164, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3061, 6, 228, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3062, 6, 292, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3063, 6, 356, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3064, 6, 420, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3065, 6, 37, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3066, 6, 101, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3067, 6, 165, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3068, 6, 229, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3069, 6, 293, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3070, 6, 357, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3071, 6, 421, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3072, 6, 38, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3073, 6, 102, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3074, 6, 166, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3075, 6, 230, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3076, 6, 294, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3077, 6, 358, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3078, 6, 422, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3079, 6, 39, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3080, 6, 103, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3081, 6, 167, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3082, 6, 231, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3083, 6, 295, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3084, 6, 359, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3085, 6, 423, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3086, 6, 40, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3087, 6, 104, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3088, 6, 168, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3089, 6, 232, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3090, 6, 296, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3091, 6, 360, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3092, 6, 424, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3093, 6, 41, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3094, 6, 105, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3095, 6, 169, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3096, 6, 233, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3097, 6, 297, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3098, 6, 361, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3099, 6, 425, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3100, 6, 43, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3101, 6, 107, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3102, 6, 171, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3103, 6, 235, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3104, 6, 299, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3105, 6, 363, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3106, 6, 427, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3107, 6, 44, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3108, 6, 108, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3109, 6, 172, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3110, 6, 236, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3111, 6, 300, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3112, 6, 364, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3113, 6, 428, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3114, 6, 45, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3115, 6, 109, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3116, 6, 173, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3117, 6, 237, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3118, 6, 301, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3119, 6, 365, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3120, 6, 429, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3121, 6, 46, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3122, 6, 110, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3123, 6, 174, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3124, 6, 238, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3125, 6, 302, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3126, 6, 366, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3127, 6, 430, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3128, 6, 47, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3129, 6, 111, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3130, 6, 175, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3131, 6, 239, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3132, 6, 303, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3133, 6, 367, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3134, 6, 431, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3135, 6, 54, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3136, 6, 118, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3137, 6, 182, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3138, 6, 246, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3139, 6, 310, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3140, 6, 374, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3141, 6, 438, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3142, 6, 55, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3143, 6, 119, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3144, 6, 183, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3145, 6, 247, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3146, 6, 311, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3147, 6, 375, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3148, 6, 439, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3149, 6, 56, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3150, 6, 120, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3151, 6, 184, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3152, 6, 248, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3153, 6, 312, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3154, 6, 376, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3155, 6, 440, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3156, 6, 57, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3157, 6, 121, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3158, 6, 185, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3159, 6, 249, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3160, 6, 313, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3161, 6, 377, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3162, 6, 441, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3163, 6, 58, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3164, 6, 122, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3165, 6, 186, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3166, 6, 250, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3167, 6, 314, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3168, 6, 378, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3169, 6, 442, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3170, 6, 59, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3171, 6, 123, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3172, 6, 187, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3173, 6, 251, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3174, 6, 315, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3175, 6, 379, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3176, 6, 443, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3177, 6, 60, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3178, 6, 124, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3179, 6, 188, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3180, 6, 252, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3181, 6, 316, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3182, 6, 380, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3183, 6, 444, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3184, 6, 61, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3185, 6, 125, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3186, 6, 189, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3187, 6, 253, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3188, 6, 317, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3189, 6, 381, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3190, 6, 445, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3191, 6, 62, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3192, 6, 126, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3193, 6, 190, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3194, 6, 254, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3195, 6, 318, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3196, 6, 382, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3197, 6, 446, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3198, 6, 63, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3199, 6, 127, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3200, 6, 191, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3201, 6, 255, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3202, 6, 319, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3203, 6, 383, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3204, 6, 447, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3205, 6, 64, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3206, 6, 128, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3207, 6, 192, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3208, 6, 256, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3209, 6, 320, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3210, 6, 384, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3211, 6, 448, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3212, 6, 449, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3213, 6, 450, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3214, 6, 451, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3215, 6, 452, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3216, 6, 453, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3217, 6, 454, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3218, 6, 455, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3219, 6, 462, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3220, 6, 461, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3221, 6, 460, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3222, 6, 459, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3223, 6, 458, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3224, 6, 457, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3225, 6, 456, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3226, 6, 999, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3227, 6, 991, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3228, 6, 992, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3229, 6, 993, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3230, 7, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3231, 7, 65, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3232, 7, 129, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3233, 7, 193, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3234, 7, 257, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3235, 7, 321, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3236, 7, 385, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3237, 7, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3238, 7, 66, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3239, 7, 130, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3240, 7, 194, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3241, 7, 258, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3242, 7, 322, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3243, 7, 386, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3244, 7, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3245, 7, 67, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3246, 7, 131, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3247, 7, 195, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3248, 7, 259, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3249, 7, 323, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3250, 7, 387, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3251, 7, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3252, 7, 68, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3253, 7, 132, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3254, 7, 196, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3255, 7, 260, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3256, 7, 324, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3257, 7, 388, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3258, 7, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3259, 7, 69, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3260, 7, 133, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3261, 7, 197, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3262, 7, 261, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3263, 7, 325, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3264, 7, 389, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3265, 7, 6, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3266, 7, 70, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3267, 7, 134, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3268, 7, 198, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3269, 7, 262, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3270, 7, 326, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3271, 7, 390, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3272, 7, 8, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3273, 7, 72, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3274, 7, 136, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3275, 7, 200, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3276, 7, 264, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3277, 7, 328, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3278, 7, 392, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3279, 7, 9, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3280, 7, 73, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3281, 7, 137, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3282, 7, 201, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3283, 7, 265, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3284, 7, 329, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3285, 7, 393, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3286, 7, 7, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3287, 7, 71, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3288, 7, 135, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3289, 7, 199, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3290, 7, 263, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3291, 7, 327, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3292, 7, 391, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3293, 7, 10, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3294, 7, 74, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3295, 7, 138, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3296, 7, 202, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3297, 7, 266, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3298, 7, 330, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3299, 7, 394, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3300, 7, 11, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3301, 7, 75, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3302, 7, 139, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3303, 7, 203, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3304, 7, 267, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3305, 7, 331, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3306, 7, 395, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3307, 7, 13, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3308, 7, 77, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3309, 7, 141, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3310, 7, 205, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3311, 7, 269, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3312, 7, 333, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3313, 7, 397, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3314, 7, 12, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3315, 7, 76, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3316, 7, 140, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3317, 7, 204, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3318, 7, 268, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3319, 7, 332, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3320, 7, 396, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3321, 7, 14, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3322, 7, 78, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3323, 7, 142, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3324, 7, 206, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3325, 7, 270, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3326, 7, 334, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3327, 7, 398, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3328, 7, 16, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3329, 7, 80, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3330, 7, 144, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3331, 7, 208, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3332, 7, 272, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3333, 7, 336, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3334, 7, 400, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3335, 7, 17, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3336, 7, 81, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3337, 7, 145, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3338, 7, 209, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3339, 7, 273, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3340, 7, 337, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3341, 7, 401, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3342, 7, 15, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3343, 7, 79, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3344, 7, 143, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3345, 7, 207, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3346, 7, 271, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3347, 7, 335, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3348, 7, 399, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3349, 7, 18, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3350, 7, 82, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3351, 7, 146, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3352, 7, 210, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3353, 7, 274, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3354, 7, 338, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3355, 7, 402, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3356, 7, 19, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3357, 7, 83, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3358, 7, 147, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3359, 7, 211, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3360, 7, 275, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3361, 7, 339, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3362, 7, 403, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3363, 7, 21, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3364, 7, 85, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3365, 7, 149, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3366, 7, 213, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3367, 7, 277, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3368, 7, 341, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3369, 7, 405, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3370, 7, 22, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3371, 7, 86, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3372, 7, 150, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3373, 7, 214, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3374, 7, 278, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3375, 7, 342, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3376, 7, 406, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3377, 7, 20, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3378, 7, 84, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3379, 7, 148, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3380, 7, 212, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3381, 7, 276, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3382, 7, 340, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3383, 7, 404, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3384, 7, 23, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3385, 7, 87, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3386, 7, 151, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3387, 7, 215, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3388, 7, 279, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3389, 7, 343, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3390, 7, 407, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3391, 7, 25, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3392, 7, 89, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3393, 7, 153, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3394, 7, 217, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3395, 7, 281, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3396, 7, 345, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3397, 7, 409, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3398, 7, 24, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3399, 7, 88, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3400, 7, 152, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3401, 7, 216, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3402, 7, 280, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3403, 7, 344, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3404, 7, 408, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3405, 7, 42, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3406, 7, 106, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3407, 7, 170, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3408, 7, 234, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3409, 7, 298, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3410, 7, 362, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3411, 7, 426, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3412, 7, 26, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3413, 7, 90, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3414, 7, 154, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3415, 7, 218, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3416, 7, 282, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3417, 7, 346, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3418, 7, 410, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3419, 7, 30, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3420, 7, 286, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3421, 7, 350, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3422, 7, 27, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3423, 7, 283, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3424, 7, 347, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3425, 7, 28, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3426, 7, 284, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3427, 7, 348, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3428, 7, 51, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3429, 7, 115, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3430, 7, 179, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3431, 7, 243, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3432, 7, 307, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3433, 7, 371, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3434, 7, 435, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3435, 7, 48, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3436, 7, 112, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3437, 7, 176, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3438, 7, 240, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3439, 7, 304, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3440, 7, 368, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3441, 7, 432, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3442, 7, 50, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3443, 7, 114, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3444, 7, 178, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3445, 7, 242, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3446, 7, 306, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3447, 7, 370, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3448, 7, 434, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3449, 7, 49, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3450, 7, 113, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3451, 7, 177, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3452, 7, 241, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3453, 7, 305, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3454, 7, 369, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3455, 7, 433, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3456, 7, 52, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3457, 7, 116, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3458, 7, 180, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3459, 7, 244, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3460, 7, 308, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3461, 7, 372, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3462, 7, 436, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3463, 7, 53, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3464, 7, 117, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3465, 7, 181, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3466, 7, 245, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3467, 7, 309, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3468, 7, 373, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3469, 7, 437, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3470, 7, 29, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3471, 7, 285, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3472, 7, 349, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3473, 7, 31, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3474, 7, 287, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3475, 7, 351, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3476, 7, 32, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3477, 7, 96, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3478, 7, 160, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3479, 7, 224, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3480, 7, 288, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3481, 7, 352, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3482, 7, 416, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3483, 7, 33, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3484, 7, 97, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3485, 7, 161, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3486, 7, 225, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3487, 7, 289, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3488, 7, 353, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3489, 7, 417, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3490, 7, 34, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3491, 7, 98, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3492, 7, 162, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3493, 7, 226, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3494, 7, 290, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3495, 7, 354, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3496, 7, 418, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3497, 7, 35, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3498, 7, 99, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3499, 7, 163, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3500, 7, 227, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3501, 7, 291, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3502, 7, 355, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3503, 7, 419, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3504, 7, 36, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3505, 7, 100, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3506, 7, 164, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3507, 7, 228, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3508, 7, 292, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3509, 7, 356, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3510, 7, 420, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3511, 7, 37, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3512, 7, 101, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3513, 7, 165, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3514, 7, 229, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3515, 7, 293, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3516, 7, 357, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3517, 7, 421, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3518, 7, 38, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3519, 7, 102, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3520, 7, 166, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3521, 7, 230, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3522, 7, 294, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3523, 7, 358, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3524, 7, 422, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3525, 7, 39, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3526, 7, 103, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3527, 7, 167, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3528, 7, 231, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3529, 7, 295, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3530, 7, 359, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3531, 7, 423, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3532, 7, 40, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3533, 7, 104, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3534, 7, 168, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3535, 7, 232, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3536, 7, 296, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3537, 7, 360, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3538, 7, 424, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3539, 7, 41, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3540, 7, 105, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3541, 7, 169, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3542, 7, 233, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3543, 7, 297, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3544, 7, 361, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3545, 7, 425, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3546, 7, 43, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3547, 7, 107, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3548, 7, 171, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3549, 7, 235, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3550, 7, 299, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3551, 7, 363, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3552, 7, 427, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3553, 7, 44, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3554, 7, 108, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3555, 7, 172, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3556, 7, 236, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3557, 7, 300, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3558, 7, 364, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3559, 7, 428, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3560, 7, 45, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3561, 7, 109, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3562, 7, 173, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3563, 7, 237, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3564, 7, 301, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3565, 7, 365, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3566, 7, 429, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3567, 7, 46, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3568, 7, 110, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3569, 7, 174, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3570, 7, 238, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3571, 7, 302, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3572, 7, 366, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3573, 7, 430, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3574, 7, 47, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3575, 7, 111, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3576, 7, 175, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3577, 7, 239, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3578, 7, 303, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3579, 7, 367, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3580, 7, 431, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3581, 7, 54, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3582, 7, 118, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3583, 7, 182, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3584, 7, 246, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3585, 7, 310, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3586, 7, 374, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3587, 7, 438, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3588, 7, 55, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3589, 7, 119, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3590, 7, 183, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3591, 7, 247, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3592, 7, 311, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3593, 7, 375, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3594, 7, 439, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3595, 7, 56, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3596, 7, 120, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3597, 7, 184, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3598, 7, 248, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3599, 7, 312, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3600, 7, 376, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3601, 7, 440, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3602, 7, 57, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3603, 7, 121, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3604, 7, 185, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3605, 7, 249, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3606, 7, 313, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3607, 7, 377, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3608, 7, 441, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3609, 7, 58, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3610, 7, 122, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3611, 7, 186, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3612, 7, 250, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3613, 7, 314, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3614, 7, 378, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3615, 7, 442, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3616, 7, 59, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3617, 7, 123, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3618, 7, 187, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3619, 7, 251, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3620, 7, 315, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3621, 7, 379, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3622, 7, 443, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3623, 7, 60, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3624, 7, 124, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3625, 7, 188, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3626, 7, 252, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3627, 7, 316, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3628, 7, 380, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3629, 7, 444, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3630, 7, 61, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3631, 7, 125, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3632, 7, 189, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3633, 7, 253, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3634, 7, 317, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3635, 7, 381, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3636, 7, 445, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3637, 7, 62, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3638, 7, 126, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3639, 7, 190, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3640, 7, 254, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3641, 7, 318, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3642, 7, 382, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3643, 7, 446, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3644, 7, 63, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3645, 7, 127, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3646, 7, 191, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3647, 7, 255, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3648, 7, 319, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3649, 7, 383, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3650, 7, 447, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3651, 7, 64, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3652, 7, 128, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3653, 7, 192, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3654, 7, 256, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3655, 7, 320, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3656, 7, 384, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3657, 7, 448, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3658, 7, 449, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3659, 7, 450, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3660, 7, 451, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3661, 7, 452, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3662, 7, 453, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3663, 7, 454, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3664, 7, 455, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3665, 7, 462, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3666, 7, 461, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3667, 7, 460, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3668, 7, 459, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3669, 7, 458, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3670, 7, 457, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3671, 7, 456, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3672, 7, 999, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3673, 7, 991, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3674, 7, 992, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3675, 7, 993, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3676, 8, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3677, 8, 65, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3678, 8, 129, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3679, 8, 193, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3680, 8, 257, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3681, 8, 321, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3682, 8, 385, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3683, 8, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3684, 8, 66, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3685, 8, 130, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3686, 8, 194, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3687, 8, 258, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3688, 8, 322, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3689, 8, 386, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3690, 8, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3691, 8, 67, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3692, 8, 131, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3693, 8, 195, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3694, 8, 259, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3695, 8, 323, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3696, 8, 387, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3697, 8, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3698, 8, 68, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3699, 8, 132, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3700, 8, 196, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3701, 8, 260, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3702, 8, 324, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3703, 8, 388, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3704, 8, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3705, 8, 69, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3706, 8, 133, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3707, 8, 197, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3708, 8, 261, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3709, 8, 325, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3710, 8, 389, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3711, 8, 6, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3712, 8, 70, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3713, 8, 134, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3714, 8, 198, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3715, 8, 262, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3716, 8, 326, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3717, 8, 390, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3718, 8, 8, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3719, 8, 72, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3720, 8, 136, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3721, 8, 200, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3722, 8, 264, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3723, 8, 328, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3724, 8, 392, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3725, 8, 9, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3726, 8, 73, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3727, 8, 137, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3728, 8, 201, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3729, 8, 265, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3730, 8, 329, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3731, 8, 393, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3732, 8, 7, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3733, 8, 71, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3734, 8, 135, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3735, 8, 199, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3736, 8, 263, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3737, 8, 327, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3738, 8, 391, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3739, 8, 10, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3740, 8, 74, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3741, 8, 138, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3742, 8, 202, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3743, 8, 266, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3744, 8, 330, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3745, 8, 394, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3746, 8, 11, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3747, 8, 75, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3748, 8, 139, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3749, 8, 203, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3750, 8, 267, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3751, 8, 331, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3752, 8, 395, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3753, 8, 13, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3754, 8, 77, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3755, 8, 141, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3756, 8, 205, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3757, 8, 269, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3758, 8, 333, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3759, 8, 397, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3760, 8, 12, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3761, 8, 76, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3762, 8, 140, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3763, 8, 204, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3764, 8, 268, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3765, 8, 332, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3766, 8, 396, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3767, 8, 14, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3768, 8, 78, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3769, 8, 142, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3770, 8, 206, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3771, 8, 270, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3772, 8, 334, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3773, 8, 398, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3774, 8, 16, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3775, 8, 80, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3776, 8, 144, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3777, 8, 208, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3778, 8, 272, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3779, 8, 336, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3780, 8, 400, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3781, 8, 17, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3782, 8, 81, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3783, 8, 145, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3784, 8, 209, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3785, 8, 273, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3786, 8, 337, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3787, 8, 401, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3788, 8, 15, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3789, 8, 79, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3790, 8, 143, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3791, 8, 207, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3792, 8, 271, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3793, 8, 335, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3794, 8, 399, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3795, 8, 18, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3796, 8, 82, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3797, 8, 146, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3798, 8, 210, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3799, 8, 274, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3800, 8, 338, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3801, 8, 402, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3802, 8, 19, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3803, 8, 83, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3804, 8, 147, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3805, 8, 211, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3806, 8, 275, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3807, 8, 339, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3808, 8, 403, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3809, 8, 21, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3810, 8, 85, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3811, 8, 149, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3812, 8, 213, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3813, 8, 277, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3814, 8, 341, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3815, 8, 405, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3816, 8, 22, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3817, 8, 86, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3818, 8, 150, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3819, 8, 214, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3820, 8, 278, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3821, 8, 342, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3822, 8, 406, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3823, 8, 20, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3824, 8, 84, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3825, 8, 148, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3826, 8, 212, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3827, 8, 276, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3828, 8, 340, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3829, 8, 404, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3830, 8, 23, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3831, 8, 87, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3832, 8, 151, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3833, 8, 215, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3834, 8, 279, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3835, 8, 343, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3836, 8, 407, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3837, 8, 25, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3838, 8, 89, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3839, 8, 153, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3840, 8, 217, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3841, 8, 281, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3842, 8, 345, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3843, 8, 409, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3844, 8, 24, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3845, 8, 88, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3846, 8, 152, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3847, 8, 216, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3848, 8, 280, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3849, 8, 344, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3850, 8, 408, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3851, 8, 42, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3852, 8, 106, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3853, 8, 170, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3854, 8, 234, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3855, 8, 298, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3856, 8, 362, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3857, 8, 426, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3858, 8, 26, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3859, 8, 90, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3860, 8, 154, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3861, 8, 218, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3862, 8, 282, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3863, 8, 346, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3864, 8, 410, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3865, 8, 30, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3866, 8, 286, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3867, 8, 350, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3868, 8, 27, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3869, 8, 283, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3870, 8, 347, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3871, 8, 28, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3872, 8, 284, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3873, 8, 348, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3874, 8, 51, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3875, 8, 115, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3876, 8, 179, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3877, 8, 243, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3878, 8, 307, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3879, 8, 371, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3880, 8, 435, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3881, 8, 48, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3882, 8, 112, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3883, 8, 176, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3884, 8, 240, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3885, 8, 304, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3886, 8, 368, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3887, 8, 432, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3888, 8, 50, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3889, 8, 114, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3890, 8, 178, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3891, 8, 242, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3892, 8, 306, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3893, 8, 370, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3894, 8, 434, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3895, 8, 49, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3896, 8, 113, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3897, 8, 177, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3898, 8, 241, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3899, 8, 305, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3900, 8, 369, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3901, 8, 433, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3902, 8, 52, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3903, 8, 116, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3904, 8, 180, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3905, 8, 244, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3906, 8, 308, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3907, 8, 372, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3908, 8, 436, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3909, 8, 53, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3910, 8, 117, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3911, 8, 181, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3912, 8, 245, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3913, 8, 309, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3914, 8, 373, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3915, 8, 437, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3916, 8, 29, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3917, 8, 285, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3918, 8, 349, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3919, 8, 31, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3920, 8, 287, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3921, 8, 351, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3922, 8, 32, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3923, 8, 96, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3924, 8, 160, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3925, 8, 224, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3926, 8, 288, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3927, 8, 352, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3928, 8, 416, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3929, 8, 33, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3930, 8, 97, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3931, 8, 161, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3932, 8, 225, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3933, 8, 289, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3934, 8, 353, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3935, 8, 417, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3936, 8, 34, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3937, 8, 98, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3938, 8, 162, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3939, 8, 226, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3940, 8, 290, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3941, 8, 354, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3942, 8, 418, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3943, 8, 35, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3944, 8, 99, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3945, 8, 163, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3946, 8, 227, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3947, 8, 291, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3948, 8, 355, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3949, 8, 419, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3950, 8, 36, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3951, 8, 100, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3952, 8, 164, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3953, 8, 228, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3954, 8, 292, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3955, 8, 356, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3956, 8, 420, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3957, 8, 37, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3958, 8, 101, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3959, 8, 165, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3960, 8, 229, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3961, 8, 293, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3962, 8, 357, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3963, 8, 421, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3964, 8, 38, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3965, 8, 102, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3966, 8, 166, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3967, 8, 230, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3968, 8, 294, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3969, 8, 358, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3970, 8, 422, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3971, 8, 39, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3972, 8, 103, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3973, 8, 167, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3974, 8, 231, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3975, 8, 295, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3976, 8, 359, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3977, 8, 423, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3978, 8, 40, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3979, 8, 104, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3980, 8, 168, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3981, 8, 232, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3982, 8, 296, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3983, 8, 360, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3984, 8, 424, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3985, 8, 41, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3986, 8, 105, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3987, 8, 169, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3988, 8, 233, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3989, 8, 297, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3990, 8, 361, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3991, 8, 425, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3992, 8, 43, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3993, 8, 107, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3994, 8, 171, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3995, 8, 235, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3996, 8, 299, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3997, 8, 363, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3998, 8, 427, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (3999, 8, 44, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4000, 8, 108, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4001, 8, 172, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4002, 8, 236, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4003, 8, 300, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4004, 8, 364, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4005, 8, 428, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4006, 8, 45, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4007, 8, 109, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4008, 8, 173, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4009, 8, 237, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4010, 8, 301, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4011, 8, 365, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4012, 8, 429, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4013, 8, 46, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4014, 8, 110, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4015, 8, 174, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4016, 8, 238, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4017, 8, 302, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4018, 8, 366, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4019, 8, 430, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4020, 8, 47, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4021, 8, 111, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4022, 8, 175, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4023, 8, 239, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4024, 8, 303, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4025, 8, 367, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4026, 8, 431, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4027, 8, 54, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4028, 8, 118, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4029, 8, 182, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4030, 8, 246, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4031, 8, 310, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4032, 8, 374, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4033, 8, 438, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4034, 8, 55, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4035, 8, 119, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4036, 8, 183, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4037, 8, 247, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4038, 8, 311, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4039, 8, 375, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4040, 8, 439, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4041, 8, 56, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4042, 8, 120, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4043, 8, 184, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4044, 8, 248, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4045, 8, 312, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4046, 8, 376, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4047, 8, 440, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4048, 8, 57, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4049, 8, 121, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4050, 8, 185, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4051, 8, 249, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4052, 8, 313, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4053, 8, 377, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4054, 8, 441, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4055, 8, 58, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4056, 8, 122, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4057, 8, 186, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4058, 8, 250, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4059, 8, 314, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4060, 8, 378, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4061, 8, 442, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4062, 8, 59, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4063, 8, 123, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4064, 8, 187, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4065, 8, 251, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4066, 8, 315, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4067, 8, 379, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4068, 8, 443, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4069, 8, 60, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4070, 8, 124, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4071, 8, 188, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4072, 8, 252, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4073, 8, 316, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4074, 8, 380, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4075, 8, 444, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4076, 8, 61, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4077, 8, 125, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4078, 8, 189, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4079, 8, 253, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4080, 8, 317, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4081, 8, 381, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4082, 8, 445, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4083, 8, 62, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4084, 8, 126, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4085, 8, 190, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4086, 8, 254, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4087, 8, 318, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4088, 8, 382, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4089, 8, 446, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4090, 8, 63, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4091, 8, 127, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4092, 8, 191, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4093, 8, 255, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4094, 8, 319, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4095, 8, 383, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4096, 8, 447, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4097, 8, 64, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4098, 8, 128, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4099, 8, 192, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4100, 8, 256, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4101, 8, 320, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4102, 8, 384, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4103, 8, 448, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4104, 8, 449, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4105, 8, 450, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4106, 8, 451, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4107, 8, 452, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4108, 8, 453, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4109, 8, 454, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4110, 8, 455, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4111, 8, 462, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4112, 8, 461, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4113, 8, 460, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4114, 8, 459, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4115, 8, 458, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4116, 8, 457, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4117, 8, 456, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4118, 8, 999, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4119, 8, 991, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4120, 8, 992, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4121, 8, 993, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4122, 9, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4123, 9, 65, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4124, 9, 129, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4125, 9, 193, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4126, 9, 257, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4127, 9, 321, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4128, 9, 385, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4129, 9, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4130, 9, 66, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4131, 9, 130, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4132, 9, 194, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4133, 9, 258, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4134, 9, 322, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4135, 9, 386, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4136, 9, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4137, 9, 67, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4138, 9, 131, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4139, 9, 195, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4140, 9, 259, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4141, 9, 323, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4142, 9, 387, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4143, 9, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4144, 9, 68, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4145, 9, 132, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4146, 9, 196, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4147, 9, 260, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4148, 9, 324, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4149, 9, 388, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4150, 9, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4151, 9, 69, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4152, 9, 133, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4153, 9, 197, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4154, 9, 261, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4155, 9, 325, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4156, 9, 389, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4157, 9, 6, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4158, 9, 70, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4159, 9, 134, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4160, 9, 198, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4161, 9, 262, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4162, 9, 326, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4163, 9, 390, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4164, 9, 8, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4165, 9, 72, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4166, 9, 136, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4167, 9, 200, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4168, 9, 264, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4169, 9, 328, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4170, 9, 392, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4171, 9, 9, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4172, 9, 73, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4173, 9, 137, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4174, 9, 201, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4175, 9, 265, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4176, 9, 329, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4177, 9, 393, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4178, 9, 7, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4179, 9, 71, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4180, 9, 135, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4181, 9, 199, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4182, 9, 263, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4183, 9, 327, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4184, 9, 391, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4185, 9, 10, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4186, 9, 74, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4187, 9, 138, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4188, 9, 202, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4189, 9, 266, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4190, 9, 330, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4191, 9, 394, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4192, 9, 11, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4193, 9, 75, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4194, 9, 139, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4195, 9, 203, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4196, 9, 267, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4197, 9, 331, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4198, 9, 395, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4199, 9, 13, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4200, 9, 77, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4201, 9, 141, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4202, 9, 205, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4203, 9, 269, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4204, 9, 333, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4205, 9, 397, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4206, 9, 12, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4207, 9, 76, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4208, 9, 140, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4209, 9, 204, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4210, 9, 268, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4211, 9, 332, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4212, 9, 396, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4213, 9, 14, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4214, 9, 78, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4215, 9, 142, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4216, 9, 206, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4217, 9, 270, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4218, 9, 334, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4219, 9, 398, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4220, 9, 16, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4221, 9, 80, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4222, 9, 144, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4223, 9, 208, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4224, 9, 272, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4225, 9, 336, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4226, 9, 400, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4227, 9, 17, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4228, 9, 81, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4229, 9, 145, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4230, 9, 209, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4231, 9, 273, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4232, 9, 337, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4233, 9, 401, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4234, 9, 15, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4235, 9, 79, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4236, 9, 143, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4237, 9, 207, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4238, 9, 271, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4239, 9, 335, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4240, 9, 399, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4241, 9, 18, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4242, 9, 82, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4243, 9, 146, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4244, 9, 210, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4245, 9, 274, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4246, 9, 338, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4247, 9, 402, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4248, 9, 19, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4249, 9, 83, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4250, 9, 147, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4251, 9, 211, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4252, 9, 275, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4253, 9, 339, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4254, 9, 403, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4255, 9, 21, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4256, 9, 85, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4257, 9, 149, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4258, 9, 213, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4259, 9, 277, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4260, 9, 341, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4261, 9, 405, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4262, 9, 22, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4263, 9, 86, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4264, 9, 150, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4265, 9, 214, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4266, 9, 278, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4267, 9, 342, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4268, 9, 406, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4269, 9, 20, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4270, 9, 84, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4271, 9, 148, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4272, 9, 212, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4273, 9, 276, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4274, 9, 340, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4275, 9, 404, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4276, 9, 23, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4277, 9, 87, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4278, 9, 151, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4279, 9, 215, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4280, 9, 279, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4281, 9, 343, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4282, 9, 407, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4283, 9, 25, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4284, 9, 89, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4285, 9, 153, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4286, 9, 217, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4287, 9, 281, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4288, 9, 345, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4289, 9, 409, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4290, 9, 24, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4291, 9, 88, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4292, 9, 152, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4293, 9, 216, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4294, 9, 280, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4295, 9, 344, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4296, 9, 408, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4297, 9, 42, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4298, 9, 106, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4299, 9, 170, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4300, 9, 234, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4301, 9, 298, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4302, 9, 362, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4303, 9, 426, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4304, 9, 26, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4305, 9, 90, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4306, 9, 154, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4307, 9, 218, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4308, 9, 282, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4309, 9, 346, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4310, 9, 410, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4311, 9, 30, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4312, 9, 286, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4313, 9, 350, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4314, 9, 27, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4315, 9, 283, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4316, 9, 347, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4317, 9, 28, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4318, 9, 284, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4319, 9, 348, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4320, 9, 51, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4321, 9, 115, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4322, 9, 179, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4323, 9, 243, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4324, 9, 307, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4325, 9, 371, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4326, 9, 435, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4327, 9, 48, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4328, 9, 112, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4329, 9, 176, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4330, 9, 240, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4331, 9, 304, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4332, 9, 368, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4333, 9, 432, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4334, 9, 50, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4335, 9, 114, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4336, 9, 178, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4337, 9, 242, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4338, 9, 306, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4339, 9, 370, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4340, 9, 434, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4341, 9, 49, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4342, 9, 113, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4343, 9, 177, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4344, 9, 241, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4345, 9, 305, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4346, 9, 369, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4347, 9, 433, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4348, 9, 52, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4349, 9, 116, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4350, 9, 180, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4351, 9, 244, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4352, 9, 308, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4353, 9, 372, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4354, 9, 436, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4355, 9, 53, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4356, 9, 117, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4357, 9, 181, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4358, 9, 245, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4359, 9, 309, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4360, 9, 373, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4361, 9, 437, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4362, 9, 29, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4363, 9, 285, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4364, 9, 349, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4365, 9, 31, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4366, 9, 287, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4367, 9, 351, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4368, 9, 32, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4369, 9, 96, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4370, 9, 160, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4371, 9, 224, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4372, 9, 288, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4373, 9, 352, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4374, 9, 416, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4375, 9, 33, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4376, 9, 97, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4377, 9, 161, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4378, 9, 225, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4379, 9, 289, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4380, 9, 353, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4381, 9, 417, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4382, 9, 34, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4383, 9, 98, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4384, 9, 162, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4385, 9, 226, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4386, 9, 290, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4387, 9, 354, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4388, 9, 418, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4389, 9, 35, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4390, 9, 99, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4391, 9, 163, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4392, 9, 227, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4393, 9, 291, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4394, 9, 355, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4395, 9, 419, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4396, 9, 36, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4397, 9, 100, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4398, 9, 164, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4399, 9, 228, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4400, 9, 292, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4401, 9, 356, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4402, 9, 420, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4403, 9, 37, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4404, 9, 101, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4405, 9, 165, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4406, 9, 229, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4407, 9, 293, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4408, 9, 357, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4409, 9, 421, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4410, 9, 38, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4411, 9, 102, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4412, 9, 166, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4413, 9, 230, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4414, 9, 294, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4415, 9, 358, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4416, 9, 422, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4417, 9, 39, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4418, 9, 103, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4419, 9, 167, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4420, 9, 231, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4421, 9, 295, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4422, 9, 359, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4423, 9, 423, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4424, 9, 40, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4425, 9, 104, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4426, 9, 168, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4427, 9, 232, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4428, 9, 296, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4429, 9, 360, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4430, 9, 424, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4431, 9, 41, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4432, 9, 105, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4433, 9, 169, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4434, 9, 233, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4435, 9, 297, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4436, 9, 361, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4437, 9, 425, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4438, 9, 43, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4439, 9, 107, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4440, 9, 171, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4441, 9, 235, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4442, 9, 299, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4443, 9, 363, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4444, 9, 427, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4445, 9, 44, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4446, 9, 108, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4447, 9, 172, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4448, 9, 236, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4449, 9, 300, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4450, 9, 364, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4451, 9, 428, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4452, 9, 45, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4453, 9, 109, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4454, 9, 173, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4455, 9, 237, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4456, 9, 301, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4457, 9, 365, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4458, 9, 429, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4459, 9, 46, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4460, 9, 110, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4461, 9, 174, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4462, 9, 238, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4463, 9, 302, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4464, 9, 366, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4465, 9, 430, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4466, 9, 47, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4467, 9, 111, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4468, 9, 175, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4469, 9, 239, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4470, 9, 303, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4471, 9, 367, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4472, 9, 431, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4473, 9, 54, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4474, 9, 118, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4475, 9, 182, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4476, 9, 246, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4477, 9, 310, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4478, 9, 374, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4479, 9, 438, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4480, 9, 55, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4481, 9, 119, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4482, 9, 183, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4483, 9, 247, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4484, 9, 311, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4485, 9, 375, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4486, 9, 439, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4487, 9, 56, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4488, 9, 120, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4489, 9, 184, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4490, 9, 248, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4491, 9, 312, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4492, 9, 376, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4493, 9, 440, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4494, 9, 57, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4495, 9, 121, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4496, 9, 185, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4497, 9, 249, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4498, 9, 313, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4499, 9, 377, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4500, 9, 441, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4501, 9, 58, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4502, 9, 122, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4503, 9, 186, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4504, 9, 250, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4505, 9, 314, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4506, 9, 378, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4507, 9, 442, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4508, 9, 59, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4509, 9, 123, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4510, 9, 187, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4511, 9, 251, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4512, 9, 315, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4513, 9, 379, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4514, 9, 443, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4515, 9, 60, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4516, 9, 124, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4517, 9, 188, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4518, 9, 252, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4519, 9, 316, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4520, 9, 380, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4521, 9, 444, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4522, 9, 61, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4523, 9, 125, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4524, 9, 189, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4525, 9, 253, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4526, 9, 317, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4527, 9, 381, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4528, 9, 445, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4529, 9, 62, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4530, 9, 126, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4531, 9, 190, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4532, 9, 254, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4533, 9, 318, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4534, 9, 382, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4535, 9, 446, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4536, 9, 63, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4537, 9, 127, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4538, 9, 191, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4539, 9, 255, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4540, 9, 319, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4541, 9, 383, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4542, 9, 447, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4543, 9, 64, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4544, 9, 128, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4545, 9, 192, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4546, 9, 256, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4547, 9, 320, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4548, 9, 384, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4549, 9, 448, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4550, 9, 449, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4551, 9, 450, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4552, 9, 451, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4553, 9, 452, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4554, 9, 453, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4555, 9, 454, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4556, 9, 455, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4557, 9, 462, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4558, 9, 461, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4559, 9, 460, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4560, 9, 459, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4561, 9, 458, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4562, 9, 457, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4563, 9, 456, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4564, 9, 999, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4565, 9, 991, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4566, 9, 992, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4567, 9, 993, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4568, 10, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4569, 10, 65, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4570, 10, 129, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4571, 10, 193, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4572, 10, 257, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4573, 10, 321, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4574, 10, 385, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4575, 10, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4576, 10, 66, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4577, 10, 130, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4578, 10, 194, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4579, 10, 258, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4580, 10, 322, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4581, 10, 386, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4582, 10, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4583, 10, 67, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4584, 10, 131, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4585, 10, 195, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4586, 10, 259, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4587, 10, 323, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4588, 10, 387, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4589, 10, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4590, 10, 68, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4591, 10, 132, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4592, 10, 196, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4593, 10, 260, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4594, 10, 324, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4595, 10, 388, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4596, 10, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4597, 10, 69, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4598, 10, 133, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4599, 10, 197, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4600, 10, 261, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4601, 10, 325, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4602, 10, 389, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4603, 10, 6, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4604, 10, 70, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4605, 10, 134, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4606, 10, 198, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4607, 10, 262, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4608, 10, 326, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4609, 10, 390, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4610, 10, 8, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4611, 10, 72, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4612, 10, 136, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4613, 10, 200, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4614, 10, 264, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4615, 10, 328, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4616, 10, 392, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4617, 10, 9, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4618, 10, 73, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4619, 10, 137, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4620, 10, 201, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4621, 10, 265, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4622, 10, 329, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4623, 10, 393, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4624, 10, 7, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4625, 10, 71, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4626, 10, 135, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4627, 10, 199, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4628, 10, 263, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4629, 10, 327, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4630, 10, 391, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4631, 10, 10, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4632, 10, 74, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4633, 10, 138, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4634, 10, 202, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4635, 10, 266, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4636, 10, 330, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4637, 10, 394, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4638, 10, 11, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4639, 10, 75, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4640, 10, 139, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4641, 10, 203, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4642, 10, 267, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4643, 10, 331, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4644, 10, 395, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4645, 10, 13, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4646, 10, 77, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4647, 10, 141, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4648, 10, 205, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4649, 10, 269, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4650, 10, 333, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4651, 10, 397, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4652, 10, 12, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4653, 10, 76, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4654, 10, 140, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4655, 10, 204, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4656, 10, 268, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4657, 10, 332, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4658, 10, 396, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4659, 10, 14, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4660, 10, 78, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4661, 10, 142, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4662, 10, 206, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4663, 10, 270, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4664, 10, 334, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4665, 10, 398, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4666, 10, 16, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4667, 10, 80, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4668, 10, 144, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4669, 10, 208, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4670, 10, 272, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4671, 10, 336, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4672, 10, 400, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4673, 10, 17, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4674, 10, 81, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4675, 10, 145, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4676, 10, 209, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4677, 10, 273, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4678, 10, 337, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4679, 10, 401, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4680, 10, 15, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4681, 10, 79, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4682, 10, 143, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4683, 10, 207, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4684, 10, 271, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4685, 10, 335, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4686, 10, 399, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4687, 10, 18, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4688, 10, 82, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4689, 10, 146, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4690, 10, 210, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4691, 10, 274, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4692, 10, 338, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4693, 10, 402, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4694, 10, 19, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4695, 10, 83, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4696, 10, 147, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4697, 10, 211, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4698, 10, 275, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4699, 10, 339, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4700, 10, 403, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4701, 10, 21, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4702, 10, 85, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4703, 10, 149, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4704, 10, 213, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4705, 10, 277, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4706, 10, 341, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4707, 10, 405, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4708, 10, 22, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4709, 10, 86, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4710, 10, 150, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4711, 10, 214, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4712, 10, 278, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4713, 10, 342, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4714, 10, 406, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4715, 10, 20, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4716, 10, 84, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4717, 10, 148, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4718, 10, 212, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4719, 10, 276, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4720, 10, 340, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4721, 10, 404, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4722, 10, 23, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4723, 10, 87, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4724, 10, 151, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4725, 10, 215, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4726, 10, 279, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4727, 10, 343, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4728, 10, 407, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4729, 10, 25, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4730, 10, 89, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4731, 10, 153, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4732, 10, 217, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4733, 10, 281, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4734, 10, 345, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4735, 10, 409, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4736, 10, 24, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4737, 10, 88, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4738, 10, 152, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4739, 10, 216, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4740, 10, 280, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4741, 10, 344, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4742, 10, 408, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4743, 10, 42, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4744, 10, 106, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4745, 10, 170, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4746, 10, 234, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4747, 10, 298, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4748, 10, 362, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4749, 10, 426, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4750, 10, 26, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4751, 10, 90, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4752, 10, 154, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4753, 10, 218, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4754, 10, 282, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4755, 10, 346, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4756, 10, 410, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4757, 10, 30, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4758, 10, 286, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4759, 10, 350, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4760, 10, 27, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4761, 10, 283, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4762, 10, 347, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4763, 10, 28, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4764, 10, 284, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4765, 10, 348, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4766, 10, 51, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4767, 10, 115, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4768, 10, 179, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4769, 10, 243, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4770, 10, 307, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4771, 10, 371, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4772, 10, 435, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4773, 10, 48, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4774, 10, 112, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4775, 10, 176, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4776, 10, 240, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4777, 10, 304, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4778, 10, 368, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4779, 10, 432, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4780, 10, 50, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4781, 10, 114, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4782, 10, 178, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4783, 10, 242, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4784, 10, 306, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4785, 10, 370, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4786, 10, 434, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4787, 10, 49, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4788, 10, 113, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4789, 10, 177, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4790, 10, 241, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4791, 10, 305, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4792, 10, 369, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4793, 10, 433, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4794, 10, 52, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4795, 10, 116, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4796, 10, 180, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4797, 10, 244, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4798, 10, 308, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4799, 10, 372, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4800, 10, 436, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4801, 10, 53, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4802, 10, 117, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4803, 10, 181, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4804, 10, 245, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4805, 10, 309, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4806, 10, 373, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4807, 10, 437, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4808, 10, 29, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4809, 10, 285, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4810, 10, 349, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4811, 10, 31, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4812, 10, 287, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4813, 10, 351, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4814, 10, 32, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4815, 10, 96, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4816, 10, 160, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4817, 10, 224, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4818, 10, 288, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4819, 10, 352, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4820, 10, 416, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4821, 10, 33, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4822, 10, 97, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4823, 10, 161, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4824, 10, 225, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4825, 10, 289, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4826, 10, 353, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4827, 10, 417, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4828, 10, 34, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4829, 10, 98, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4830, 10, 162, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4831, 10, 226, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4832, 10, 290, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4833, 10, 354, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4834, 10, 418, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4835, 10, 35, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4836, 10, 99, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4837, 10, 163, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4838, 10, 227, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4839, 10, 291, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4840, 10, 355, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4841, 10, 419, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4842, 10, 36, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4843, 10, 100, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4844, 10, 164, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4845, 10, 228, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4846, 10, 292, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4847, 10, 356, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4848, 10, 420, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4849, 10, 37, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4850, 10, 101, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4851, 10, 165, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4852, 10, 229, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4853, 10, 293, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4854, 10, 357, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4855, 10, 421, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4856, 10, 38, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4857, 10, 102, 0, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4858, 10, 166, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4859, 10, 230, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4860, 10, 294, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4861, 10, 358, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4862, 10, 422, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4863, 10, 39, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4864, 10, 103, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4865, 10, 167, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4866, 10, 231, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4867, 10, 295, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4868, 10, 359, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4869, 10, 423, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4870, 10, 40, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4871, 10, 104, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4872, 10, 168, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4873, 10, 232, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4874, 10, 296, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4875, 10, 360, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4876, 10, 424, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4877, 10, 41, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4878, 10, 105, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4879, 10, 169, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4880, 10, 233, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4881, 10, 297, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4882, 10, 361, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4883, 10, 425, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4884, 10, 43, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4885, 10, 107, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4886, 10, 171, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4887, 10, 235, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4888, 10, 299, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4889, 10, 363, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4890, 10, 427, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4891, 10, 44, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4892, 10, 108, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4893, 10, 172, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4894, 10, 236, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4895, 10, 300, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4896, 10, 364, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4897, 10, 428, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4898, 10, 45, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4899, 10, 109, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4900, 10, 173, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4901, 10, 237, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4902, 10, 301, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4903, 10, 365, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4904, 10, 429, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4905, 10, 46, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4906, 10, 110, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4907, 10, 174, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4908, 10, 238, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4909, 10, 302, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4910, 10, 366, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4911, 10, 430, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4912, 10, 47, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4913, 10, 111, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4914, 10, 175, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4915, 10, 239, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4916, 10, 303, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4917, 10, 367, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4918, 10, 431, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4919, 10, 54, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4920, 10, 118, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4921, 10, 182, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4922, 10, 246, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4923, 10, 310, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4924, 10, 374, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4925, 10, 438, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4926, 10, 55, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4927, 10, 119, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4928, 10, 183, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4929, 10, 247, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4930, 10, 311, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4931, 10, 375, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4932, 10, 439, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4933, 10, 56, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4934, 10, 120, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4935, 10, 184, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4936, 10, 248, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4937, 10, 312, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4938, 10, 376, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4939, 10, 440, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4940, 10, 57, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4941, 10, 121, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4942, 10, 185, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4943, 10, 249, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4944, 10, 313, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4945, 10, 377, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4946, 10, 441, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4947, 10, 58, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4948, 10, 122, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4949, 10, 186, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4950, 10, 250, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4951, 10, 314, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4952, 10, 378, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4953, 10, 442, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4954, 10, 59, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4955, 10, 123, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4956, 10, 187, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4957, 10, 251, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4958, 10, 315, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4959, 10, 379, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4960, 10, 443, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4961, 10, 60, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4962, 10, 124, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4963, 10, 188, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4964, 10, 252, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4965, 10, 316, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4966, 10, 380, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4967, 10, 444, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4968, 10, 61, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4969, 10, 125, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4970, 10, 189, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4971, 10, 253, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4972, 10, 317, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4973, 10, 381, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4974, 10, 445, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4975, 10, 62, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4976, 10, 126, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4977, 10, 190, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4978, 10, 254, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4979, 10, 318, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4980, 10, 382, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4981, 10, 446, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4982, 10, 63, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4983, 10, 127, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4984, 10, 191, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4985, 10, 255, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4986, 10, 319, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4987, 10, 383, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4988, 10, 447, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4989, 10, 64, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4990, 10, 128, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4991, 10, 192, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4992, 10, 256, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4993, 10, 320, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4994, 10, 384, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4995, 10, 448, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4996, 10, 449, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4997, 10, 450, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4998, 10, 451, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (4999, 10, 452, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5000, 10, 453, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5001, 10, 454, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5002, 10, 455, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5003, 10, 462, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5004, 10, 461, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5005, 10, 460, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5006, 10, 459, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5007, 10, 458, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5008, 10, 457, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5009, 10, 456, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5010, 10, 999, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5011, 10, 991, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5012, 10, 992, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5013, 10, 993, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5014, 1, 501, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5015, 1, 502, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5016, 1, 503, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5017, 1, 504, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5018, 1, 505, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5019, 1, 506, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5020, 1, 507, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5021, 1, 601, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5022, 1, 602, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5023, 1, 603, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5024, 1, 604, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5025, 1, 605, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5026, 1, 606, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5027, 1, 607, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5028, 1, 1000, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5029, 1, 1001, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5030, 1, 1002, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5031, 1, 1003, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5032, 1, 1004, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5033, 1, 1005, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5034, 1, 1006, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5035, 1, 1007, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5036, 1, 1008, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5037, 1, 1009, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5038, 1, 1010, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5039, 1, 1011, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5040, 1, 1012, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5041, 1, 1013, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5042, 1, 1014, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5043, 1, 1015, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5044, 1, 1016, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5045, 1, 1017, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5046, 1, 1018, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5047, 1, 1019, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5048, 1, 1020, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5049, 1, 1021, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5050, 1, 1022, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5051, 1, 1023, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5052, 1, 1024, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5053, 1, 1025, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5054, 1, 1026, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5055, 1, 1027, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5056, 1, 1028, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5057, 1, 1029, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5058, 1, 1030, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5059, 1, 1031, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5060, 1, 1032, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5061, 1, 1033, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5062, 1, 1034, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5063, 1, 1035, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5064, 1, 1036, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5065, 1, 1037, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5066, 1, 1038, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5067, 1, 1039, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5068, 1, 1040, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5069, 1, 1041, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5070, 1, 1048, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5071, 1, 1047, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5072, 1, 1046, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5073, 1, 1045, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5074, 1, 1044, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5075, 1, 1043, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5076, 1, 1042, 1, NULL, NULL)
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5077, 1, 1049, 1, NULL, N'20')
GO
INSERT [dbo].[Sec_UsersFunctions] ([ID], [PermissionTypeId], [FormFunctionID], [Selected], [SecUserUserId], [FunValue]) VALUES (5078, 1, 1050, 1, NULL, N'10')
GO
--end____________________________ 

--begin____________________________
SET IDENTITY_INSERT [dbo].[Setting] ON 
GO
INSERT [dbo].[Setting] ([SettingID], [SettingName], [DefaultValue], [date]) VALUES (1, N'هويه مواطن  1هجري  2ميلادي', N'1', CAST(N'2025-01-07T01:54:07.4470000' AS DateTime2))
GO
INSERT [dbo].[Setting] ([SettingID], [SettingName], [DefaultValue], [date]) VALUES (2, N'هويه مقيم  1هجري  2ميلادي', N'1', CAST(N'2025-01-07T01:54:43.8730000' AS DateTime2))
GO
INSERT [dbo].[Setting] ([SettingID], [SettingName], [DefaultValue], [date]) VALUES (3, N'هويه الخليجيين  1هجري  2ميلادي', N'2', CAST(N'2025-01-07T01:55:02.6530000' AS DateTime2))
GO
INSERT [dbo].[Setting] ([SettingID], [SettingName], [DefaultValue], [date]) VALUES (4, N'جواز السفر  1هجري  2ميلادي', N'2', CAST(N'2025-01-07T01:55:25.4030000' AS DateTime2))
GO
INSERT [dbo].[Setting] ([SettingID], [SettingName], [DefaultValue], [date]) VALUES (5, N'تاشيرات  1هجري  2ميلادي', N'2', CAST(N'2025-01-07T01:55:45.7500000' AS DateTime2))
GO
INSERT [dbo].[Setting] ([SettingID], [SettingName], [DefaultValue], [date]) VALUES (6, N'التواريخ الاخري  1هجري  2ميلادي', N'2', CAST(N'2025-01-07T01:56:04.1200000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Setting] OFF
GO
--end____________________________



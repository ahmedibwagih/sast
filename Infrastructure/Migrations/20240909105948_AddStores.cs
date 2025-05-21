using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddStores : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
			migrationBuilder.Sql(@"create Proc [dbo].[Exchange_CurrenciesBalance] @date as datetime ='2023-01-01 23:59:59',@branchId as int =1
,@Userid as int=2244,@Type as int =3 --1 total  --2 in box 3-in cashiers --4 in Specific chashier
as
if (@Type = 1 or @Type = 2 )
begin 
--total
--drop table #balanceInTotal
select 
c.CurrencyCode
,c.CurrencyNameAr
,convert (decimal(18,4), bvr.Balance) Balance
,convert (decimal(18,4),bvr.Rate) Rate 
, convert (decimal(18,4),bvr.Balance * bvr.Rate) TotalBalance  
,ActionTime 
into #balanceInTotal
from EX_CurrenciesBVR bvr inner join Currencies c on c.CurrencyID = bvr.CurrencyID 
where 
 bvr.id in (select max (bvr2.id) from EX_CurrenciesBVR bvr2 inner join Currencies c2 on c2.CurrencyID = bvr2.CurrencyID 
			--where c2.BranchID  = 1 and bvr2.ActionTime <= '2023-01-01 23:59:59'
			where c2.BranchID  = @branchId and bvr2.ActionTime <= @date
			group by c2.CurrencyCode,c2.CurrencyNameAr  )
 order by CurrencyCode

 if (@Type = 1)
  begin select *, 'الاجمالي' as [Type] from #balanceInTotal  end
 end 
--With Cashiers = internaltrans - invoices
if (@Type = 3 or  @Type = 2  )
begin
--drop table #balanceInCashier
--drop table #balanceInCashier2
 --كل التحويلات الباقيه معاه داخليه  + عليات البيع والشراء التي تم تنفيذها
 select *  into #balanceInCashier from 
 (
	select id.TransferAmount ,id.CurrencyID,id.TransferType,i.TransferDate as ActionTime
	from EX_InternalTransfers i 
	inner join EX_InternalTransfersDetails id on id.TransferID = i.TransferID
	where i.BranchID  =  @branchId and id.TransferTime <= @date 
	--where i.BranchID  = 1 and id.TransferTime <= '2023-01-01 23:59:59' and i.UserId =2244
  union all
	select id.Amount ,id.CurrencyID,i.InvoiceTypeID,i.InvoiceTime
	from EX_Invoices i 
	inner join EX_InvoicesDetails id on id.InvoiceID = i.InvoiceID
	where i.BranchID  =  @branchId and i.InvoiceTime <= @date 
	--where i.BranchID  = 1 and i.InvoiceTime <= '2023-01-01 23:59:59' and i.UserId =2244
	  union all
	select id.Amount ,id.CurrencyID,i.InvoiceTypeID,i.InvoiceTime
	from EX_WholeInvoices i 
	inner join EX_WholeInvoicesDetails id on id.InvoiceID = i.InvoiceID
	where i.BranchID  = @branchId and i.InvoiceTime <= @date 
	--where i.BranchID  = 1 and i.InvoiceTime <= '2023-01-01 23:59:59' and i.UserId =2244
 )aa

  select c.CurrencyCode,c.CurrencyNameAr  
 , convert (decimal(18,4),sum(id.TransferAmount * (case when id.TransferType = 1then -1 else 1 end))) Balance  ,convert (decimal(18,4),sum(c.SalePrice)) Rate
 ,   convert (decimal(18,4),sum(id.TransferAmount * (case when id.TransferType = 1then -1 else 1 end))) * convert (decimal(18,4),sum(c.SalePrice)) TotalBalance
 ,max(id.ActionTime) ActionTime
 into #balanceInCashier2
 from #balanceInCashier id 
 inner join Currencies c on c.CurrencyID = id.CurrencyID 
 group by c.CurrencyCode,c.CurrencyNameAr 
  order by c.CurrencyCode

   if (@Type = 3)
 begin  select *, 'كل الصرافين' as [Type] from #balanceInCashier2  order by CurrencyCode end
end 

--specific cashier
if (@Type = 4 )
begin
 --كل التحويلات الباقيه معاه داخليه  + عليات البيع والشراء التي تم تنفيذها
 select *  into #balanceInCashier3 from 
 (
	select id.TransferAmount ,id.CurrencyID,id.TransferType,i.TransferDate as ActionTime
	from EX_InternalTransfers i 
	inner join EX_InternalTransfersDetails id on id.TransferID = i.TransferID
	where i.BranchID  =  @branchId and id.TransferTime <= @date and i.UserId =@Userid
	--where i.BranchID  = 1 and id.TransferTime <= '2023-01-01 23:59:59' and i.UserId =2244
  union all
	select id.Amount ,id.CurrencyID,i.InvoiceTypeID,i.InvoiceTime
	from EX_Invoices i 
	inner join EX_InvoicesDetails id on id.InvoiceID = i.InvoiceID
	where i.BranchID  =  @branchId and i.InvoiceTime <= @date and i.UserId =@Userid
	--where i.BranchID  = 1 and i.InvoiceTime <= '2023-01-01 23:59:59' and i.UserId =2244
	  union all
	select id.Amount ,id.CurrencyID,i.InvoiceTypeID,i.InvoiceTime
	from EX_WholeInvoices i 
	inner join EX_WholeInvoicesDetails id on id.InvoiceID = i.InvoiceID
	where i.BranchID  = @branchId and i.InvoiceTime <= @date and i.UserId =@Userid
	--where i.BranchID  = 1 and i.InvoiceTime <= '2023-01-01 23:59:59' and i.UserId =2244
 )aa

  select c.CurrencyCode,c.CurrencyNameAr  
 , convert (decimal(18,4),sum(id.TransferAmount * (case when id.TransferType = 1then -1 else 1 end))) Balance  ,convert (decimal(18,4),sum(c.SalePrice)) Rate
 ,   convert (decimal(18,4),sum(id.TransferAmount * (case when id.TransferType = 1then -1 else 1 end))) * convert (decimal(18,4),sum(c.SalePrice)) TotalBalance
 ,max(id.ActionTime) ActionTime
 into #balanceInCashier4
 from #balanceInCashier3 id 
 inner join Currencies c on c.CurrencyID = id.CurrencyID 
 group by c.CurrencyCode,c.CurrencyNameAr 
  order by c.CurrencyCode

  select *, 'صراف رقم ' + convert(nvarchar(50),@Userid)  as [Type] from #balanceInCashier4  order by CurrencyCode
end 


  --in  box  = BVR - In casier

  --drop table #balanceInSandook
 --كل التحويلات الباقيه معاه داخليه  + عليات البيع والشراء التي تم تنفيذها
 if (@Type = 2 )
 begin
 select  CurrencyCode	,CurrencyNameAr	,sum(Balance)	Balance,max(Rate) Rate,sum(TotalBalance) TotalBalance,max(ActionTime) ActionTime
 into #balanceInSandook
   from 
 (
select CurrencyCode	,CurrencyNameAr	,Balance	,Rate	,TotalBalance	,ActionTime from #balanceInTotal
union all 
select CurrencyCode	,CurrencyNameAr	,-1 * Balance	,Rate	,-1 *TotalBalance	,ActionTime from #balanceInCashier2
) main group by CurrencyCode	,CurrencyNameAr 


select *, 'في الصندوق' as [Type]  from #balanceInSandook  order by CurrencyCode
end");




			migrationBuilder.Sql(@"create Proc [dbo].[Exchange_CurrencyMovement] 
@Fdate as datetime ='2003-01-01 23:59:59'
,@Tdate as datetime ='2025-01-01 23:59:59'
,@branchId as int =1
as
	select bvr.CurrencyID,c.CurrencyCode ,c.CurrencyNameAr  , max(bvr.ID) MaxID , min(bvr.ID) MinID  
	,sum(case when bvr.Amount > 0 then  bvr.Amount else 0 end) buy
	,sum(case when bvr.Amount <= 0 then  bvr.Amount else 0 end) sale
	into #main
	from EX_CurrenciesBVR bvr
	inner join Currencies c on c.CurrencyID = bvr.CurrencyID
	where bvr.ActionTime between @Fdate and @Tdate
	and c.BranchID=@branchId 
	group by bvr.CurrencyID ,c.CurrencyCode, c.BranchID,c.CurrencyNameAr 

	select c.CurrencyCode,c.CurrencyNameAr ,Minbvr.Balance Prev_Balance ,c.buy Buy_Quantity,c.sale Sale_Quantity,Maxbvr.Balance current_Balance
	from #main c 
	inner  join EX_CurrenciesBVR Minbvr on Minbvr.ID= c.MinID
	inner join EX_CurrenciesBVR Maxbvr on Maxbvr.ID= c.MaxID
	order by c.CurrencyCode



");
            migrationBuilder.Sql(@"create Proc [dbo].[Exchange_Movement] 
@Fdate as datetime ='2003-01-01 23:59:59'
,@Tdate as datetime ='2025-01-01 23:59:59'
,@branchId as int =1
,@Userid as int=2244
as
	select i.InvoiceNo,t.InvoiceTypeNameAr,c.CurrencyNameAr
	,convert(decimal(18,4),id.ExRate) ExRate
	,convert(decimal(18,4),id.Amount) Amount
	,convert(decimal(18,4),id.Amount*id.ExRate) Total
	,isnull(u.UserNameAr,'') UserNameAr,i.InvoiceTime
,i.InvoiceID,brn.BranchNameAr , 'فواتير افراد' as [type]
	from EX_Invoices i 
	inner join EX_InvoicesDetails id on id.InvoiceID = i.InvoiceID
	inner join Currencies c on id.CurrencyID = c.CurrencyID
	inner join EX_InvoicesType t on t.InvoiceTypeID=i.InvoiceTypeID
	left join Sec_Users u on u.UserID = i.UserId
	inner join EX_Branches brn on brn.BranchID=i.BranchID
	where i.BranchID  = @branchId 
	and i.InvoiceTime >= @Fdate  and i.InvoiceTime <= @Tdate
	and i.UserId =coalesce(  @Userid,i.UserId)


");

            migrationBuilder.Sql(@"create Proc [dbo].[Exchange_WholeMovement] 
@Fdate as datetime ='2003-01-01 23:59:59'
,@Tdate as datetime ='2025-01-01 23:59:59'
,@branchId as int =1
,@Userid as int=null
as
	select i.InvoiceNo,t.InvoiceTypeNameAr,c.CurrencyNameAr
	,convert(decimal(18,4),id.SystemExRate) ExRate
	,convert(decimal(18,4),id.Amount) Amount
	,convert(decimal(18,4),id.Amount*id.SystemExRate) Total
	,isnull(u.UserNameAr,'') UserNameAr,i.InvoiceTime
	,i.InvoiceID,brn.BranchNameAr , 'فواتير جملة' as [type]
	from EX_wholeInvoices i 
	inner join EX_wholeInvoicesDetails id on id.InvoiceID = i.InvoiceID
	left join Currencies c on id.CurrencyID = c.CurrencyID
	inner join EX_InvoicesType t on t.InvoiceTypeID=i.InvoiceTypeID
	left join Sec_Users u on u.UserID = i.UserId
	inner join EX_Branches brn on brn.BranchID=i.BranchID
	where i.BranchID  = @branchId 
	and i.InvoiceTime >= @Fdate  and i.InvoiceTime <= @Tdate
	and i.UserId =coalesce(  @Userid,i.UserId)


");          
			
			migrationBuilder.Sql(@"create  Proc [dbo].[Exchange_WF_GetInputRequest] 
@Userid as int=2244
as
--declare @Userid as int=2244
select distinct r.* from WFRequest r inner join WFRequestType t on t.RequestTypeid = r.RequestTypeid
inner join WFListOfApprovals a1 on a1.BranchID =r.BranchID and a1.RequestTypeId = r.RequestTypeId 
--inner join
--(select min(ap.ActionOrder) ActionOrder,ap.RequestTypeId,ap.BranchID from WFListOfApprovals ap  	
--group by ap.RequestTypeId,ap.BranchID 
--)a2 on a1.BranchID =a2.BranchID and a1.RequestTypeId = a2.RequestTypeId and a1.ActionOrder = a2.ActionOrder 
where convert(nvarchar(50),a1.RequestTypeid)+'***' + convert(nvarchar(50),a1.BranchID)+'***' + convert(nvarchar(50),a1.ActionOrder) 
									not in  ( select convert(nvarchar(50),dd.RequestTypeid)+'***' + convert(nvarchar(50),dd.BranchID)+'***' + convert(nvarchar(50),d.ActionOrder) 
									from WFRequestDetails d inner join wfrequest dd on dd.RequestId  =d.RequestId where d.ActionType in (0,1) and d.RequestId = r.RequestId)

and isnull(r.IsCompleted,0) <> 1
and a1.UserId = case when @userid= 9999990
then (select max(t.OwnerId) from ExTreasuryTransfere e inner join Treasury t on t.TreasuryId=e.FromTreasuryId where e.TransferId=convert(int,r.EntityId))
when @userid=9999991
then (select max(t.OwnerId) from ExTreasuryTransfere e inner join Treasury t on t.TreasuryId=e.ToTreasuryId where e.TransferId=convert(int,r.EntityId))
when @userid=9999992
then (select max(t.managerid) from ExTreasuryTransfere e inner join EX_Branches t on t.branchid=e.frombranchid where e.TransferId=convert(int,r.EntityId))
when @userid=9999991
then (select max(t.managerid) from ExTreasuryTransfere e inner join EX_Branches t on t.branchid=e.tobranchid where e.TransferId=convert(int,r.EntityId))
else @userid end

");


        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("DROP PROCEDURE  Exchange_CurrenciesBalance");
			migrationBuilder.Sql("DROP PROCEDURE  Exchange_CurrencyMovement ");
			migrationBuilder.Sql("DROP PROCEDURE  Exchange_WholeMovement");
			migrationBuilder.Sql("DROP PROCEDURE  Exchange_Movement");
        }
    }
}

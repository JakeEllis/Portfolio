-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE A11 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

--turn off contraints
Alter Table Fact Drop Constraint FK_Fact_Customer_Dim
Alter Table Fact Drop Constraint FK_Fact_Rep_Dim
Alter Table Fact Drop Constraint FK_Fact_Part_Dim
Alter Table Fact Drop Constraint FK_Fact_Time_Dim
Alter Table Fact NoCheck Constraint ALL
Alter Table Customer_Dim NoCheck Constraint ALL
Alter Table Rep_Dim NoCheck Constraint ALL
Alter Table Part_Dim NoCheck Constraint ALL
Alter Table Time_Dim NoCheck Constraint ALL

--remove all rows
Truncate Table Fact
Truncate Table Customer_Dim
Truncate Table Rep_Dim
Truncate Table Part_Dim
Truncate Table Time_Dim

--turn contraints back on
Alter Table Customer_Dim Check Constraint ALL
Alter Table Rep_Dim Check Constraint ALL
Alter Table Part_Dim Check Constraint ALL
Alter Table Time_Dim Check Constraint ALL
Alter Table Fact Check Constraint ALL
Alter Table Fact
Add Constraint FK_Fact_Customer_Dim Foreign Key(CustomerKey) references Customer_Dim
Alter Table Fact
Add Constraint FK_Fact_Rep_Dim Foreign Key(RepKey) references Rep_Dim
Alter Table Fact
Add Constraint FK_Fact_Part_Dim Foreign Key(PartKey) references Part_Dim
Alter Table Fact
Add Constraint FK_Fact_Time_Dim Foreign Key(TimeKey) references Time_Dim

    -- Insert statements for procedure here

--place information into dimensional table
Insert Into Customer_Dim
Select	Customer_Num, Customer_Name, Street, City, State, Zip, Balance, Credit_Limit
From	Customer

Insert Into Rep_Dim
Select	Rep_Num, Last_Name, First_Name, Street, City, State, Zip, Commission, Rate
From	Rep

Insert Into Part_Dim
Select	Part_Num, Description, On_Hand, Class, Warehouse, Price
From Part

Insert Into Time_Dim (DateValue, Yearnum, MonthNum, DayNum)
Select Distinct Order_Date, Year(Order_Date), Month(Order_Date), Day(Order_Date)
From Orders

--create the temporary stage table
Create Table Stage
(
CustomerKey		Int,
Customer_Num	Int,
RepKey			Int,
Rep_Num			Int,
PartKey			Int,
Part_Num		varchar(10),
TimeKey			Int,
Order_Date		datetime,
Num_Ordered		Float,
Quoted_Price	Money
)

--insert transactional data to Stage
Insert Into	Stage (Customer_Num, Rep_Num, Part_Num, Order_Date, Num_Ordered, Quoted_Price)
Select		C.Customer_Num, R.Rep_Num, P.Part_Num, O.Order_Date, OL.Num_Ordered, OL.Quoted_Price
From		Rep R Inner Join Customer C On R.Rep_Num = C.Rep_Num 
			Inner Join Orders O On C.Customer_Num = O.Customer_Num
			Inner Join Order_Line OL On O.Order_Num = OL.Order_Num
			Inner Join Part P On OL.Part_Num = P.Part_Num

--update the stage table to sync with dimensional tables
Update	Stage
Set		CustomerKey = C.CustomerKey
From	Stage S Inner Join Customer_Dim C On S.Customer_Num = C.Customer_Num

Update	Stage
Set		RepKey = R.RepKey
From	Stage S Inner Join Rep_Dim R On S.Rep_Num = R.Rep_Num

Update	Stage
Set		PartKey = P.PartKey
From	Stage S Inner Join Part_Dim P On S.Part_Num = P.Part_Num

Update	Stage
Set		TimeKey = T.TimeKey
From	Stage S Inner Join Time_Dim T On S.Order_Date = T.DateValue


--place information from stage table into fact table
Insert Into	Fact
Select		CustomerKey, RepKey, Partkey, TimeKey, Num_Ordered, Quoted_Price
From		Stage

--drop stage table
Drop Table Stage

END
GO

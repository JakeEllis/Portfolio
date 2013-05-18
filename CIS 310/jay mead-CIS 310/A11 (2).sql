Drop Table Customer_Dim
Drop Table Rep_Dim
Drop Table Part_Dim
Drop Table Time_Dim
Drop Table Fact

Create Table Customer_Dim
(
CustomerKey		Int Identity(1,1) Not Null Primary Key,
Customer_Num	Int Not Null,
Customer_Name	nvarchar(35),
Street			nvarchar(15),
City			nvarchar(15),
State			nvarchar(2),
Zip				nvarchar(5),
Balance			money,
Credit_Limit	money
)

Create Table Rep_Dim
(
RepKey			Int Identity(1,1) Not Null Primary Key,
Rep_Num			Int Not Null,
Last_Name		nvarchar(15),
First_Name		nvarchar(15),
Street			nvarchar(15),
City			nvarchar(15),
State			nvarchar(2),
Zip				nvarchar(5),
Commision		money,
Rate			float
)

Create Table Part_Dim
(
PartKey			Int Identity(1,1) Not Null Primary Key,
Part_Num		varchar(10) Not Null,
Description		nvarchar(15),
On_Hand			float,
Class			nvarchar(2),
Warehouse		nvarchar(1),
Price			money
)

Create Table Time_Dim
(
TimeKey			Int Identity(1,1) Not Null Primary Key,
DateValue		datetime,
YearNum			int,
MonthNum		int,
DayNum			int
)

Create Table Fact
(
CustomerKey		Int Not Null,
RepKey			Int Not Null,
PartKey			Int Not Null,
TimeKey			Int Not Null,
Num_Ordered		Float,
Quoted_Price	Money
)

Alter Table Fact
Add Constraint FK_Fact_Customer_Dim Foreign Key(CustomerKey) references Customer_Dim
Alter Table Fact
Add Constraint FK_Fact_Rep_Dim Foreign Key(RepKey) references Rep_Dim
Alter Table Fact
Add Constraint FK_Fact_Part_Dim Foreign Key(PartKey) references Part_Dim
Alter Table Fact
Add Constraint FK_Fact_Time_Dim Foreign Key(TimeKey) references Time_Dim

Alter Table Fact
Add Constraint PK_Fact Primary Key (CustomerKey, RepKey, PartKey, TimeKey)


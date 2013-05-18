
Use CIS31033
Exec A11

--1. What is the average sale amount (quantity * price) by customer in the last 3 months?

Select	Customer_Name, AVG(Num_Ordered * Quoted_Price) As [Sale Amount]
From	Fact F Inner Join Customer_Dim C on F.CustomerKey = C.CustomerKey
		Inner Join Time_Dim T On F.TimeKey = T.TimeKey
Where	MonthNum In (11,10,9)
Group By Customer_Name

--Check with actual values and calculator to make sure average is correct
Select	Customer_Name, (Num_Ordered * Quoted_Price) As [Sale Amount]
From	Fact F Inner Join Customer_Dim C on F.CustomerKey = C.CustomerKey
		Inner Join Time_Dim T On F.TimeKey = T.TimeKey
Where	MonthNum In (11,10,9)
Group By Customer_Name, (Num_Ordered * Quoted_Price)

--2. For parts that have been sold to more than one customer list description and quantity of sale by month.

Select	Description, Num_Ordered, MonthNum, Count(Customer_Num) [Number of Customers Who Ordered Product]
From	Fact F Inner Join Customer_Dim C on F.CustomerKey = C.CustomerKey
		Inner Join Part_Dim P On F.PartKey = P.PartKey
		Inner Join Time_Dim T On F.TimeKey = T.TimeKey
Group By Description, Num_Ordered, MonthNum 
Having	 Count(Customer_Num) > 1
Order By MonthNum

--3. What is the total quantity of sale by rep in each city?. 

Select	R.Rep_Num, R.Last_Name, R.First_Name, R.City, F.Num_Ordered
From	Fact F Inner Join Rep_Dim R On F.RepKey = R.RepKey
Order By R.Rep_Num

Select	R.Rep_Num, R.Last_Name, R.First_Name, R.City, SUM(F.Num_Ordered) As [Total Items Sold]
From	Fact F Inner Join Rep_Dim R On F.RepKey = R.RepKey
Group By R.Rep_Num, R.Last_Name, R.First_Name, R.City
Order By R.Rep_Num
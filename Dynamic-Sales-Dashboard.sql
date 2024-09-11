select * from customer;

select * from date;

select * from geography;

select * from internetsales;

select * from product;

select * from productcategory;

select * from productsubcategory;

alter table customer add column customername varchar;

update customer set customername = case when middlename = 'NULL' then concat(firstname,' ',lastname) else concat(firstname, ' ', middlename, ' ', lastname) end;

select a.englishproductcategoryname as productcategoryname,
b.englishproductsubcategoryname as productsubcategoryname,
c.englishproductname as productname,
c.productkey
from 
productcategory as a
inner join
productsubcategory as b
on a.productcategorykey = b.productcategorykey
inner join
product as c
on b.productsubcategorykey = c.productsubcategorykey;

select a.customerkey,
a.geographykey,
a.customername,
b.geographykey,
b.city,
b.stateprovincename as state,
b.countryregioncode,
b.englishcountryregionname as country,
b.postalcode
from 
customer as a
inner join
geography as b
on a.geographykey = b.geographykey;

create table factinternetsales (ProductKey int,OrderDateKey int,DueDateKey int,ShipDateKey int,CustomerKey int,PromotionKey int,CurrencyKey int,SalesTerritoryKey int,SalesOrderNumber varchar,SalesOrderLineNumber int,RevisionNumber int,OrderQuantity int,UnitPrice numeric,ExtendedAmount numeric,UnitPriceDiscountPct int,DiscountAmount int,ProductStandardCost numeric,TotalProductCost numeric,SalesAmount numeric,TaxAmt numeric,Freight numeric);

copy factinternetsales from 'D:\Internshala Projects\TABLEAU\uncleaned data\FactInternetSales.csv' csv header;

select * from factinternetsales;

select a.ProductKey,
a.orderdatekey,
a.duedatekey,
a.shipdatekey,
a.customerkey,
a.salesordernumber,
a.salesamount,
b.englishdaynameofweek,
b.englishmonthname,
b.calendaryear,
b.calendarquarter
from factinternetsales as a 
full join
date as b on a.orderdatekey = b.DateKey where b.calendaryear in (2021,2022,2023);
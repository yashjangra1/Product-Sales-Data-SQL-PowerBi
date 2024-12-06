CREATE VIEW ProductSalesAnalysis AS(
select 
a.Product_ID,
a.Brand,
a.Category,
a.Sale_Price,
a.Cost_Price,
a.Description,
a.Image_url,
b.Customer_Type,
b.Country,
b.Units_Sold,
b.Discount_Band,
(Cost_Price*Units_Sold) as total_Cost,
(Sale_Price*Units_Sold) as Revenue,
FORMAT(date,'MMMM') as Month,
FORMAT(date,'yyyy') as Year
from
Product_data a
join product_sales b 
on a.Product_ID=b.Product)

select *,
(1-Discount*1.0/100)*Revenue as Discount_Revenue
from ProductSalesAnalysis a
join discount_data b
on a.Discount_Band=b.Discount_Band and a.Month=b.Month



--Виклик функції
SELECT * FROM laptops;
SELECT * FROM prices;
SELECT get_lp_with_dis();

--Виклик процедури
SELECT * FROM brands;
SELECT * FROM laptops;
CALL get_laptops_names('HP')

--Виклик тригеру
INSERT INTO laptops(brand_id, laptop_id, laptop_name) 
VALUES('0', '10', 'Notebook 14-df0015nx');
SELECT * FROM laptops
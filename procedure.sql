-- Процедура яка виводить всі ноутбуки вказаного бренду
DROP PROCEDURE IF EXISTS get_laptops_names(varchar(50));
CREATE OR REPLACE PROCEDURE get_laptops_names(brand_name_arg varchar(50))
LANGUAGE 'plpgsql'
AS $$
DECLARE record_brand brands.brand_name%TYPE;
DECLARE record_name laptops.laptop_name%TYPE;

BEGIN
    SELECT brand_name, laptop_name into record_brand, record_name from laptops 
    INNER JOIN brands ON brands.brand_id = laptops.brand_id 
    WHERE brand_name = brand_name_arg;
    RAISE INFO 'Brand_name: %,  Laptop_name: %', TRIM(record_brand), TRIM(record_name);
END;
$$;

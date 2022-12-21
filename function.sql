-- Функція яка виводить назву ноутбуків, які мають скидку.
DROP FUNCTION IF EXISTS get_lp_with_dis(); 
CREATE OR REPLACE FUNCTION get_lp_with_dis() 
    RETURNS TABLE (l_name varchar)
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
        SELECT laptop_name::varchar
    FROM laptops INNER JOIN prices ON prices.laptop_id = laptops.laptop_id 
    WHERE prices.discount_price < prices.old_price;
END;
$$;

-- Тригер який при додавані нового ноутбука, змінює переводить його
-- назву у верхній регістр.
DROP TRIGGER IF EXISTS trig ON laptops;
CREATE OR REPLACE FUNCTION upper_laptop_name() RETURNS TRIGGER AS
$$
    BEGIN
        UPDATE laptops
        SET laptop_name = UPPER(laptop_name)
        WHERE laptops.laptop_id = new.laptop_id;
    RETURN NEW;
    END;
$$
LANGUAGE 'plpgsql';
CREATE TRIGGER trig
AFTER INSERT ON laptops
FOR EACH ROW EXECUTE FUNCTION upper_laptop_name();
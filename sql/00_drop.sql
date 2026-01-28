-- 00_drop.sql
-- UWAGA: uruchamiać ostrożnie - usuwa wszystkie obiekty projektu.

DROP VIEW IF EXISTS v_top_products CASCADE;
DROP VIEW IF EXISTS v_order_summary CASCADE;

DROP TRIGGER IF EXISTS trg_update_order_total ON order_items;
DROP FUNCTION IF EXISTS fn_calculate_order_total(bigint);

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;

DROP ROLE IF EXISTS shop_admin;
DROP ROLE IF EXISTS shop_readonly;


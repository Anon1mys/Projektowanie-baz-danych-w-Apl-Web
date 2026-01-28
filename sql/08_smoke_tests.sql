-- 08_smoke_tests.sql
-- Proste zapytania testujące działanie schematu, widoków i triggerów

-- 1) Lista produktów z kategoriami
SELECT
  p.product_id,
  p.name AS product_name,
  c.name AS category_name,
  p.price,
  p.stock
FROM products p
JOIN categories c ON c.category_id = p.category_id
ORDER BY p.product_id
LIMIT 20;


-- 2) Widok v_order_summary
SELECT
  order_id,
  created_at,
  status,
  total_amount,
  customer_full_name,
  email,
  items_count,
  payment_status
FROM v_order_summary
ORDER BY order_id
LIMIT 20;


-- 3) Widok v_top_products
SELECT
  product_id,
  name,
  sku,
  total_sold_qty,
  total_revenue
FROM v_top_products
ORDER BY total_revenue DESC
LIMIT 10;


-- 4) Test triggera aktualizującego total_amount
--    (W praktyce najlepiej wykonać w transakcji testowej)

BEGIN;

-- Tworzymy małe testowe zamówienie
INSERT INTO orders (user_id, shipping_address)
VALUES (1, 'Adres testowy 123, 00-000 Miasto')
RETURNING order_id;

-- Zakładamy, że powyższy insert zwrócił np. order_id = X (sprawdzić w kliencie SQL)
-- Dla przykładu tu używamy zmiennej w psql:
-- \gset
-- INSERT INTO order_items (order_id, product_id, quantity, unit_price)
-- VALUES (:order_id, 1, 2, 1999.00);

-- Następnie:
-- SELECT total_amount FROM orders WHERE order_id = :order_id;

-- Jeśli trigger działa poprawnie, total_amount powinno być równe quantity * unit_price.

ROLLBACK;


-- 5) Przykłady zapytań z rolami (do wykonania jako komentarz)

-- Przełączenie na rolę tylko do odczytu:
-- SET ROLE shop_readonly;
-- SELECT * FROM v_order_summary LIMIT 5;
-- SELECT * FROM products LIMIT 5;

-- Przełączenie na rolę administracyjną:
-- SET ROLE shop_admin;
-- INSERT INTO categories (name) VALUES ('Testowa kategoria z roli admin');


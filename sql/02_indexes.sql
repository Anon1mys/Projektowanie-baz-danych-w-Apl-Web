-- 02_indexes.sql
-- Indeksy pomocnicze

-- Indeksy na kluczach obcych
CREATE INDEX IF NOT EXISTS idx_products_category_id
  ON products(category_id);

CREATE INDEX IF NOT EXISTS idx_orders_user_id
  ON orders(user_id);

CREATE INDEX IF NOT EXISTS idx_order_items_order_id
  ON order_items(order_id);

CREATE INDEX IF NOT EXISTS idx_order_items_product_id
  ON order_items(product_id);

CREATE INDEX IF NOT EXISTS idx_payments_order_id
  ON payments(order_id);

-- Indeks po nazwie produktu (wyszukiwanie)
CREATE INDEX IF NOT EXISTS idx_products_name
  ON products(name);


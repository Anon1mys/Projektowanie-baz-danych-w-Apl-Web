-- 05_views.sql
-- Widoki raportowe

CREATE OR REPLACE VIEW v_order_summary AS
SELECT
  o.order_id,
  o.created_at,
  o.status,
  o.total_amount,
  (u.first_name || ' ' || u.last_name) AS customer_full_name,
  u.email,
  COALESCE(oi.items_count, 0) AS items_count,
  p.status AS payment_status
FROM orders o
JOIN users u ON u.user_id = o.user_id
LEFT JOIN (
  SELECT order_id, COUNT(*) AS items_count
  FROM order_items
  GROUP BY order_id
) oi ON oi.order_id = o.order_id
LEFT JOIN payments p ON p.order_id = o.order_id;


CREATE OR REPLACE VIEW v_top_products AS
SELECT
  p.product_id,
  p.name,
  p.sku,
  COALESCE(SUM(oi.quantity), 0) AS total_sold_qty,
  COALESCE(SUM(oi.line_total), 0) AS total_revenue
FROM products p
LEFT JOIN order_items oi ON oi.product_id = p.product_id
LEFT JOIN orders o ON o.order_id = oi.order_id
  AND o.status IN ('NEW', 'PAID', 'SHIPPED', 'CANCELLED') -- all orders for statistics
GROUP BY p.product_id, p.name, p.sku
ORDER BY total_revenue DESC;


-- 06_permissions.sql
-- Role i uprawnienia

-- Uwaga: w Supabase to polecenie należy uruchomić jako rola posiadająca
-- uprawnienia do tworzenia ról (np. postgres / właściciel bazy).

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'shop_admin') THEN
    CREATE ROLE shop_admin LOGIN PASSWORD 'shop_admin_password_change_me';
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'shop_readonly') THEN
    CREATE ROLE shop_readonly LOGIN PASSWORD 'shop_readonly_password_change_me';
  END IF;
END;
$$;

-- Uprawnienia dla shop_admin
GRANT ALL PRIVILEGES ON TABLE
  users,
  categories,
  products,
  orders,
  order_items,
  payments
TO shop_admin;

GRANT ALL PRIVILEGES ON SEQUENCE
  users_user_id_seq,
  categories_category_id_seq,
  products_product_id_seq,
  orders_order_id_seq,
  order_items_order_item_id_seq,
  payments_payment_id_seq
TO shop_admin;

GRANT EXECUTE ON FUNCTION fn_calculate_order_total(BIGINT) TO shop_admin;

-- Uprawnienia dla shop_readonly (tylko odczyt)
GRANT SELECT ON TABLE
  users,
  categories,
  products,
  orders,
  order_items,
  payments
TO shop_readonly;

GRANT SELECT ON TABLE
  v_order_summary,
  v_top_products
TO shop_readonly;

-- W razie potrzeby można dać też execute na funkcję
GRANT EXECUTE ON FUNCTION fn_calculate_order_total(BIGINT) TO shop_readonly;


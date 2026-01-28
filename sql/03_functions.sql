-- 03_functions.sql
-- Funkcje pomocnicze

CREATE OR REPLACE FUNCTION fn_calculate_order_total(p_order_id BIGINT)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
  v_total NUMERIC(12,2);
BEGIN
  SELECT COALESCE(SUM(line_total), 0)
  INTO v_total
  FROM order_items
  WHERE order_id = p_order_id;

  RETURN v_total;
END;
$$;


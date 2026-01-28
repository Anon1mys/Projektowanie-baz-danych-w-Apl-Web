-- 04_triggers.sql
-- Triggery bazujące na funkcji fn_calculate_order_total

CREATE OR REPLACE FUNCTION trg_update_order_total_fn()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  v_order_id BIGINT;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN
    v_order_id := NEW.order_id;
  ELSIF (TG_OP = 'DELETE') THEN
    v_order_id := OLD.order_id;
  END IF;

  UPDATE orders
  SET total_amount = fn_calculate_order_total(v_order_id)
  WHERE order_id = v_order_id;

  RETURN NULL;
END;
$$;

DROP TRIGGER IF EXISTS trg_update_order_total ON order_items;

CREATE TRIGGER trg_update_order_total
AFTER INSERT OR UPDATE OR DELETE ON order_items
FOR EACH ROW
EXECUTE FUNCTION trg_update_order_total_fn();


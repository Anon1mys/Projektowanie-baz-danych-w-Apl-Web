-- 01_schema.sql
-- Definicje tabel dla sklepu internetowego

CREATE TABLE users (
  user_id      BIGSERIAL PRIMARY KEY,
  first_name   VARCHAR(50)  NOT NULL,
  last_name    VARCHAR(50)  NOT NULL,
  email        VARCHAR(120) NOT NULL UNIQUE,
  phone        VARCHAR(30),
  created_at   TIMESTAMPTZ  NOT NULL DEFAULT now()
);

CREATE TABLE categories (
  category_id  BIGSERIAL PRIMARY KEY,
  name         VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE products (
  product_id   BIGSERIAL PRIMARY KEY,
  category_id  BIGINT      NOT NULL,
  name         VARCHAR(140) NOT NULL,
  sku          VARCHAR(40)  NOT NULL UNIQUE,
  price        NUMERIC(12,2) NOT NULL CHECK (price >= 0),
  stock        INT           NOT NULL CHECK (stock >= 0),
  is_active    BOOLEAN       NOT NULL DEFAULT TRUE,
  created_at   TIMESTAMPTZ   NOT NULL DEFAULT now(),
  CONSTRAINT fk_products_category
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
  order_id         BIGSERIAL PRIMARY KEY,
  user_id          BIGINT      NOT NULL,
  status           VARCHAR(20) NOT NULL DEFAULT 'NEW'
                   CHECK (status IN ('NEW','PAID','SHIPPED','CANCELLED')),
  shipping_address TEXT        NOT NULL,
  total_amount     NUMERIC(12,2) NOT NULL DEFAULT 0,
  created_at       TIMESTAMPTZ   NOT NULL DEFAULT now(),
  CONSTRAINT fk_orders_user
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE order_items (
  order_item_id BIGSERIAL PRIMARY KEY,
  order_id      BIGINT NOT NULL,
  product_id    BIGINT NOT NULL,
  quantity      INT    NOT NULL CHECK (quantity > 0),
  unit_price    NUMERIC(12,2) NOT NULL CHECK (unit_price >= 0),
  line_total    NUMERIC(12,2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
  CONSTRAINT fk_order_items_order
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
  CONSTRAINT fk_order_items_product
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
  payment_id  BIGSERIAL PRIMARY KEY,
  order_id    BIGINT      NOT NULL UNIQUE,
  provider    VARCHAR(40) NOT NULL DEFAULT 'card',
  status      VARCHAR(20) NOT NULL DEFAULT 'PENDING'
              CHECK (status IN ('PENDING','PAID','FAILED','REFUNDED')),
  paid_at     TIMESTAMPTZ,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  CONSTRAINT fk_payments_order
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);


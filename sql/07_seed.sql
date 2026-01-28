-- 07_seed.sql
-- Dane testowe (deterministyczne)

TRUNCATE TABLE payments RESTART IDENTITY CASCADE;
TRUNCATE TABLE order_items RESTART IDENTITY CASCADE;
TRUNCATE TABLE orders RESTART IDENTITY CASCADE;
TRUNCATE TABLE products RESTART IDENTITY CASCADE;
TRUNCATE TABLE categories RESTART IDENTITY CASCADE;
TRUNCATE TABLE users RESTART IDENTITY CASCADE;

-- Użytkownicy (20)
INSERT INTO users (first_name, last_name, email, phone) VALUES
('Jan', 'Kowalski', 'jan.kowalski@example.com', '111-111-111'),
('Anna', 'Nowak', 'anna.nowak@example.com', '222-222-222'),
('Piotr', 'Wiśniewski', 'piotr.wisniewski@example.com', '333-333-333'),
('Katarzyna', 'Wójcik', 'katarzyna.wojcik@example.com', '444-444-444'),
('Tomasz', 'Kozłowski', 'tomasz.kozlowski@example.com', '555-555-555'),
('Magdalena', 'Jankowska', 'magdalena.jankowska@example.com', '666-666-666'),
('Michał', 'Mazur', 'michal.mazur@example.com', '777-777-777'),
('Agnieszka', 'Krawczyk', 'agnieszka.krawczyk@example.com', '888-888-888'),
('Paweł', 'Zieliński', 'pawel.zielinski@example.com', '999-999-999'),
('Ewa', 'Szymańska', 'ewa.szymanska@example.com', '000-000-000'),
('Adam', 'Kaczmarek', 'adam.kaczmarek@example.com', NULL),
('Joanna', 'Piotrowska', 'joanna.piotrowska@example.com', NULL),
('Marcin', 'Grabowski', 'marcin.grabowski@example.com', NULL),
('Karolina', 'Pawlak', 'karolina.pawlak@example.com', NULL),
('Rafał', 'Michalski', 'rafal.michalski@example.com', NULL),
('Dorota', 'Król', 'dorota.krol@example.com', NULL),
('Łukasz', 'Wieczorek', 'lukasz.wieczorek@example.com', NULL),
('Natalia', 'Nowicka', 'natalia.nowicka@example.com', NULL),
('Grzegorz', 'Dudek', 'grzegorz.dudek@example.com', NULL),
('Monika', 'Olszewska', 'monika.olszewska@example.com', NULL);

-- Kategorie (10)
INSERT INTO categories (name) VALUES
('Elektronika'),
('Książki'),
('Odzież'),
('Dom i ogród'),
('Sport'),
('Uroda'),
('Zabawki'),
('AGD'),
('Komputery'),
('Muzyka i filmy');

-- Produkty (60, po 6 w każdej kategorii)
INSERT INTO products (category_id, name, sku, price, stock, is_active) VALUES
-- Elektronika (category_id = 1)
(1, 'Smartfon A1', 'EL-001', 1999.00, 50, TRUE),
(1, 'Smartfon B2', 'EL-002', 1499.00, 30, TRUE),
(1, 'Słuchawki bezprzewodowe X', 'EL-003', 299.99, 100, TRUE),
(1, 'Telewizor 40"', 'EL-004', 1299.00, 20, TRUE),
(1, 'Głośnik Bluetooth', 'EL-005', 199.99, 80, TRUE),
(1, 'Powerbank 10000mAh', 'EL-006', 99.99, 120, TRUE),
-- Książki (2)
(2, 'Podstawy programowania', 'BK-001', 79.90, 40, TRUE),
(2, 'Zaawansowane SQL', 'BK-002', 89.90, 35, TRUE),
(2, 'Algorytmy w praktyce', 'BK-003', 99.90, 25, TRUE),
(2, 'Wprowadzenie do AI', 'BK-004', 109.90, 20, TRUE),
(2, 'JavaScript dla każdego', 'BK-005', 69.90, 45, TRUE),
(2, 'React w akcji', 'BK-006', 119.90, 15, TRUE),
-- Odzież (3)
(3, 'Koszulka biały M', 'CL-001', 39.90, 60, TRUE),
(3, 'Koszulka czarny L', 'CL-002', 39.90, 55, TRUE),
(3, 'Spodnie jeans M', 'CL-003', 149.90, 40, TRUE),
(3, 'Bluza z kapturem L', 'CL-004', 129.90, 30, TRUE),
(3, 'Kurtka zimowa XL', 'CL-005', 299.90, 20, TRUE),
(3, 'Skarpetki 3-pak', 'CL-006', 19.90, 100, TRUE),
-- Dom i ogród (4)
(4, 'Poduszka dekoracyjna', 'HM-001', 29.90, 70, TRUE),
(4, 'Zestaw kubków 4 szt.', 'HM-002', 49.90, 50, TRUE),
(4, 'Lampa stojąca', 'HM-003', 199.90, 25, TRUE),
(4, 'Dywan 160x230', 'HM-004', 249.90, 15, TRUE),
(4, 'Komplet pościeli 160x200', 'HM-005', 159.90, 35, TRUE),
(4, 'Zasłony 2 szt.', 'HM-006', 89.90, 40, TRUE),
-- Sport (5)
(5, 'Piłka nożna', 'SP-001', 79.90, 60, TRUE),
(5, 'Piłka do koszykówki', 'SP-002', 89.90, 40, TRUE),
(5, 'Hantle 2x5kg', 'SP-003', 129.90, 30, TRUE),
(5, 'Mata do jogi', 'SP-004', 59.90, 70, TRUE),
(5, 'Bidon sportowy', 'SP-005', 24.90, 90, TRUE),
(5, 'Ręcznik szybkoschnący', 'SP-006', 39.90, 50, TRUE),
-- Uroda (6)
(6, 'Krem nawilżający', 'BT-001', 59.90, 50, TRUE),
(6, 'Szampon do włosów', 'BT-002', 29.90, 80, TRUE),
(6, 'Perfumy damskie', 'BT-003', 199.90, 25, TRUE),
(6, 'Perfumy męskie', 'BT-004', 199.90, 25, TRUE),
(6, 'Zestaw kosmetyczny', 'BT-005', 149.90, 30, TRUE),
(6, 'Mydło naturalne', 'BT-006', 14.90, 100, TRUE),
-- Zabawki (7)
(7, 'Klocki konstrukcyjne', 'TO-001', 99.90, 40, TRUE),
(7, 'Lalka klasyczna', 'TO-002', 79.90, 35, TRUE),
(7, 'Samochód zdalny', 'TO-003', 129.90, 30, TRUE),
(7, 'Puzzle 1000 elementów', 'TO-004', 49.90, 45, TRUE),
(7, 'Gra planszowa rodzinna', 'TO-005', 89.90, 30, TRUE),
(7, 'Pluszowy miś', 'TO-006', 39.90, 50, TRUE),
-- AGD (8)
(8, 'Czajnik elektryczny', 'AP-001', 129.90, 35, TRUE),
(8, 'Toster 2-kieszeniowy', 'AP-002', 99.90, 30, TRUE),
(8, 'Blender ręczny', 'AP-003', 149.90, 25, TRUE),
(8, 'Mikser kuchenny', 'AP-004', 199.90, 20, TRUE),
(8, 'Odkurzacz pionowy', 'AP-005', 399.90, 15, TRUE),
(8, 'Żelazko parowe', 'AP-006', 159.90, 25, TRUE),
-- Komputery (9)
(9, 'Laptop 14" Basic', 'PC-001', 2999.00, 15, TRUE),
(9, 'Laptop 15" Pro', 'PC-002', 4999.00, 10, TRUE),
(9, 'Mysz bezprzewodowa', 'PC-003', 79.90, 80, TRUE),
(9, 'Klawiatura mechaniczna', 'PC-004', 299.90, 30, TRUE),
(9, 'Monitor 24"', 'PC-005', 699.90, 20, TRUE),
(9, 'Monitor 27"', 'PC-006', 999.90, 15, TRUE),
-- Muzyka i filmy (10)
(10, 'Płyta CD - Rock', 'MF-001', 39.90, 40, TRUE),
(10, 'Płyta CD - Pop', 'MF-002', 39.90, 35, TRUE),
(10, 'Winyl - Jazz', 'MF-003', 79.90, 20, TRUE),
(10, 'Winyl - Klasyka', 'MF-004', 79.90, 20, TRUE),
(10, 'Blu-ray Film A', 'MF-005', 59.90, 25, TRUE),
(10, 'Blu-ray Film B', 'MF-006', 59.90, 25, TRUE);


-- Zamówienia (30) + pozycje + płatności
-- Uproszczony, deterministyczny scenariusz:

-- Zamówienia 1-10: status NEW, płatności PENDING
-- Zamówienia 11-20: status PAID, płatności PAID
-- Zamówienia 21-25: status SHIPPED, płatności PAID
-- Zamówienia 26-30: status CANCELLED, płatności REFUNDED

-- Wykorzystujemy użytkowników 1-10, reszta bez zamówień

INSERT INTO orders (user_id, status, shipping_address)
VALUES
  (1, 'NEW', 'ul. Pierwsza 1, 00-001 Warszawa'),
  (2, 'NEW', 'ul. Druga 2, 00-002 Warszawa'),
  (3, 'NEW', 'ul. Trzecia 3, 00-003 Warszawa'),
  (4, 'NEW', 'ul. Czwarta 4, 00-004 Warszawa'),
  (5, 'NEW', 'ul. Piąta 5, 00-005 Warszawa'),
  (6, 'NEW', 'ul. Szósta 6, 00-006 Warszawa'),
  (7, 'NEW', 'ul. Siódma 7, 00-007 Warszawa'),
  (8, 'NEW', 'ul. Ósma 8, 00-008 Warszawa'),
  (9, 'NEW', 'ul. Dziewiąta 9, 00-009 Warszawa'),
  (10,'NEW', 'ul. Dziesiąta 10, 00-010 Warszawa'),
  (1, 'PAID', 'ul. Pierwsza 1, 00-001 Warszawa'),
  (2, 'PAID', 'ul. Druga 2, 00-002 Warszawa'),
  (3, 'PAID', 'ul. Trzecia 3, 00-003 Warszawa'),
  (4, 'PAID', 'ul. Czwarta 4, 00-004 Warszawa'),
  (5, 'PAID', 'ul. Piąta 5, 00-005 Warszawa'),
  (6, 'PAID', 'ul. Szósta 6, 00-006 Warszawa'),
  (7, 'PAID', 'ul. Siódma 7, 00-007 Warszawa'),
  (8, 'PAID', 'ul. Ósma 8, 00-008 Warszawa'),
  (9, 'PAID', 'ul. Dziewiąta 9, 00-009 Warszawa'),
  (10,'PAID', 'ul. Dziesiąta 10, 00-010 Warszawa'),
  (1, 'SHIPPED', 'ul. Pierwsza 1, 00-001 Warszawa'),
  (2, 'SHIPPED', 'ul. Druga 2, 00-002 Warszawa'),
  (3, 'SHIPPED', 'ul. Trzecia 3, 00-003 Warszawa'),
  (4, 'SHIPPED', 'ul. Czwarta 4, 00-004 Warszawa'),
  (5, 'SHIPPED', 'ul. Piąta 5, 00-005 Warszawa'),
  (6, 'CANCELLED', 'ul. Szósta 6, 00-006 Warszawa'),
  (7, 'CANCELLED', 'ul. Siódma 7, 00-007 Warszawa'),
  (8, 'CANCELLED', 'ul. Ósma 8, 00-008 Warszawa'),
  (9, 'CANCELLED', 'ul. Dziewiąta 9, 00-009 Warszawa'),
  (10,'CANCELLED', 'ul. Dziesiąta 10, 00-010 Warszawa');

-- Pozycje zamówień (1-5 pozycji per order) - deterministyczny układ

-- Dla prostoty, wykorzystujemy kilka produktów wielokrotnie.

-- Funkcja pomocnicza: (order_id, product_id, qty, unit_price z tabeli products)
-- Tu wpisujemy ręcznie: ceny zgodne z tabelą products powyżej.

-- Order 1 (3 pozycje)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1999.00),
(1, 7, 2, 79.90),
(1, 13, 3, 39.90);

-- Order 2 (2 pozycje)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(2, 2, 1, 1499.00),
(2, 8, 1, 89.90);

-- Order 3 (4 pozycje)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(3, 3, 2, 299.99),
(3, 19,1, 29.90),
(3, 25,1, 79.90),
(3, 31,2, 59.90);

-- Order 4
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(4, 4, 1, 1299.00),
(4, 20,2, 49.90),
(4, 37,1, 59.90);

-- Order 5
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(5, 5, 2, 199.99),
(5, 21,1, 199.90);

-- Order 6
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(6, 6, 3, 99.99),
(6, 32,1, 24.90),
(6, 43,1, 99.90);

-- Order 7
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(7, 9, 1, 99.90),
(7, 33,1, 39.90),
(7, 49,1, 2999.00);

-- Order 8
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(8, 10, 2, 109.90),
(8, 26,1, 89.90),
(8, 50,1, 4999.00);

-- Order 9
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(9, 11, 1, 69.90),
(9, 27,2, 129.90),
(9, 34,1, 59.90);

-- Order 10
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(10, 12,1, 119.90),
(10, 28,1, 59.90),
(10, 35,1, 24.90),
(10, 41,1, 99.90);

-- Orders 11-20 (po 2-4 pozycji, różne produkty)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(11, 1, 1, 1999.00),
(11, 19,2, 29.90),
(11, 37,1, 59.90),

(12, 2, 1, 1499.00),
(12, 20,1, 49.90),
(12, 26,1, 89.90),

(13, 3, 1, 299.99),
(13, 21,1, 199.90),
(13, 31,1, 59.90),

(14, 4, 1, 1299.00),
(14, 7, 1, 79.90),
(14, 27,1, 129.90),

(15, 5, 1, 199.99),
(15, 8, 1, 89.90),
(15, 32,1, 24.90),

(16, 6, 2, 99.99),
(16, 25,1, 79.90),
(16, 33,1, 39.90),

(17, 9, 1, 99.90),
(17, 31,1, 59.90),
(17, 37,1, 59.90),

(18, 10,1, 109.90),
(18, 26,1, 89.90),
(18, 43,1, 99.90),

(19, 11,1, 69.90),
(19, 27,1, 129.90),
(19, 49,1, 2999.00),

(20, 12,1, 119.90),
(20, 28,1, 59.90),
(20, 50,1, 4999.00);

-- Orders 21-25 (SHIPPED)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(21, 1, 1, 1999.00),
(21, 7, 1, 79.90),
(21, 13,1, 39.90),

(22, 2, 1, 1499.00),
(22, 8, 1, 89.90),
(22, 19,1, 29.90),

(23, 3, 1, 299.99),
(23, 20,1, 49.90),
(23, 25,1, 79.90),

(24, 4, 1, 1299.00),
(24, 21,1, 199.90),
(24, 26,1, 89.90),

(25, 5, 1, 199.99),
(25, 27,1, 129.90),
(25, 31,1, 59.90);

-- Orders 26-30 (CANCELLED)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(26, 6, 1, 99.99),
(26, 32,1, 24.90),

(27, 9, 1, 99.90),
(27, 33,1, 39.90),

(28, 10,1, 109.90),
(28, 34,1, 59.90),

(29, 11,1, 69.90),
(29, 35,1, 24.90),

(30, 12,1, 119.90),
(30, 41,1, 99.90);

-- Płatności (1-10 PENDING, 11-25 PAID, 26-30 REFUNDED)

INSERT INTO payments (order_id, status, provider, paid_at) VALUES
-- 1-10: PENDING
(1, 'PENDING', 'card', NULL),
(2, 'PENDING', 'card', NULL),
(3, 'PENDING', 'card', NULL),
(4, 'PENDING', 'card', NULL),
(5, 'PENDING', 'card', NULL),
(6, 'PENDING', 'card', NULL),
(7, 'PENDING', 'card', NULL),
(8, 'PENDING', 'card', NULL),
(9, 'PENDING', 'card', NULL),
(10,'PENDING', 'card', NULL),
-- 11-25: PAID
(11, 'PAID', 'card', now()),
(12, 'PAID', 'card', now()),
(13, 'PAID', 'card', now()),
(14, 'PAID', 'card', now()),
(15, 'PAID', 'card', now()),
(16, 'PAID', 'card', now()),
(17, 'PAID', 'card', now()),
(18, 'PAID', 'card', now()),
(19, 'PAID', 'card', now()),
(20, 'PAID', 'card', now()),
(21, 'PAID', 'card', now()),
(22, 'PAID', 'card', now()),
(23, 'PAID', 'card', now()),
(24, 'PAID', 'card', now()),
(25, 'PAID', 'card', now()),
-- 26-30: REFUNDED
(26, 'REFUNDED', 'card', now()),
(27, 'REFUNDED', 'card', now()),
(28, 'REFUNDED', 'card', now()),
(29, 'REFUNDED', 'card', now()),
(30, 'REFUNDED', 'card', now());


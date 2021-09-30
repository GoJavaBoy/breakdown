DELETE FROM user_roles;
DELETE FROM users;
DELETE FROM orders;
ALTER SEQUENCE global_seq RESTART WITH 100000;

INSERT INTO users (name, email, password, user_status)
VALUES ('User', 'user@yandex.ru', '{noop}password', 'ONLINE'),
       ('Admin', 'admin@gmail.com', '{noop}admin', 'OFFLINE');

INSERT INTO user_roles (role, user_id)
VALUES ('USER', 100000),
       ('ADMIN', 100001),
       ('USER', 100001);

INSERT INTO orders (point_a, point_b, price, phone_number, order_status, distance, comment)
VALUES ('Vilnius, Sankriza Kauno ir Jonavos gatves', 'Kaunas, Petriuko gatve 15', 100, +37052078114, 'ACTIVE', 56, 'Some comments...'),
       ('Vilnius, Gedimino Kalnas', 'Klaipeda, Pajurio gatve 20', 212, +37052078114, 'ACTIVE', 20, 'Some comments...'),
       ('Utena, Vilniaus gatve 15-60', 'Vilnius, BMW Servisas', 125, +37052078114, 'PENDING', 67, 'Some comments...'),
       ('Pabrade, Stovi ant 15 kilometro, Vilniaus kelias', 'Vilnius, Arciausias autoservisas', 80, +37052078114, 'COMPLETED', 78, 'Some comments...');
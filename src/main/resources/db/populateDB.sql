DELETE FROM user_roles;
DELETE FROM users;
ALTER SEQUENCE global_seq RESTART WITH 100000;

INSERT INTO users (name, email, password, user_status)
VALUES ('User', 'user@yandex.ru', '{noop}password', 'ONLINE'),
       ('Admin', 'admin@gmail.com', '{noop}admin', 'OFFLINE');

INSERT INTO user_roles (role, user_id)
VALUES ('USER', 100000),
       ('ADMIN', 100001),
       ('USER', 100001);

INSERT INTO orders (point_a, point_b, price, phone_number, order_status)
VALUES ('Vilnius, Sankriza Kauno ir Jonavos gatves', 'Kaunas, Petriuko gatve 15', 100, +37052078114, 'ACTIVE'),
       ('Vilnius, Gedimino Kalnas', 'Klaipeda, Pajurio gatve 20', 212, +37052078114, 'ACTIVE'),
       ('Utena, Vilniaus gatve 15-60', 'Vilnius, BMW Servisas', 125, +37052078114, 'PENDING'),
       ('Pabrade, Stovi ant 15 kilometro, Vilniaus kelias', 'Vilnius, Arciausias autoservisas', 80, +37052078114, 'COMPLETED');
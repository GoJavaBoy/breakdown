DELETE FROM user_roles;
DELETE FROM users;
ALTER SEQUENCE global_seq RESTART WITH 100000;

INSERT INTO users (name, email, password)
VALUES ('User', 'user@yandex.ru', '{noop}password'),
       ('Admin', 'admin@gmail.com', '{noop}admin');

INSERT INTO user_roles (role, user_id)
VALUES ('USER', 100000),
       ('ADMIN', 100001),
       ('USER', 100001);

INSERT INTO orders (point_a, point_b, price, phone_number)
VALUES ('Vilnius, Sankriza Kauno ir Jonavos gatves', 'Kaunas, Petriuko gatve 15', 100, +37052078114),
       ('Vilnius, Gedimino Kalnas', 'Klaipeda, Pajurio gatve 20', 212, +37052078114),
       ('Utena, Vilniaus gatve 15-60', 'Vilnius, BMW Servisas', 125, +37052078114),
       ('Pabrade, Stovi ant 15 kilometro, Vilniaus kelias', 'Vilnius, Arciausias autoservisas', 80, +37052078114);
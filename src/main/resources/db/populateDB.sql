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

INSERT INTO orders (point_a, price, phone_number, order_status, distance, comment)
VALUES ('https://www.google.com/maps/d/u/0/edit?mid=11yaAGI4FhZ1P7TP9Kwf2MHJYU1FXm3Mn&usp=sharing', 100, +37052078114, 'ACTIVE', 56, 'Some comments...'),
       ('https://www.google.com/maps/d/u/0/edit?mid=11yaAGI4FhZ1P7TP9Kwf2MHJYU1FXm3Mn&usp=sharing', 212, +37052078114, 'ACTIVE', 20, 'Some comments...'),
       ('https://www.google.com/maps/d/u/0/edit?mid=11yaAGI4FhZ1P7TP9Kwf2MHJYU1FXm3Mn&usp=sharing', 125, +37052078114, 'PENDING', 67, 'Some comments...'),
       ('https://www.google.com/maps/d/u/0/edit?mid=11yaAGI4FhZ1P7TP9Kwf2MHJYU1FXm3Mn&usp=sharing', 80, +37052078114, 'COMPLETED', 78, 'Some comments...');
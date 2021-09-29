DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS orders;
DROP SEQUENCE IF EXISTS global_seq;

CREATE SEQUENCE global_seq START WITH 100000;

CREATE TABLE orders
(
    id            INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
    point_a             VARCHAR                           NOT NULL,
    point_b             VARCHAR                           NOT NULL,
    price               INTEGER                           NOT NULL,
    registered          TIMESTAMP           DEFAULT now() NOT NULL,
    active              BOOL                DEFAULT TRUE  NOT NULL,
    phone_number        VARCHAR                           NOT NULL,
    order_status        VARCHAR                           NOT NULL
);

CREATE TABLE users
(
    id               INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
    order_id         INTEGER,
    name             VARCHAR                           NOT NULL,
    email            VARCHAR                           NOT NULL,
    password         VARCHAR                           NOT NULL,
    registered       TIMESTAMP           DEFAULT now() NOT NULL,
    enabled          BOOL                DEFAULT TRUE  NOT NULL,
    user_status      VARCHAR                           NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (id)
);
CREATE UNIQUE INDEX users_unique_email_idx ON users (email);

CREATE TABLE user_roles
(
    user_id INTEGER NOT NULL,
    role    VARCHAR,
    CONSTRAINT user_roles_idx UNIQUE (user_id, role),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

-- CREATE TABLE meals
-- (
--     id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
--     user_id     INTEGER   NOT NULL,
--     date_time   TIMESTAMP NOT NULL,
--     description TEXT      NOT NULL,
--     calories    INT       NOT NULL,
--     FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
-- );
-- CREATE UNIQUE INDEX meals_unique_user_datetime_idx ON meals (user_id, date_time);
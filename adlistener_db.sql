DROP DATABASE ad_listener_db;

CREATE
    DATABASE IF NOT EXISTS ad_listener_db;

USE
    ad_listener_db;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS categories;

-- ---------------------------------------------------------- USERS_CREDENTIALS TABLE:
CREATE TABLE users_credentials
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email    VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);
INSERT INTO users_credentials (email, password)
VALUES ('tom@user.com', 'tompass'),
       ('jill@user.com', 'jillpass'),
       ('mike@user.com', 'mikepass'),
       ('kim@user.com', 'kimpass');


-- ---------------------------------------------------------- USER_INFO TABLE:
CREATE TABLE user_info
(
    user_id        INT UNSIGNED NOT NULL PRIMARY KEY,
    first_name     VARCHAR(100)NOT NULL,
    last_name      VARCHAR(100)NOT NULL,
    phone_no       VARCHAR(30)  DEFAULT 'N/A',
    street_address VARCHAR(100) DEFAULT 'N/A',
    city           VARCHAR(100) DEFAULT 'N/A',
    state          VARCHAR(3)   DEFAULT 'N/A',
    joined_on      DATETIME     DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users_credentials (id)
);
-- ---------------------------------------------------------- ADS TABLE:
CREATE TABLE ads
(
    id           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title        VARCHAR(100) NOT NULL,
    description  TEXT,
    price        DECIMAL(6, 2),
    created_date DATETIME DEFAULT NOW(),
    user_id      INT UNSIGNED NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users_credentials (id),
    PRIMARY KEY (id)
);

INSERT INTO ads (title, description, price, user_id)
VALUES ('honda car', 'Used 2002 honda civic', 5000.99, 3),
       ('air compressor', 'New Bosch air compressor', 200.00, 1),
       ('iphone', 'Used iphone 8', 100.75, 4),
       ('toaster', 'Used toaster', 0, 3);

# DROP TABLE ads;
# SELECT * FROM ads;
-- ---------------------------------------------------------- CATEGORIES TABLE:
CREATE TABLE categories
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(75),
    PRIMARY KEY (id)
);

INSERT INTO categories (name)
VALUES ('Automobiles'),
       ('Furniture'),
       ('Electronics'),
       ('Appliances'),
       ('Tools'),
       ('Misc.');

-- ---------------------------------------------------------- AD_CATEGORIES TABLE
CREATE TABLE ad_categories
(
    ad_id       INTEGER UNSIGNED NOT NULL,
    category_id INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);

INSERT INTO ad_categories (ad_id, category_id)
VALUES (1, 1),
       (2, 5),
       (3, 3),
       (4, 4);


# DROP TABLE ad_categories;

-- TODO ------------------------------------------------------ QUERIES:

-- TODO: For a given ad, what is the email address of the user that created it?

SELECT u.email AS User, a.title AS 'Item'
FROM users AS u
         JOIN ads a
              on u.id = a.user_id
WHERE a.title = 'honda car';

-- TODO: For a given ad, what category, or categories, does it belong to?
SELECT a.title AS 'Item', c.name AS 'Categories'
FROM ads a
         JOIN categories c
              on a.id = c.id
WHERE a.title = 'iphone';

-- TODO: For a given category, show all the ads that are in that category

-- SELECT *
-- FROM ads a
-- WHERE

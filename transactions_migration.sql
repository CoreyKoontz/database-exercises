use bank_db;

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    description VARCHAR (100),
    memo TEXT,
    amount DECIMAL (8,2) NOT NULL,
    transaction_successful TINYINT

);
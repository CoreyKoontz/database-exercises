CREATE DATABASE IF NOT EXISTS design_test_db;

USE design_test_db;


DROP TABLE IF EXISTS quote_topic;
DROP TABLE IF EXISTS quotes;
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS authors;

CREATE TABLE quotes
(
    id                INT UNSIGNED NOT NULL AUTO_INCREMENT,
    author_first_name VARCHAR(50) DEFAULT 'NONE',
    author_last_name  VARCHAR(100) NOT NULL,
    content           TEXT         NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE authors
(
    id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name  VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE quotes
    DROP COLUMN author_first_name;
ALTER TABLE quotes
    DROP COLUMN author_last_name;
ALTER TABLE quotes
    ADD COLUMN author_id INT UNSIGNED NOT NULL;
ALTER TABLE quotes
    ADD FOREIGN KEY (author_id) REFERENCES authors (id) ON DELETE NO ACTION ON UPDATE CASCADE;


INSERT INTO authors (first_name, last_name)
VALUES ('Frank', 'Herbert'),
       ('Kurt', 'Vonnegut'),
       ('Ken', 'Follett');


INSERT INTO quotes(author_id, content)
VALUES (1, 'Deep in the human unconscious is a pervasive
            need for a logical universe that makes sense. But the real universe is
            always one step beyond logic.'),
       (2, 'How nice -- to feel nothing, and still get full credit for being alive.'),
       (3, 'When things are simple, fewer mistakes are made. The most expensive part of a building is the mistakes.'),
       (3,
        'The trouble with being inspired to perform the impossible was that the inspiration gave you no clues to the practical means.');

SELECT *
FROM authors;

SELECT *
FROM quotes;

SELECT content
FROM quotes AS q
WHERE q.author_id IN (
    SELECT a.id
    FROM authors AS a
    WHERE CONCAT(a.first_name, ' ', a.last_name) = 'Frank Herbert'
);

CREATE TABLE topics
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO topics (name)
VALUES ('logic'),
       ('inspiration'),
       ('humor'),
       ('philosophical'),
       ('Famous Literature');


CREATE TABLE quote_topic
(
    quote_id INTEGER UNSIGNED NOT NULL,
    topic_id INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY (quote_id) REFERENCES quotes (id),
    FOREIGN KEY (topic_id) REFERENCES topics (id)
);

INSERT INTO quote_topic (quote_id, topic_id)
VALUES (1, 1),
       (1, 4),
       (4, 2),
       (4, 3),
       (2, 5),
       (2, 3),
       (3, 2),
       (3, 4);

SELECT q.content AS 'Quote',
       CONCAT(a.first_name, ' ', a.last_name) AS 'Full Name',
       t.name AS 'Topic'
FROM quotes q
         INNER JOIN quote_topic qt ON q.id = qt.quote_id
         INNER JOIN topics t ON qt.topic_id = t.id
         INNER JOIN authors a ON q.author_id = a.id
WHERE qt.topic_id IN
      (
          SELECT t.id
          FROM topics t
          WHERE t.name = 'Humor'
      );
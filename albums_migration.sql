use codeup_test_db;

drop table if exists albums;

create table albums (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id),
  artist VARCHAR (50) NOT NULL,
  name VARCHAR (50) NOT NULL,
  release_date SMALLINT UNSIGNED,
  sales FLOAT(6, 2),
  genre VARCHAR (100)
);
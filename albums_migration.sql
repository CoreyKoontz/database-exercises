use codeup_test_db;

drop table if exists albums;

create table if not exists albums (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  artist VARCHAR (100) NOT NULL,
  name VARCHAR (100) NOT NULL,
  release_date SMALLINT UNSIGNED,
  genre VARCHAR (100),
  sales FLOAT(6, 2),
  PRIMARY KEY (id)
  );
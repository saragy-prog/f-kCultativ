DROP DATABASE IF EXISTS db_users;

CREATE DATABASE db_users DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE db_users;

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
  user_id    int(10) NOT NULL PRIMARY KEY auto_increment,
  login          varchar(30) NOT NULL,
  password          varchar(30) NOT NULL,
  UNIQUE(password)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS curses;
CREATE TABLE IF NOT EXISTS curses (
  curse_id    int(10) NOT NULL PRIMARY KEY auto_increment,
  curseName          varchar(30) NOT NULL,
  UNIQUE(curseName),
  user_id    int(10) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE cascade ON UPDATE cascade
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO users VALUES
(1, "Иванова", "Вера"),
(2, "Петров", "Иван"),
(3, "Сидорова", "Надежда"),
(4, "Васильев", "Петр"),
(5, "Сергеев", "Василий");
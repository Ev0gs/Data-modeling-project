DROP USER IF EXISTS 'user'@'localhost';
CREATE USER 'user'@'localhost' IDENTIFIED BY '123';
GRANT CREATE ON *.* TO 'user'@'localhost';
GRANT ALL PRIVILEGES ON projet_final.* TO 'user'@'localhost';
SHOW GRANTS FOR 'user'@'localhost';
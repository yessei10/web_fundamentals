1 -----------------------
CREATE TABLE `hackerhero_practice`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NULL,
  `last_name` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `encrypted_password` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`));
2 -----------------------
USE hackerhero_practice;

INSERT INTO users (first_name, last_name, email, encrypted_password, created_at, updated_at)
VALUES ("Michael", "Choi", "michaelchoi@gmail.com", "admin123", now(), now());

INSERT INTO users (first_name, last_name, email, encrypted_password, created_at, updated_at)
VALUES ("Karen", "Igcasan", "karenigcasan@gmail.com", "admin1234", now(), now());

INSERT INTO users (first_name, last_name, email, encrypted_password, created_at, updated_at)
VALUES ("Rodante", "Gutierrez", "gutierrez.rodzante@gmail.com", "user123", now(), now());

3 -----------------------
UPDATE users
SET first_name = "Rodz", created_at = now(), updated_at = now()
WHERE id = 1;

4 -----------------------
UPDATE users
SET first_name = "Michael"
WHERE last_name = "Choi";

5 -----------------------
UPDATE users
SET  encrypted_password = "user123"
WHERE id IN (1, 2, 3);

6 -----------------------
DELETE FROM users
WHERE id = 1;

7 -----------------------
DELETE FROM users

8 -----------------------
DROP TABLE users;
Dropping the table is deleting table/container itself
while deleting records is deleting the data inside of a table and will be resulted to empty table

9 -----------------------
ALTER TABLE users
RENAME COLUMN email to email_address;

10 ----------------------
ALTER TABLE users
MODIFY COLUMN id BIGINT;

11 ----------------------
ALTER TABLE users
ADD is_active BOOLEAN DEFAULT 0 NOT NULL;
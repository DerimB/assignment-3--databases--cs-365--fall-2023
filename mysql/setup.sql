DROP DATABASE IF EXISTS student_passwords;

CREATE DATABASE student_passwords DEFAULT CHARACTER SET utf8mb4;

USE student_passwords;

SET @UNHEXEncryptionKey = UNHEX('EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE');

CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT,
    first_name VARCHAR(32) NOT NULL,
    last_name VARCHAR(32) NOT NULL,
    email VARCHAR(32) NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS websites (
    website_id INT AUTO_INCREMENT,
    website_name VARCHAR(64) NOT NULL,
    website_url VARCHAR(256) NOT NULL,
    PRIMARY KEY (website_id)
);

CREATE TABLE IF NOT EXISTS accounts (
    account_id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    website_id INT NOT NULL,
    username VARCHAR(64) NOT NULL,
    password VARBINARY(256) NOT NULL,
    comment TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (account_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (website_id) REFERENCES websites(website_id));

INSERT INTO users (first_name, last_name, email) VALUES
    ('Derim', 'Belica','dbel21@gmail.com'),
    ('John', 'Doe', 'JD21@hartford.edu'),
    ('Michael', 'Jackson', 'MJ84@yahoo.com'),
    ('Joel', 'Homer', 'JoeH@gmail.com'),
    ('Manny', 'Parker', 'ManPark@gmail.com'),
    ('Daniel', 'Taylor', 'Danni03@gmail.com'),
    ('Wyatt', 'Ollie', 'Wyatt01@gmail.com'),
    ('Lindsy', 'Santos', 'LinSan@gmail.com'),
    ('Kyler', 'Jones', 'KylerJones@gmail.com'),
    ('Frank', 'Hill', 'FrankH@gmail.com');

INSERT INTO websites (website_name, website_url) VALUES
  ('MySQL', 'https://www.mysql.com'),
  ('UniversityOfHartford', 'https://www.hartford.edu'),
  ('UselessWebsite', 'http://www.useless.com'),
  ('FastFoodForMe', 'http://www.fastfoodforme.com'),
  ('Roblox', 'http://www.roblox.com'),
  ('Ebay', 'http://www.ebay.com'),
  ('NFL', 'http://www.nfl.com'),
  ('Steam', 'http://www.steam.com'),
  ('Twitch', 'http://www.twitch.com'),
  ('HotPocket', 'http://www.hotpocket.com');

INSERT INTO accounts (user_id, website_id, username, password, comment) VALUES
  (1, 1, 'dbel21', AES_ENCRYPT('mySQLPassword', @UNHEXEncryptionKey), 'New MySQL account for Derim'),
  (2, 2, 'JD21', AES_ENCRYPT('myUHARTPassword', @UNHEXEncryptionKey), 'New UHART account for John'),
  (3, 3, 'MJ84', AES_ENCRYPT('MJpassword', @UNHEXEncryptionKey), 'New account for Michael on the useless website'),
  (4, 4, 'JoeH', AES_ENCRYPT('fffmJoelPW', @UNHEXEncryptionKey), 'New account for Joel on the fast food for me website'),
  (5, 5, 'ManPark1998', AES_ENCRYPT('MannyPark1212', @UNHEXEncryptionKey), 'New account for Manny on the Roblox website'),
  (6, 6, 'DanniT', AES_ENCRYPT('DTay2003', @UNHEXEncryptionKey), 'New account for Daniel on the Ebay website'),
  (7, 7, 'WyattTheMan', AES_ENCRYPT('Wyatt012003', @UNHEXEncryptionKey), 'New account for Wyatt on the NFL website'),
  (8, 8, 'LinSan99', AES_ENCRYPT('LinSecretPW', @UNHEXEncryptionKey), 'New account for Lindsy on the Steam website'),
  (9, 9, 'KyKy45', AES_ENCRYPT('KylerJ00!', @UNHEXEncryptionKey), 'New account for Kyler on the Twitch website'),
  (10, 10, 'FHill', AES_ENCRYPT('FH!@9', @UNHEXEncryptionKey), 'New account for Frank on the HotPocket website');

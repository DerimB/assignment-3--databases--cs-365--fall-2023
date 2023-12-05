DROP DATABASE IF EXISTS student_passwords;

CREATE DATABASE student_passwords DEFAULT CHARACTER SET utf8mb4;

USE student_passwords;

SET @UNHEXEncryptionKey = UNHEX('EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE');

CREATE TABLE IF NOT EXISTS passwords_content (
    website_name VARCHAR(64) NOT NULL,
    website_url VARCHAR(256) NOT NULL,
    first_name VARCHAR(32) NOT NULL,
    last_name VARCHAR(32) NOT NULL,
    username VARCHAR(64) NOT NULL,
    email VARCHAR(32) NOT NULL,
    password VARBINARY(256) NOT NULL,
    comment TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    content_id INT AUTO_INCREMENT,
    PRIMARY KEY (content_id)
);


INSERT INTO passwords_content (website_name, website_url, first_name, last_name, username, email, password, comment)
VALUES (
    'MySQL',
    'https://www.mysql.com',
    'Derim',
    'Belica',
    'dbel21',
    'dbel21@gmail.com',
    AES_ENCRYPT('mySQLPassword',@UNHEXEncryptionKey),
    'New MySQL account for Derim'
)
,
(
    'UniversityOfHartford',
    'https://www.hartford.edu',
    'John',
    'Doe',
    'JD21',
    'JD21@hartford.edu',
    AES_ENCRYPT('myUHARTPassword',@UNHEXEncryptionKey),  
    'New UHART account for John'
)
,
(
    'UselessWebsite',
    'http://www.useless.com',
    'Michael',
    'Jackson',
    'MJ84',
    'MJ84@yahoo.com',
    AES_ENCRYPT('MJpassword',@UNHEXEncryptionKey), 
    'New account for Michael on the useless website'
)
,
(
    'FastFoodForMe',
    'http://www.fastfoodforme.com',
    'Joel',
    'Homer',
    'JoeH',
    'JoeH@gmail.com',
    AES_ENCRYPT('fffmJoelPW',@UNHEXEncryptionKey), 
    'New account for Joel on the fast food for me website'
)
,
(
    'Roblox',
    'http://www.roblox.com',
    'Manny',
    'Parker',
    'ManPark1998',
    'ManPark@gmail.com',
    AES_ENCRYPT('MannyPark1212',@UNHEXEncryptionKey), 
    'New account for Manny on the Roblox website'
)
,
(
    'Ebay',
    'http://www.ebay.com',
    'Daniel',
    'Taylor',
    'DanniT',
    'Danni03@gmail.com',
    AES_ENCRYPT('DTay2003',@UNHEXEncryptionKey), 
    'New account for Daniel on the Ebay website'
)
,
(
    'NFL',
    'http://www.nfl.com',
    'Wyatt',
    'Ollie',
    'WyattTheMan',
    'Wyatt01@gmail.com',
    AES_ENCRYPT('Wyatt012003',@UNHEXEncryptionKey), 
    'New account for Wyatt on the NFL website'
)
,
(
    'Steam',
    'http://www.steam.com',
    'Lindsy',
    'Santos',
    'LinSan99',
    'LinSan@gmail.com',
    AES_ENCRYPT('LinSecretPW',@UNHEXEncryptionKey), 
    'New account for Lindsy on the Steam website'
)
,
(
    'Twitch',
    'http://www.twitch.com',
    'Kyler',
    'Jones',
    'KyKy45',
    'KylerJones@gmail.com',
    AES_ENCRYPT('KylerJ00!',@UNHEXEncryptionKey), 
    'New account for Kyler on the Twitch website'
)
,
(
    'HotPocket',
    'http://www.hotpocket.com',
    'Frank',
    'Hill',
    'FHill',
    'FrankH@gmail.com',
    AES_ENCRYPT('FH!@9',@UNHEXEncryptionKey), 
    'New account for Frank on the HotPocket website'
)
;
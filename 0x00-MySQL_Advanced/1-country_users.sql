-- create table users, again
CREATE TABLE
    IF NOT EXISTS users (
        id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
        email varchar(255) UNIQUE NOT NULL,
        name varchar(255),
        country ENUM ('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
    );


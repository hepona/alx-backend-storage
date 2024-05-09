-- Create table users
CREATE TABLE IF NOT EXISTS users {
    id int PRIMARY KEY NOT NULL ,
    email varchar(255) UNIQUE NOT NULL,
    name varchar(255)
}
-- CREATE DATABASE test;

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY NOT NULL,
    first_name VARCHAR(50),
    email VARCHAR(50),
    password VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS authorities (
    id INTEGER NOT NULL REFERENCES users(id),
    authority varchar(50),
        CONSTRAINT pk_authorities PRIMARY KEY (id)
);
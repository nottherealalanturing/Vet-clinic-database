/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR, date_of_birth VARCHAR, escape_attempts VARCHAR, neutered BOOL, weight_kg BOOL);
/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR, date_of_birth DATE, escape_attempts INT, neutered BOOL, weight_kg DECIMAL);

ALTER TABLE animals ADD species VARCHAR;

CREATE TABLE owners(id INT GENERATED ALWAYS AS IDENTITY, full_name VARCHAR, age INT, PRIMARY KEY (id));
CREATE TABLE species (id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR, PRIMARY KEY(id));
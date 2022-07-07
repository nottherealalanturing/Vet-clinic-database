/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR, date_of_birth DATE, escape_attempts INT, neutered BOOL, weight_kg DECIMAL);

ALTER TABLE animals ADD species VARCHAR;

BEGIN;
CREATE TABLE owners(id INT GENERATED ALWAYS AS IDENTITY, full_name VARCHAR, age INT, PRIMARY KEY (id));
CREATE TABLE species (id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR, PRIMARY KEY(id));
COMMIT;

BEGIN;
ALTER TABLE animals ADD PRIMARY KEY(id);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT species_fk FOREIGN KEY (species_id) REFERENCES animals(id) ON DELETE CASCADE;
ALTER TABLE animals ADD CONSTRAINT owner_fk FOREIGN KEY (owner_id) REFERENCES animals(id) ON DELETE CASCADE;
COMMIT;

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR,
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations (vet_id INT, species_id INT, PRIMARY KEY (vet_id, species_id), FOREIGN KEY (vet_id) REFERENCES vets(id) ON DELETE CASCADE, FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE);


CREATE TABLE visits ( id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, animal_id INT, vet_id INT, date_of_visit DATE NOT NULL, FOREIGN KEY (animal_id) REFERENCES animals(id) ON DELETE CASCADE, FOREIGN KEY (vet_id) REFERENCES vets(id) ON DELETE CASCADE);


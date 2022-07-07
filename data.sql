/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '3/2/2020', 0, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '15/11/2018', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '7/1/2021', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '12/5/2017', 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Charmander', '8/2/2020', 0, false, -11),
,('Plantmon', '15/11/2021', 2, true, -5.7),
,('Squirtle', '2/4/1993', 3, false, -12.13),
('Angemon', '12/6/2005', 1, true, -45),
('Boarmon', '7/6/2005', 7, true, 20.4),
('Blossom', '13/10/1998', 3, true, 17),
('Ditto', '14/5/2022', 4, true, 22);

BEGIN;
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);
INSERT INTO species (id, name) VALUES ('Pokemon', 'Digimon');
COMMIT;

BEGIN;
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE animals.name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE animals.name NOT LIKE '%mon';
COMMIT;

BEGIN;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE animals.name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE animals.name = 'Gabumon' OR animals.name = 'Pikachu';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE animals.name = 'Devimon' OR animals.name = 'Plantmon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE animals.name = 'Charmander' OR animals.name = 'Squirtle' or animals.name = 'Blossom';
COMMIT;

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23'), ('Maisy Smith', 26, '2019-01-17'), ('Stephanie Mendez', 64, '1981-05-04'), ('Jack Harkness', 38, '2008-06-08');
INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM species WHERE name = 'Pokemon'));
INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Pokemon'));
INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Digimon'));
INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM species WHERE name = 'Digimon'));

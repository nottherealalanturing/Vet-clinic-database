/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon';
SELECT (name) FROM animals WHERE date_of_birth BETWEEN '2016/1/1' AND '2019/1/1';
SELECT (name) FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT (date_of_birth) FROM animals WHERE name = 'Agumon' OR name ='Pikachu';
SELECT (name, escape_attempts) FROM animals WHERE weight_kg > 10.5; 
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE NOT name = 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT count(*) FROM animals;
SELECT count(*) FROM animals GROUP BY escape_attempts HAVING escape_attempts = 0;
SELECT avg(weight_kg) FROM animals;
SELECT sum(weight_kg)/ count(*) as average FROM animals;
SELECT COUNT(*) as most_escape, neutered FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) as min_weight, MAX(weight_kg) as max_weight FROM animals GROUP BY species;
SELECT species, avg(escape_attempts) from animals WHERE date_of_birth >= '1/1/1990' AND date_of_birth <= '1/1/2000/' GROUP BY species;

SELECT * FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT * FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name AS Owner_name, animals.name AS Animal_name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;
SELECT species.name, count(*) FROM species INNER JOIN animals ON species.id = animals.species_id GROUP BY species.name;
SELECT owners.full_name, animals.name FROM animals INNER JOIN species ON animals.species_id = species.id INNER JOIN owners ON animals.owner_id = owners.id WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';
SELECT * FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name, COUNT(*) FROM animals INNER JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY COUNT(*) DESC LIMIT 1;
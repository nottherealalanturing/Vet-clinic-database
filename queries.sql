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

 SELECT * FROM animals a JOIN owners o ON a.id = o.id WHERE o.full_name = 'Melody Pond';
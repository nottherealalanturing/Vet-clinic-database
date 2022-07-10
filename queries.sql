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

SELECT a.name, vets.name, v.date_of_visit 
FROM animals a 
JOIN visits v ON a.id = v.animal_id 
JOIN vets ON vets.id = v.vet_id 
WHERE vets.name = 'William Tatcher' 
ORDER BY date_of_visit DESC 
LIMIT 1;

SELECT COUNT(DISTINCT animals.name) as animal_count, animals.name, v.name 
FROM animals 
JOIN visits ON animals.id = visits.animal_id 
JOIN vets v ON v.id = visits.vet_id 
WHERE v.name = 'Stephanie Mendez' 
GROUP BY animals.name, v.name;  


SELECT v.name, s.name 
FROM vets v 
LEFT JOIN specializations ON v.id = specializations.vet_id 
LEFT JOIN species s ON  s.id = specializations.species_id;

SELECT * 
FROM animals 
JOIN visits ON animals.id = visits.animal_id 
JOIN vets ON vets.id = visits.vet_id 
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';


SELECT a.name, COUNT(v.date_of_visit) as num_of_visit 
FROM animals a 
JOIN visits v ON a.id = v.animal_id 
JOIN vets ON vets.id = v.vet_id 
GROUP BY a.name 
ORDER BY num_of_visit DESC 
LIMIT 1;

SELECT a.name, visits.date_of_visit 
FROM animals a 
JOIN visits ON a.id = visits.animal_id 
JOIN vets v ON v.id = visits.vet_id 
WHERE v.name = 'Maisy Smith' 
ORDER BY visits.date_of_visit 
LIMIT 1; 

SELECT * 
FROM animals a 
JOIN visits ON a.id = visits.animal_id 
JOIN vets v ON v.id = visits.vet_id 
ORDER BY visits.date_of_visit
 DESC LIMIT 1;

SELECT COUNT(*) 
FROM animals a 
JOIN visits ON a.id = visits.animal_id 
JOIN vets v ON v.id = visits.vet_id 
JOIN specializations ON specializations.vet_id = v.id 
JOIN species s ON s.id = specializations.species_id 
WHERE a.species_id != specializations.species_id;


SELECT COUNT(a.name) as animal_count, a.name, species.name as specie
FROM animals a JOIN visits ON a.id = visits.animal_id 
JOIN vets v ON v.id = visits.vet_id 
JOIN species ON a.species_id = species.id 
WHERE v.name = 'Maisy Smith' 
GROUP BY a.name, species.name 
LIMIT 1;

SELECT * FROM animal_count;
SELECT * FROM visits;
SELECT * FROM specializations;
SELECT * FROM vets;

SELECT count(*) FROM visits;






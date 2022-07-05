/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon';
SELECT (name) FROM animals WHERE date_of_birth BETWEEN '2016/1/1' AND '2019/1/1';
SELECT (name) FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT (date_of_birth) FROM animals WHERE name = 'Agumon' OR name ='Pikachu';
SELECT (name, escape_attempts) FROM animals WHERE weight_kg > 10.5; 
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE NOT name = 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered IS true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Pikachu','Agumon');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IS true;
SELECT * FROM animals WHERE NOT name = 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.3 AND 17.4;
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts IS NULL;
SELECT AVG(weight_kg) FROM animals;
SELECT SUM(escape_attempts) FROM animals WHERE neutered IS true;
SELECT SUM(escape_attempts) FROM animals WHERE neutered IS true;
SELECT MAX(weight_kg), MIN(weight_kg) FROM animals WHERE species = 'digimon';
SELECT MAX(weight_kg), MIN(weight_kg) FROM animals WHERE species = 'pokemon';
SELECT AVG(escape_attempts) FROM animals  WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01';

SELECT name FROM animals WHERE owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Melody Pond');
SELECT name FROM animals WHERE species_id = (SELECT id FROM species WHERE species.name = 'Pokemon');
SELECT o.full_name, a.name FROM owners o LEFT JOIN animals a ON a.owner_id = o.id ORDER BY a.id, o.id;
SELECT COUNT(name) FROM animals WHERE species_id = (SELECT id FROM species WHERE species.name = 'Pokemon');
SELECT COUNT(name) FROM animals WHERE species_id = (SELECT id FROM species WHERE species.name = 'Digimon');
SELECT name FROM animals WHERE species_id = (SELECT id FROM species WHERE species.name = 'Digimon') AND owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Jennifer Orwell')
SELECT name FROM animals WHERE escape_attempts IS NULL AND owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Dean Winchester');
SELECT o.full_name, COUNT(name) FROM owners o INNER JOIN animals a ON a.owner_id = o.id GROUP BY o.full_name;
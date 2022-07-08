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

SELECT MAX(visits.visit_date), animals.name FROM visits INNER JOIN animals ON visits.vets_id = (SELECT id FROM vets WHERE vets.name = 'William Tatcher') GROUP BY visits.visit_date, animals.name;
SELECT COUNT(DISTINCT animals_id) FROM visits WHERE vets_id = (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez');
SELECT species.name, vets.name, specializations.species_id FROM vets, specializations LEFT JOIN species ON specializations.species_id = species.id  GROUP BY species.name, vets.name, specializations.species_id;
SELECT animals.name FROM visits JOIN animals ON animals.id = visits.animals_id  AND visits.vets_id = (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez') AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30' GROUP BY animals.name;
SELECT animals_id, COUNT(*) FROM visits GROUP BY animals_id ORDER BY COUNT(*) DESC limit 1;
SELECT visit_date, v.name, a.name FROM visits INNER JOIN animals a ON visits.animals_id = a.id INNER JOIN vets v ON visits.vets_id = v.id ORDER BY visit_date DESC LIMIT 1;
SELECT visit_date, ve.name as Vet, a.name as Animal FROM visits v INNER JOIN animals a ON v.animals_id = a.id INNER JOIN vets ve ON v.vets_id = ve.id ORDER BY visit_date DESC LIMIT 1
SELECT COUNT(*) FROM visits JOIN vets v ON visits.vets_id = v.id JOIN animals a ON visits.animals_id = a.id LEFT JOIN specializations sp ON v.id = sp.vets_id WHERE v.id != ( SELECT id FROM vets WHERE name = 'Stephanie Mendez' ) AND sp.species_id != a.species_id OR sp.species_id IS NULL;




SELECT s.name as species, COUNT(*) FROM visits v INNER JOIN vets ve ON v.vets_id = ve.id INNER JOIN animals a ON v.animals_id = a.id INNER JOIN species s ON a.species_id = s.id WHERE v.vets_id = ( SELECT id FROM vets WHERE vets.name = 'Maisy Smith') GROUP BY species ORDER BY count DESC LIMIT 1; 
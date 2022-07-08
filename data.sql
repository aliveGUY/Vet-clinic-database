/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Agumon',  'February 3, 2020', NULL, true, 10.23);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Gabumon',  'Nov 15, 2018', 2, true, 8);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Pikachu',  'Jan 7, 2021', 1, false, 15.04);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Devimon',  'May 12, 2017', 5, true, 11);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Charmander',  'Feb 8, 2020', NULL, false, 11);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Plantmon',  'Nov 15, 2021', 2, true, 5.7);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Squirtle',  'Apr 2, 1993', 3, false, 12.13);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Angemon',  'Jun 12, 2005', 1, true, 45);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Boarmon',  'Jun 7, 2005', 7, true, 20.4);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Blossom',  'Oct 13, 1998', 3, true, 17);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Ditto',  'May 14, 2022', 4, true, 22);

INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34);

INSERT INTO owners(full_name, age) VALUES('Jennifer Orwell', 19);

INSERT INTO owners(full_name, age) VALUES('Bob', 45);

INSERT INTO owners(full_name, age) VALUES('Melody Pond', 77);

INSERT INTO owners(full_name, age) VALUES('Dean Winchester', 14);

INSERT INTO owners(full_name, age) VALUES('Jodie Whittaker', 

INSERT INTO species(name) VALUES('Pokemon');

INSERT INTO species(name) VALUES('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE species.name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE species.name = 'Pokemon') WHERE species_id IS NULL;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Sam Smith') WHERE name = ('Agumon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Dean Winchester ') WHERE name IN ('Angemon', 'Boarmon');


INSERT INTO vets(name, age, date_of_graduation) VALUES('William Tatcher', 45, 'Apr 23, 2000');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Maisy Smith', 26, 'Jan 17, 2019');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Stephanie Mendez', 64, 'May 4, 1981');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Jack Harkness', 38, 'Jun 8, 2008');

INSERT INTO specializations(vets_id, species_id) VALUES((SELECT id FROM vets WHERE vets.name = 'William Tatcher'), (SELECT id FROM species WHERE species.name = 'Pokemon'));
INSERT INTO specializations(vets_id, species_id) VALUES((SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM species WHERE species.name = 'Digimon'));
INSERT INTO specializations(vets_id, species_id) VALUES((SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM species WHERE species.name = 'Pokemon'));
INSERT INTO specializations(vets_id, species_id) VALUES((SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), (SELECT id FROM species WHERE species.name = 'Digimon'));

INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'William Tatcher'), (SELECT id FROM animals WHERE animals.name = 'Agumon'), 'May 24, 2020');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), (SELECT id FROM animals WHERE animals.name = 'Agumon'), 'Jul 22, 2020');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Pikachu'), 'Jan 5, 2020');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Pikachu'), 'Mar 8, 2020');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Pikachu'), 'May 14, 2020');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE animals.name = 'Devimon'), 'May 4, 2021');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), (SELECT id FROM animals WHERE animals.name = 'Charmander'), 'Feb 24, 2021');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Plantmon'), 'Dec 21, 2019');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'William Tatcher'), (SELECT id FROM animals WHERE animals.name = 'Plantmon'), 'Aug 10, 2020');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Plantmon'), 'Apr 7, 2021');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE animals.name = 'Squirtle'), 'Sep 29, 2019');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), (SELECT id FROM animals WHERE animals.name = 'Angemon'), 'Oct 3, 2020');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), (SELECT id FROM animals WHERE animals.name = 'Angemon'), 'Nov 4, 2020');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Boarmon'), 'Jan 24, 2019');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Boarmon'), 'May 15, 2019');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Boarmon'), 'Feb 27, 2020');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Boarmon'), 'Aug 3, 2020');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE animals.name = 'Blossom'), 'May 24, 2020');
INSERT INTO visits(vets_id, animals_id, visit_date) VALUES((SELECT id FROM vets WHERE vets.name = 'William Tatcher'), (SELECT id FROM animals WHERE animals.name = 'Blossom'), 'Jan 11, 2021');
SELECT MIN(visit_date), animals_id FROM visits WHERE vets_id = (SELECT id FROM vets WHERE vets.name = 'Maisy Smith') GROUP BY visits.animals_id;


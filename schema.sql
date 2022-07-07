/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;
CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(50);
    CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name varchar(100),
    age INT
 );

CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100)
);

\d animals
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT  CONSTRAINT species_id REFERENCES species (id);
ALTER TABLE animals ADD COLUMN owner_id INT  CONSTRAINT owner_id REFERENCES owners (id);


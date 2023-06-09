/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');
INSERT INTO animals (name, date_of_birth,weight_kg, neutered, escape_attempts) VALUES ('Agumon','2020-02-03', 10.23, true, 0);
INSERT INTO animals (name, date_of_birth,weight_kg, neutered, escape_attempts) VALUES ('Gabumon','2018-11-05', 8, true, 2);
INSERT INTO animals (name, date_of_birth,weight_kg, neutered, escape_attempts) VALUES ('Pikachu','2021-01-07', 15.04, false, 1);
INSERT INTO animals (name, date_of_birth,weight_kg, neutered, escape_attempts) VALUES ('Devimon','2017-05-12', 11, true, 5);
ALTER TABLE animals ADD COLUMN species VARCHAR;
INSERT INTO animals (name, date_of_birth,weight_kg, neutered, escape_attempts) VALUES ('Charmander','2020-02-08', -11, false, 0);
INSERT INTO animals (name, date_of_birth,weight_kg, neutered, escape_attempts) VALUES ('Plantmon','2021-11-15', -5.7, true, 2);
INSERT INTO animals (name, date_of_birth,weight_kg, neutered, escape_attempts) VALUES ('Squirtle','1993-04-02', -12.13, false, 3);
INSERT INTO animals (name, date_of_birth,weight_kg, neutered, escape_attempts) VALUES ('Angemon','2005-06-12', -45, true, 1);
INSERT INTO animals (name, date_of_birth,weight_kg, neutered, escape_attempts) VALUES ('Boarmon','2005-06-07', 20.4, true, 7);
INSERT INTO animals (name, date_of_birth,weight_kg, neutered, escape_attempts) VALUES ('Blossom','1998-10-13', 17, true, 3);
INSERT INTO animals (name, date_of_birth,weight_kg, neutered, escape_attempts) VALUES ('Ditto','2022-05-14', 22, true, 4);
ALTER TABLE animals ADD PRIMARY KEY (id);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD COLUMN owners_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY (owners_id) REFERENCES owners(id);
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id ISNULL;
BEGIN;
UPDATE animals SET owners_id = 1 WHERE name LIKE 'Agumon';
UPDATE animals SET owners_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owners_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owners_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owners_id = 5 WHERE name IN ('Angemon', 'Boarmon');
SELECT * FROM animals;
COMMIT;
BEGIN;
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');
INSERT INTO specializations(vets_id, species_id) VALUES(1, 1);
INSERT INTO specializations(vets_id, species_id) VALUES(3, 1);
INSERT INTO specializations(vets_id, species_id) VALUES(3, 2);
INSERT INTO specializations(vets_id, species_id) VALUES(4, 2);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Agumon'),
  (SELECT vets.id FROM vets WHERE vets.name ='William Tatcher'),
  '2020-05-24'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Agumon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez'),
  '2020-07-22'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Gabumon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Jack Harkness'),
  '2021-02-02'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Pikachu'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2020-01-05'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Pikachu'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2020-03-08'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Pikachu'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2020-05-14'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Devimon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez'),
  '2021-05-04'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Charmander'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Jack Harkness'),
  '2021-02-24'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Plantmon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2019-12-21'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Plantmon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'William Tatcher'),
  '2020-08-10'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Plantmon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2021-04-07'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Squirtle'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez'),
  '2019-09-29'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Angemon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Jack Harkness'),
  '2020-10-03'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Angemon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Jack Harkness'),
  '2020-11-04'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Boarmon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2019-01-24'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Boarmon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2019-05-15'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Boarmon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2020-02-27'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Boarmon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith'),
  '2020-08-03'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Blossom'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez'),
  '2020-05-24'
);
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT animals.id FROM animals WHERE name LIKE 'Blossom'),
  (SELECT vets.id FROM vets WHERE vets.name = 'William Tatcher'),
  '2021-01-11'
);
COMMIT;
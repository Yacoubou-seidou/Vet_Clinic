/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';
select * FROM animals where Name like '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE (neutered = true) AND (escape_attempts < 3);
SELECT date_of_birth FROM animals WHERE NAME IN ( 'Agumon','Pikachu');
SELECT name, escape_attempts FROM animals WHERE (weight_kg > 10.5);
SELECT * FROM animals WHERE (neutered = true);
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE (weight_kg >= 10.4 AND weight_kg <= 17.3);
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
SELECT * FROM animals;
BEGIN;
UPDATE animals SET species = 'digimon' WHERE Name like '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT date_deletion;
UPDATE animals SET weight_kg = weight_kg * (-1);
UPDATE animals SET weight_kg = weight_kg * (-1) WHERE (weight_kg < 0);
COMMIT;
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE (escape_attempts = 0);
SELECT AVG(weight_kg)  FROM animals;
SELECT neutered,AVG(escape_attempts) AS escape FROM animals GROUP BY (neutered) ORDER BY escape DESC LIMIT 1;
SELECT MIN(weight_kg),MAX(weight_kg), species FROM animals GROUP BY species;
SELECT species,AVG(escape_attempts) AS escape FROM animals WHERE date_of_birth BETWEEN  '1990-01-01' AND '2000-01-01' GROUP BY (species) ;
SELECT animals.name, owners.full_name FROM animals JOIN owners ON animals.owners_id=owners.id WHERE full_name = 'Melody Pond';
SELECT animals.name, species.name FROM animals JOIN species ON animals.species_id=species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name, animals.name AS animal_name FROM owners LEFT JOIN animals ON owners.id=animals.owners_id;
SELECT species.name, COUNT(*) AS species_number FROM species JOIN animals ON species.id = animals.species_id GROUP BY species.name;
SELECT name AS digimon_animals, owners.full_name FROM (SELECT animals.name, animals.owners_id FROM animals JOIN SPECIES ON species_id = species.id WHERE species.name LIKE 'Digimon') AS all_digimons JOIN owners ON all_digimons.owners_id = owners.id WHERE owners.full_name LIKE 'Jennifer Orwell';
SELECT animals.name FROM animals JOIN owners ON animals.owners_id=owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts<1;
SELECT owners.full_name, COUNT(animals.name) AS all_animals from animals JOIN owners ON animals.owners_id = owners.id GROUP BY owners.full_name ORDER BY all_animals DESC LIMIT 1;
SELECT animals.name, vets.name, visits.date_of_visit
FROM animals 
JOIN visits  ON animals.id = visits.animals_id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY date_of_visit DESC LIMIT 1;
SELECT vets.name, COUNT(animals.name) AS Stephanie_Mendez_visits
FROM animals 
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY vets.name;
SELECT vets.name AS VetNames, species.name AS specialization
FROM vets
LEFT JOIN specializations ON vets.id = specializations.vets_id
LEFT JOIN species ON species.id = specializations.species_id;
SELECT vets.name, animals.name 
FROM animals 
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Stephanie Mendez' AND (date_of_visit BETWEEN  '2020-04-01' AND '2020-08-30' );
SELECT animals.name, COUNT(animals.name) as most_visit
FROM animals
JOIN visits ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER by most_visit DESC LIMIT 1;
SELECT animals.name AS animal_name, vets.name AS vet_name, visits.date_of_visit
FROM visits
JOIN vets ON visits.vets_id = vets.id
JOIN animals ON visits.animals_id = animals.id
WHERE vets.name = 'Maisy Smith'
ORDER BY date_of_visit LIMIT 1;
SELECT 
    animals.name,  
    animals.escape_attempts,
    animals.weight_kg,
    species.name,
    vets.name AS vet_name,
    visits.date_of_visit 
FROM visits
JOIN animals ON visits.animals_id = animals.id
JOIN vets ON visits.vets_id = vets.id
JOIN species ON species.id = animals.species_id
ORDER BY date_of_visit DESC LIMIT 1;
SELECT SUM(count) AS number_of_visits 
FROM (
SELECT COUNT(distinct visits.date_of_visit)
FROM visits
JOIN animals ON visits.animals_id = animals.id
LEFT JOIN specializations ON visits.vets_id = specializations.vets_id
WHERE animals.species_id <> specializations.species_id
UNION ALL
SELECT COUNT(visits.date_of_visit) FROM visits
JOIN animals ON visits.animals_id = animals.id
LEFT JOIN specializations ON visits.vets_id = specializations.vets_id
WHERE specializations.species_id ISNULL
) AS visitsTable;
SELECT species.name AS species_name, COUNT(*)
FROM visits 
JOIN animals ON visits.animals_id = animals.id 
JOIN vets ON visits.vets_id = vets.id
JOIN species ON animals.species_id = species.id 
WHERE visits.vets_id = (SELECT id FROM vets WHERE name = 'Maisy Smith')
GROUP BY species.name;

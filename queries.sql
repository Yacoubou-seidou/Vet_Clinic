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
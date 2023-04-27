-- Create the Pokemon Table with the follwing attributes --
CREATE TABLE Pokemon(
pokeid INTEGER PRIMARY KEY AUTOINCREMENT,
pokedex_number,
name, classfication ,
base_egg_steps NUMERIC,base_happiness NUMERIC,
base_total NUMERIC,capture_rate NUMERIC,
defense NUMERIC, attack NUMERIC, experience_growth NUMERIC,
height_m NUMERIC,hp NUMERIC,
percentage_male NUMERIC,sp_attack NUMERIC,
sp_defense NUMERIC,speed NUMERIC,
weight_kg NUMERIC,generation NUMERIC,
is_legendary NUMERIC);

-- Inserting the corresponding values from the poke1nf dataset (the 1nf table) into the Pokemon table
INSERT INTO Pokemon(
pokedex_number,
name,classfication,
base_egg_steps,base_happiness,
base_total,capture_rate,
defense, attack, experience_growth,
height_m,hp,
percentage_male,sp_attack,
sp_defense,speed,
weight_kg,generation,
is_legendary)
SELECT
DISTINCT pokedex_number,
name,classfication,
base_egg_steps,base_happiness,
base_total,capture_rate,
defense,attack, experience_growth,
height_m,hp,
percentage_male,sp_attack,
sp_defense,speed,
weight_kg,generation,
is_legendary
FROM poke1nf;


-- Creating the Ability table with ability id (the PK we create) and ability names --
CREATE TABLE Ability(
abilityid INTEGER PRIMARY KEY AUTOINCREMENT,
abilities_name);

-- Inserting the value of split_ab from the poke1nf(1nf dataset) into the newly created Ability table
INSERT INTO Ability(
 abilities_name)
SELECT
DISTINCT split_ab
from poke1nf;

-- Creating the Type table with typeid and type_name --
CREATE TABLE Type (
typeid INTEGER PRIMARY KEY AUTOINCREMENT,
type_name);

-- Inserting the value (Distinct type1) of type_name from the poke1nf table into the Type table --
INSERT INTO Type(
type_name)
SELECT
DISTINCT type2
FROM poke1nf;


-- Creating the Against_type table with the following attributes from table poke1nf --
CREATE TABLE Against_type AS
SELECT
DISTINCT pokedex_number, against_bug,
against_dark, against_dragon,
against_electric, against_fairy,
against_fight, against_fire,
against_flying, against_ghost,
against_grass, against_ground,
against_ice, against_normal,
against_poison, against_psychic,
against_rock, against_steel,
against_water
FROM poke1nf;

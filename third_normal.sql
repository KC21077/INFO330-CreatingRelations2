-- Create a table where joins the 1nf table and the Ability table --
CREATE TABLE abjoin AS
SELECT * FROM poke1nf
JOIN Ability ON ability.abilities_name = poke1nf.split_ab;

-- Create a linking table for Table Ability and Table Pokemon --
CREATE TABLE Poke_ab
AS SELECT
abilityid,
pokedex_number
FROM abjoin;

-- Create a table where joins the 1nf table and Type table --
CREATE TABLE typejoin AS
SELECT * FROM poke1nf
JOIN Type ON type.type_name = poke1nf.type2;

-- Create a linking table for Table Type and Table Pokemon --
CREATE TABLE Poke_type
AS SELECT
typeid,
pokedex_number
FROM typejoin;

-- Create a new Against table with type1 and type2 added --
CREATE TABLE Against AS
SELECT
DISTINCT pokedex_number,
type1,
type2,
against_bug,
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

-- Insert the type1id and type2id --
ALTER TABLE Against ADD COLUMN type1id INTEGER;
ALTER TABLE Against ADD COLUMN type2id INTEGER;

-- Update the Against table with type1id and type2id --
UPDATE Against SET type1id = (
  SELECT typejoin.typeid
  FROM typejoin
  WHERE typejoin.type1 = Against.type1
);
UPDATE Against SET type2id = (
  SELECT typejoin.typeid
  FROM typejoin
  WHERE typejoin.type2 = Against.type2
);



-- Splitting the ability column while create a new table --
CREATE TABLE poke1nf AS
SELECT pokedex_number,
name,
trim(value) AS split_ab, -- Trimming the abilities column here --
classfication,
type1, type2,
attack ,against_bug ,
against_dark ,against_dragon,
against_electric, against_fairy,
against_fight, against_fire,
against_flying, against_ghost,
against_grass, against_ground,
against_ice, against_normal,
against_poison, against_psychic,
against_rock, against_steel,
against_water, base_egg_steps,
base_happiness, base_total,
capture_rate, defense, attack,
experience_growth, height_m,
hp, percentage_male,
sp_attack, sp_defense,
speed, weight_kg ,
generation, is_legendary
FROM imported_poke,
json_each('["'|| replace(abilities,',','","')||'"]')
WHERE split_ab <>'';

-- Removing unwanted brackets and single quotes --
UPDATE poke1nf SET split_ab = REPLACE
(REPLACE(REPLACE(split_ab, '[', ''), ']', ''), "'", '');

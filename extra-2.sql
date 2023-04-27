-- Create Trainer Table and insert people into the table  --
CREATE TABLE Trainer (
  trainer_id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(80) NOT NULL,
  last_name VARCHAR(80) NOT NULL,
  fav1 NOT NULL,
  fav2
);

-- Insert data into the Trainer table --
INSERT INTO Trainer(
first_name, last_name, fav1,fav2)
VALUES ( "Ted","Neward", "fairy", NULL),
("Kaarina", "Tulleau", "psychic", "electric"),
("Karen", "Chen",  "poison", "water"),
("Qinyi"," Zhong", "ground", NULL);

-- Create table trainerteam that links Trainer table and typejoin TABLE
CREATE TABLE trainerteam AS
SELECT * FROM Trainer
JOIN typejoin ON Trainer.fav1 = typejoin.type_name;

-- Create Team table
CREATE TABLE Team AS
SELECT trainer_id, name
FROM trainerteam;

-- Add teamid to Team table(the result is probably incorrect cuz a
-- team consists more than 10 Pokemon)

ALTER TABLE Team ADD COLUMN teamid INTEGER;
UPDATE Team SET teamid = (
  SELECT Team.trainer_id
  FROM trainerteam
  WHERE trainerteam.trainer_id = Team.trainer_id
);

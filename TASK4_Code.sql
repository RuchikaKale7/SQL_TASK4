CREATE table CAR_Details2(
	Make_ID INT PRIMARY KEY,
	Make VARCHAR(50),
	Model VARCHAR(50),
	Year INT,
	Engine_Size decimal(5,2),
	Fuel_Type VARCHAR(50),
	Price decimal(10,2)
)
SELECT * from CAR_Details2
insert into CAR_Details2 (Make_ID,Make,Model,Year,Engine_Size,Fuel_Type,Price)values(10010,'Volkswagen','jetta',2010,4.2,'Petrol',54073.09)

	
SELECT * from CAR_Details2

	DELETE FROM CAR_Details2 WHERE Make_ID=1;

COPY CAR_Details2(Make_ID,Make,Model,Year,Engine_Size,Fuel_Type,Price)
FROM 'D:\cars_2010_2020.csv' DELIMITER ',' CSV HEADER;

SELECT * from CAR_Details2
	
	
 ALTER TABLE CAR_Details2 ADD COLUMN IF NOT EXISTS years_since_launch INT;

UPDATE CAR_Details2 SET years_since_launch = 2024 - Year WHERE Year IS NOT NULL;

ALTER TABLE CAR_Details2 ADD CONSTRAINT chk_years_since_launch CHECK (years_since_launch <= 10);

---finding violating rows
SELECT Make_ID,Make,Model,Year,Engine_Size,Fuel_Type,Price, 2024 - Year AS years_since_launch
FROM CAR_Details2
WHERE 2024 - Year > 10;

---Updating and removing violating rows
UPDATE CAR_Details2 
SET Year = 2024 - 10
WHERE 2024 - Year > 10;

---Reupdate the years_since_launch
UPDATE CAR_Details2  SET years_since_launch = 2024 - Year WHERE Year IS NOT NULL;

-----Adding the constraints
ALTER TABLE CAR_Details2 ADD CONSTRAINT chk_years_since_launch CHECK (years_since_launch <= 10);

-- Update rows where category is 'a1' or 'b1'
UPDATE CAR_Details2 SET years_since_launch = 5 WHERE Fuel_Type IN ('Hybrid', 'Diesel');

select * from CAR_Details2

-- Delete rows where years_since_launch is equal to 14
	begin
DELETE FROM CAR_Details2 WHERE years_since_launch = 14;

rollback

ALTER TABLE CAR_Details2 ADD CONSTRAINT chk_Fuel_Type
CHECK (Fuel_Type NOT IN ('Petrol', 'Electric', 'check'));





SELECT * FROM car_details2
WHERE fuel_type NOT IN ('Petrol','Electric');

-- Update violating rows to a valid value
UPDATE car_details2
SET fuel_type = 'Petrol'
WHERE fuel_type NOT IN ('Petrol', 'Diesel', 'Electric', 'Hybrid');

-- Alternatively, delete violating rows
-- DELETE FROM car_details2
-- WHERE fuel_type NOT IN ('Petrol', 'Diesel', 'Electric', 'Hybrid');

-- Reapply the check constraint
ALTER TABLE car_details2 ADD CONSTRAINT chk_fuel_type CHECK (fuel_type IN ('Petrol', 'Diesel', 'Electric', 'Hybrid'));

SELECT * FROM car_details2
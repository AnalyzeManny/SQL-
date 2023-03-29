--Extract Pets with their owner. 
SELECT Pets.name, Owners.name
FROM Pets 
	INNER JOIN Owners 
	ON owners.ownerid = pets.ownerid;

-- find out which pets from clinic had procedures performed.
SELECT Pets.name, ProceduresHistory.ProcedureType, ProceduresHistory.Date
FROM Pets 
	JOIN ProceduresHistory
	ON Pets.PetID = ProceduresHistory.PetID;

-- Match up all procedures performed to their descriptions. 
SELECT ProceduresDetails.ProcedureType, 
	ProceduresHistory.ProcedureType, 
		ProceduresDetails.Description
FROM ProceduresDetails
	RIGHT JOIN ProceduresHistory
	ON ProceduresDetails.ProcedureType = ProceduresHistory.ProcedureType;

-- Count of how many kind of animals are owned. 
SELECT KIND, 
	COUNT (kind) as total_Pets
FROM Pets 
GROUP BY KIND
ORDER BY total_Pets DESC; 

--ProceduresHistory Data View. 
SELECT * 
FROM ProceduresHistory;
-- Each Pet that went to Clinic in May;
SELECT  
	COUNT (DATE) AS Month_of_May
FROM ProceduresHistory
WHERE MONTH (date) = 05;

-- Each Kind of Pet and how many times in month of May. 
SELECT Pets.Kind, Pets.name, 
	COUNT (ProceduresHistory.DATE) AS Month_of_May
FROM ProceduresHistory
	JOIN Pets
	ON Pets.petid = ProceduresHistory.petid
WHERE MONTH (ProceduresHistory.date) = 05
Group By pets.kind, Pets.Name

-- Amount of visit the clininc in the 3 months. 
SELECT  
	COUNT (DATE) AS total_visits
FROM ProceduresHistory
WHERE YEAR (date) = 2016;

-- Amount of visits in the first 3 months.
SELECT  
	COUNT (DATE) AS Visits_first_three_Months
FROM ProceduresHistory
WHERE MONTH (date) IN (01, 02, 03)

-- Pets with 3 Vaccinations.  
SELECT Pets.Name, 
	COUNT (ProceduresHistory.ProcedureType) TOTAL_VACCINCATIONS
FROM Pets
	JOIN ProceduresHistory
	ON Pets.PetID = ProceduresHistory.PetID
WHERE Proceduretype = 'VACCINATIONS'
GROUP BY NAME 
HAVING COUNT (*) > 2





-- Date when nobel was awared with date standarisation
SELECT 
	fullname,
    year, 
    (CASE 
            WHEN standardised_died IS "0000" THEN 2023 - standardised_born 
            ELSE year - standardised_born 
        END) AS age_at_award
FROM 
    (
        SELECT
            year,
			fullname,
			category,
            CASE
                WHEN born LIKE '__/__/____' THEN SUBSTR(born, 7, 4)
                WHEN born LIKE '____-__-__' THEN SUBSTR(born, 1, 4)
                ELSE NULL
            END AS standardised_born,
            CASE
                WHEN died LIKE '__/__/____' THEN SUBSTR(died, 7, 4)
                WHEN died LIKE '_/__/____' THEN SUBSTR(died, 6, 4)
                WHEN died LIKE '____-__-__' THEN SUBSTR(died, 1, 4)
                ELSE NULL
            END AS standardised_died
        FROM
            nobel_laureates_data
    ) AS standardised_data
WHERE 
    category = 'literature'
	
-- Country born	
SELECT 
    borncountry, 
	fullname
FROM 
	nobel_laureates_data
WHERE 
    category = 'literature'
GROUP BY
	fullname

-- motivation
SELECT 
    motivation, 
	fullname
FROM 
	nobel_laureates_data
WHERE 
    category = 'literature'




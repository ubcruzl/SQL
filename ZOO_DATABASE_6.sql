/* ZOO DATABASE ASSIGNMENT 1*/

USE db_zoo
GO
SELECT * FROM tbl_habitat;

/* ZOO DATABASE ASSIGNMENT 2*/

USE db_zoo
GO
SELECT species_name FROM  tbl_species
WHERE
species_order=3;

/* ZOO DATABASE ASSIGNMENT 3 */
USE db_zoo
GO
SELECT nutrition_type FROM  tbl_nutrition
WHERE
nutrition_cost<=600;

/* ZOO DATABASE ASSIGNMENT 4 */
USE db_zoo
GO
SELECT 
	a1.species_name
FROM  
	tbl_species a1 
	INNER JOIN tbl_nutrition a2 ON a2.nutrition_id=a1.species_nutrition
WHERE a1.species_nutrition BETWEEN 2202 AND 2206
;

/* ZOO DATABASE ASSIGNMENT 5 */
USE db_zoo
GO
SELECT 
	a1.species_name as 'Species Name', a2.nutrition_type as 'Nutrition Type'
FROM  
	tbl_species a1 
	INNER JOIN tbl_nutrition a2 ON a2.nutrition_id=a1.species_nutrition
;
/* ZOO DATABASE ASSIGNMENT 6 */
USE db_zoo
GO
SELECT * FROM tbl_specialist;
SELECT * FROM tbl_species;
SELECT * FROM tbl_care;

SELECT 
	a1.specialist_fname AS 'First Name', a1.specialist_lname AS 'Last Name', a1.specialist_contact AS 'Contact'
FROM 
	tbl_specialist a1 
	INNER JOIN tbl_care a2 ON a2.care_specialist=a1.specialist_id
	INNER JOIN tbl_species a3 ON a3.species_care=a2.care_id
WHERE 
	a3.species_name='panda'
;
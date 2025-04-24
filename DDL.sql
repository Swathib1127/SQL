/* CREATE a table called person
with coumn id, person_name, roll_num, phone_num and Date_of_Birth*/

CREATE TABLE person(
id INT NOT NULL, 
Person_name VARCHAR(50),
roll_num INT NOT NULL,
Phone_num INT NOT NULL,
Date_of_Birth DATE,
CONSTRAINT pk_person PRIMARY KEY(id)
)

/* ALTER - add a new colunm to the table(person)
ALTER TABLE person
ADD email VARCHAR(50) NOT NULL

--To view the complete table use the below command
SELECT * FROM person

/*ALTER- drom a column from the table
ALTER TABLE person
DROP COLUNM phone_num

-- To delete complete table(person) 
DROP TABLE person

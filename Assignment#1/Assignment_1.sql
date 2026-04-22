

DROP TABLE IF EXISTS Orderr;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------TASK #1 :
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  CREATE TABLE Department (

   DepartmentID int PRIMARY KEY,
    DepartmentName varchar (50) ,
    ManagerID int
);

 
CREATE TABLE Employee (

  EmployeeID int PRIMARY KEY,
    FirstName varchar (50) ,
    LastName varchar (50) ,
    Email varchar (100),
    DepartmentID int, 
FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID)

);


ALTER TABLE Department
ADD CONSTRAINT FK_Department_Manager FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID);


 CREATE TABLE Customer (
    CustomerID int PRIMARY KEY,
    FirstName varchar ( 50 ) ,
    LastName varchar (50),
    Email varchar (100) 

);

  CREATE TABLE Orderr (
    OrderID int PRIMARY KEY,
    OrderDate DATE,
    CustomerID int ,

    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
 );



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------TASK #2 :
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Department (DepartmentID, DepartmentName, ManagerID) 
VALUES
 (1, 'It',NULL) ,
(2, 'Design',NULL) ,
(3, 'Sales',NULL) ,
(4, 'HR', NULL ),
(5, 'Marketing', NULL)
;


INSERT INTO Employee (EmployeeID, FirstName, LastName, Email, DepartmentID)
VALUES
  (1, 'Dana', 'Shami','dana_shami@example.com',1),
(2, 'Ahmad', 'Shami',   'ahmad_shami@example.com', 2),
(3,'Layla','Shami', 'layla_shami@example.com',3),
(4, 'Omar', 'Shami',   'omar_shami@example.com',4),
(5,'Yazan', 'Shami', 'yazan_shami@example.com',  5);

UPDATE Department SET ManagerID = 1 WHERE DepartmentID = 1; 
UPDATE Department SET ManagerID = 2 WHERE DepartmentID = 2; 
UPDATE Department SET ManagerID = 3 WHERE DepartmentID = 3;  
UPDATE Department SET ManagerID = 4 WHERE DepartmentID = 4;  
UPDATE Department SET ManagerID = 5 WHERE DepartmentID = 5;

INSERT INTO Customer (CustomerID, FirstName, LastName, Email) 
VALUES
  (100, 'Sara', 'Shami','sara_shami@example.com'),
(200, 'Zeina', 'Shami', 'zeina_shami@example.com'),
(300, 'Jana','Shami', 'jana_shami@example.com'),
(400, 'Abood','Shami', 'abood_shami@example.com'),
(500, 'Noor', 'Shami', 'noor_shami@example.com');



INSERT INTO Orderr (OrderID, OrderDate, CustomerID)
 VALUES (1000, '2026-2-1', 100),
    (2000, '2026-2-3', 200),
  (3000, '2026-2-5', 300),
  (4000, '2026-2-10', 400),
  (5000, '2026-2-12', 500)
  ;


  
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------TASK #3 :
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT Employee.EmployeeID ,  Employee.FirstName , Employee.LastName, Employee.Email
FROM Employee
JOIN Department ON Employee.DepartmentID=Department.DepartmentID
WHERE Department.DepartmentName ='Sales';

SELECT COUNT(*) AS TotalOrders
FROM Orderr;


SELECT DISTINCT Customer.CustomerID, Customer.FirstName, Customer.LastName
FROM Customer
JOIN Orderr ON Customer.CustomerID = Orderr.CustomerID;



UPDATE Employee
SET Email=' newemail@example.com '
WHERE EmployeeID = 1;



DELETE FROM Orderr
WHERE CustomerID = 300;

DELETE FROM Customer
WHERE CustomerID = 300;
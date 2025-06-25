-- 1. Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

--2. Insert three records into the Employeestable using different INSERT INTO approaches (single-row insert and multiple-row insert).
INSERT INTO Employees (EmpID, Name, Salary) VALUES (1, 'Ali', 5000.00);

INSERT INTO Employees (EmpID, Name, Salary) VALUES 
(2, 'Vali', 6000.00),
(3, 'Hasan', 5500.00);

--3. Update the Salary of an employee to 7000 where EmpID = 1.
UPDATE Employees SET Salary = 7000 WHERE EmpID = 1;

--4. Delete a record from the Employeestable where EmpID = 2.
DELETE FROM Employees WHERE EmpID = 2;

--5. Give a brief definition for difference between DELETE, TRUNCATE, and DROP.
/*• DELETE: Jadvaldagi ma’lumotlarni tanlab o‘chiradi, WHERE sharti bilan ishlaydi.
• TRUNCATE: Jadvaldagi barcha yozuvlarni tezda o‘chiradi, qaytarib bo‘lmaydi, lekin struktura qoladi.
• DROP: Butun jadvalni (strukturasi bilan) o‘chiradi.*/

--6. Modify the Name column in the Employees table to VARCHAR(100).
ALTER TABLE Employees ALTER COLUMN Name VARCHAR(100);

--7. Add a new column Department(VARCHAR(50)) to the Employees table.
ALTER TABLE Employees ADD Department VARCHAR(50);

--8. Change the data type of the Salarycolumn to FLOAT.
ALTER TABLE Employees ALTER COLUMN Salary FLOAT;

--9. Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName(VARCHAR(50)).
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

--10. Remove all records from the Employeestable without deleting its structure.
DELETE FROM Employees;

--11. Insert five records into the Departmentstable using INSERT INTO SELECTmethod(you can write anything you want as data).
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'HR' UNION
SELECT 2, 'IT' UNION
SELECT 3, 'Sales' UNION
SELECT 4, 'Marketing' UNION
SELECT 5, 'Finance';

--12. Update the Department of all employees where Salary > 5000 to 'Management'.
UPDATE Employees SET Department = 'Management' WHERE Salary > 5000;

--13. Write a query that removes all employees but keeps the table structure intact.
DELETE FROM Employees;

--14. Drop the Department column from the Employees table.
ALTER TABLE Employees DROP COLUMN Department;

--15. Rename the Employees table to StaffMembers using SQL commands.
EXEC sp_rename 'Employees', 'StaffMembers';

--16. Write a query to completely remove the Departments table from the database.
DROP TABLE Departments;

--17. Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL).
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Description TEXT
);

--18. Add a CHECK constraint to ensure Price is always greater than 0.
ALTER TABLE Products
ADD CONSTRAINT chk_price CHECK (Price > 0);

--19. Modify the table to add a StockQuantity column with a DEFAULT value of 50.
ALTER TABLE Products ADD StockQuantity INT DEFAULT 50;

--20. Rename Category to ProductCategory
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

--21. Insert 5 records into the Products table using standard INSERT INTO queries.
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
VALUES 
(1, 'Laptop', 'Electronics', 1200.00, 'High-end laptop'),
(2, 'Phone', 'Electronics', 700.00, 'Smartphone'),
(3, 'Mouse', 'Accessories', 25.00, 'Wireless mouse'),
(4, 'Keyboard', 'Accessories', 45.00, 'Mechanical keyboard'),
(5, 'Monitor', 'Electronics', 200.00, '24 inch monitor');

--22. Use SELECT INTO to create a backup table called Products_Backup containing all Products data.
SELECT * INTO Products_Backup FROM Products;

--23. Rename the Products table to Inventory
EXEC sp_rename 'Products', 'Inventory';

--24. Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT
ALTER TABLE Inventory ALTER COLUMN Price FLOAT;

--25. Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.
ALTER TABLE Inventory ADD ProductCode INT IDENTITY(1000, 5);

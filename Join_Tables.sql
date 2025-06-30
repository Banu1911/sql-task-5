CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    Phone VARCHAR(10)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(100),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

// Value Insertion

INSERT INTO Customers VALUES 
(1, 'Ammu', 'Chennai','9677345678'),
(2, 'Priya', 'Delhi','7866543298'),
(3, 'Rahul', 'Mumbai','9976549765'),
(4, 'Ankit', 'Kolkata','7865329812');

INSERT INTO Orders VALUES 
(101, 1, 'Laptop', 65000),
(102, 2, 'Tablet', 25000),
(103, 1, 'Keyboard', 1500),
(104, 5, 'Monitor', 10000); 

//Getting Output Using Joins
  
//INNER JOIN

SELECT Customers.CustomerName, Orders.Product
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
( Shows only customers who placed orders.)

//LEFT JOIN

SELECT Customers.CustomerName, Orders.Product
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
( Shows all customers, with orders if available.)

//RIGHT JOIN (MySQL supports it; SQLite does not)

SELECT Customers.CustomerName, Orders.Product
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
( Shows all orders, even those without matching customers.)

//FULL OUTER JOIN (not directly supported in SQLite)

SELECT Customers.CustomerName, Orders.Product
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerName, Orders.Product
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
( Returns all records when there is a match in either table.)


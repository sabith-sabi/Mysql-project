CREATE DATABASE libraries;

USE libraries;

-- Table: Branch
CREATE TABLE Branch (
  Branch_no INT PRIMARY KEY,
  Manager_Id INT,
  Branch_address VARCHAR(200),
  Contact_no VARCHAR(15)
);

-- Table: Employee
CREATE TABLE Employee (
  Emp_Id INT PRIMARY KEY,
  Emp_name VARCHAR(20),
  Position VARCHAR(20),
  Salary DECIMAL(10, 2)
);

-- Table: Customer
CREATE TABLE Customer (
  Customer_Id INT PRIMARY KEY,
  Customer_name VARCHAR(20),
  Customer_address VARCHAR(200),
  Reg_date DATE
);

-- Table: IssueStatus
CREATE TABLE IssueStatus (
  Issue_Id INT PRIMARY KEY,
  Issued_cust INT,
  Issued_book_name VARCHAR(20),
  Issue_date DATE,
  Isbn_book VARCHAR(20),foreign key(Issued_cust) references Customer(Customer_id),
						foreign key(isbn_book) references Books(isbn));

-- Table: ReturnStatus
CREATE TABLE ReturnStatus (
  Return_Id INT PRIMARY KEY,
  Return_cust INT,
  Return_book_name VARCHAR(20),
  Return_date DATE,
  Isbn_book2 VARCHAR(20), foreign key(isbn_book2) references Books(isbn));
 
);

-- Table: Books
CREATE TABLE Books (
  ISBN VARCHAR(20) PRIMARY KEY,
  Book_title VARCHAR(20),
  Category VARCHAR(20),
  Rental_Price DECIMAL(10, 2),
  Status ENUM('yes', 'no'),
  Author VARCHAR(20),
  Publisher VARCHAR(20)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
    (1, 101, 'Street no 1', '564777890'),
    (2, 102, 'Street no 2', '9876543210'),
    (3, 103, 'Street no 3', '7997790555'),
    (4, 104, 'Street no 4', '6588657899'),
    (5, 105, 'Street no 5', '5757899991');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary)
VALUES
(101, 'Arun', 'Manager', 12000.00),
(102, 'vinu', 'Hr', 14000.00),
(103, 'Manu', 'Manager', 25000.00),
(104, 'ajay', 'Assistant ', 20000.00),
(105, 'rahul', 'Branch Manager', 22000.00);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1001, 'Anushka', 'Street  Abc', '2023-09-13'),
(1002, 'Sara', 'Street  Acv', '2023-11-15'),
(1003, 'Sachin', 'Street  hgh', '2023-12-30'),
(1004, 'Aparna', 'Street  kjk', '2023-10-10'),
(1005, 'Kiran', 'Street  pop', '2023-09-20');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1, 11, 'Book A', '2023-12-01', 'ISBN-111'),
(2, 12, 'Book B', '2023-11-02', 'ISBN-112'),
(3, 13, 'Book C', '2023-10-03', 'ISBN-113'),
(4, 14, 'Book D', '2023-09-04', 'ISBN-114'),
(5, 15, 'Book E', '2023-08-05', 'ISBN-115');

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(1, 1001, 'Book A', '2023-11-10', 'ISBN-1'),
(2, 1002, 'Book B', '2023-12-12', 'ISBN-2'),
(3, 1003, 'Book C', '2023-09-15', 'ISBN-3'),
(4, 1004, 'Book D', '2023-08-20', 'ISBN-4'),
(5, 1005, 'Book E', '2023-06-25', 'ISBN-5');

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('ISBN-1', 'Book A', 'crime thriller', 100.00, 'Yes', 'Author A', 'cristopher'),
('ISBN-2', 'Book B', 'Drama', 121.50, 'Yes', 'Author B', 'John'),
('ISBN-3', 'Book C', 'Mystery', 118.00, 'No', 'Author C', 'luther'),
('ISBN-4', 'Book D', 'science Fiction', 129.99, 'Yes', 'Author D', 'hasan'),
('ISBN-5', 'Book E', 'comedy', 111.25, 'No', 'Author E', 'Vinu');

SELECT Book_title, category, Rental_price
FROM books
WHERE Status = 'Yes';

SELECT Emp_Name, Salary
FROM Employee
ORDER BY Salary DESC;

SELECT issue_status.Issued_book_name, customer.Customer_name 
FROM issue_status
join customer
on issue_status.Issued_cust = customer.Customer_id;

select issue_status.Issued_book_name, customer.Customer_name 
from issue_status join customer
on issue_status.Issued_cust = customer.Customer_id;

SELECT Category, COUNT(*) AS TotalCount
FROM Books
GROUP BY Category;

SELECT Emp_Name, Position
FROM Employee
WHERE Salary > 50000;


select Customer_name from customer where Reg_date < '2023-11-15' and
 Customer_id not in(select Issued_cust from issue_status);




 select branch.Branch_no, count(employee.Emp_name) 
 from branch join employee
 on branch.Manager_id = employee.Emp_id
 group by branch.Branch_no;

select customer.Customer_name from 
 customer join issue_status
 on customer.Customer_id = issue_status.Issued_cust 
 where issue_status.Issue_date > '2023-11-15';
 
 select Book_title from books where  Book_title like '%Book A%';
 
 
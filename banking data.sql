use bankingsystem;
create table customer(
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
gender CHAR(1),
dob DATE,
email VARCHAR(100),
phone VARCHAR(15),
address VARCHAR(255)
);
create table account(
account_id INT PRIMARY KEY,
customer_id INT,
account_type VARCHAR(20),
balance DECIMAL(12,2),
open_date DATE,
status VARCHAR(20),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
CREATE TABLE Transaction (
  transaction_id INT PRIMARY KEY,
  account_id INT,
  txn_type VARCHAR(10), -- 'Credit' or 'Debit'
  amount DECIMAL(10,2),
  txn_date DATETIME,
  description TEXT,
  FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

create table Loan(
loan_id INT PRIMARY KEY,
customer_id INT,
loan_type VARCHAR(20),
loan_amount DECIMAL(12,2),
interest_rate DECIMAL(5,2),
start_date DATE,
end_date DATE,
status VARCHAR(20),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
create table LoanPayment(
payment_id INT PRIMARY KEY,
loan_id INT,
payment_date DATE,
amount_paid DECIMAL(12,2),
FOREIGN KEY (loan_id) REFERENCES Loan(loan_id)
);
create table Branch(
branch_id INT PRIMARY KEY,
branch_name VARCHAR(50),
location VARCHAR(100),
manager_name VARCHAR(50)
);
create table employee(
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
position VARCHAR(50),
branch_id INT,
hire_date DATE,
FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);
INSERT INTO customer VALUES (1, 'Amit', 'Sharma', 'M', '1990-06-01', 'amit@gmail.com', 6782739827, 'Delhi');
INSERT INTO account VALUES ( 101, 1, 'Savings', 20000,'2022-02-01', 'Active');
INSERT INTO Transaction VALUES (1001, 101, 'Credit', 20000.00, '2023-06-01 10:00:00', 'Initial deposit');
INSERT INTO Loan VALUES (1, 1, 'Home Loan', 500000.00, 7.5, '2023-01-01', '2028-01-01', 'Approved');
INSERT INTO LoanPayment VALUES (1, 1, '2023-06-01', 10000.00);
SELECT * FROM Customer;
SELECT * FROM Account;
SELECT * FROM Transaction;

select c.first_name, c.last_name, a.account_type, a.balance
from customer c join account a on c.customer_id=a.customer_id;

SELECT txn_type, SUM(amount) AS total
FROM Transactions
GROUP BY txn_type;
SELECT loan_id, SUM(amount_paid) AS total_paid
FROM LoanPayments
GROUP BY loan_id;
INSERT INTO customers (customer_id, first_name, last_name, gender, dob, email, phone, address)
VALUES
(2, 'Riya', 'Mehta', 'F', '1992-08-15', 'riya@gmail.com', '9898989898', 'Mumbai'),
(3, 'John', 'Doe', 'M', '1985-01-20', 'john.doe@gmail.com', '9876540000', 'Chennai'),
(4, 'Priya', 'Kumar', 'F', '1995-03-05', 'priya.kumar@gmail.com', '9123456789', 'Kolkata');
INSERT INTO accounts (account_id, customer_id, account_type, balance, open_date, status)
VALUES
(102, 2, 'Current', 75000.00, '2023-05-10', 'Active'),
(103, 3, 'Savings', 32000.00, '2022-11-15', 'Active'),
(104, 4, 'Current', -5000.00, '2023-01-20', 'Overdrawn');
INSERT INTO Transaction (transaction_id, account_id, txn_type, amount, txn_date, description)
VALUES
(1002, 102, 'Debit', 5000.00, '2023-07-15 12:00:00', 'Bill Payment'),
(1003, 103, 'Credit', 10000.00, '2023-07-01 09:30:00', 'Salary'),
(1004, 104, 'Debit', 10000.00, '2023-06-25 16:00:00', 'ATM Withdrawal');
INSERT INTO Loan (loan_id, customer_id, loan_type, loan_amount, interest_rate, start_date, end_date, status)
VALUES
(1, 1, 'Home Loan', 500000.00, 7.5, '2023-01-01', '2028-01-01', 'Approved'),
(2, 2, 'Car Loan', 300000.00, 8.2, '2023-02-01', '2026-02-01', 'Approved'),
(3, 3, 'Personal Loan', 150000.00, 11.0, '2023-03-01', '2025-03-01', 'Pending'),
(4, 4, 'Education Loan', 250000.00, 6.5, '2023-04-01', '2027-04-01', 'Approved');
INSERT INTO LoanPayment (payment_id, loan_id, payment_date, amount_paid)
VALUES
(1, 1, '2023-06-01', 10000.00),
(2, 1, '2023-07-01', 12000.00),
(3, 2, '2023-07-10', 5000.00),
(4, 4, '2023-06-20', 8000.00);
INSERT INTO Branch (branch_id, branch_name, location, manager_name)
VALUES
(1, 'Central Branch', 'Delhi', 'Rajesh Verma'),
(2, 'South Branch', 'Mumbai', 'Anita Iyer'),
(3, 'East Branch', 'Kolkata', 'Arjun Das');
INSERT INTO Employee (employee_id, first_name, last_name, position, branch_id, hire_date)
VALUES
(101, 'Neha', 'Singh', 'Manager', 1, '2020-05-01'),
(102, 'Karan', 'Jain', 'Loan Officer', 2, '2021-07-15'),
(103, 'Simran', 'Kaur', 'Cashier', 3, '2022-03-10');
SELECT * FROM account WHERE account_id = 101;
INSERT INTO Transaction (transaction_id, account_id, txn_type, amount, txn_date, description)
VALUES (1001, 101, 'Credit', 20000.00, '2023-06-01 10:00:00', 'Initial deposit');
SELECT c.customer_id, c.first_name, a.account_id, a.balance
FROM account a
JOIN customer c ON a.customer_id = c.customer_id
WHERE a.balance < 0;
SELECT * FROM loan
WHERE status = 'Approved';

SELECT account_id FROM accounts;





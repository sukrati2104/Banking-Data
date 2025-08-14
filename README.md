# Banking-Data
1) Overview- This project is a simulation of a core banking system database designed using MySQL.
It manages customers, accounts, transactions, loans, loan payments, bank branches, and employees — all connected through primary keys and foreign keys to ensure relational integrity.
The database supports reporting, analytics, and operational queries for realistic banking operations.

2) The database bankingsystem contains 7 main tables:
Customer-Stores customer personal information: ID, name, gender, DOB, email, phone, address.  Primary Key: customer_id
Account- Stores account details for each customer: type (Savings/Current), balance, open date, status. Primary Key: account_id . Foreign Key: customer_id → links each account to its customer.
Transaction- Logs all money movements: transaction type (Credit/Debit), amount, date, and description.. Primary Key: transaction_id. Foreign Key: account_id → links to the related account.
Loan- Stores loan details: loan type, amount, interest rate, start/end dates, status. Primary Key: loan_id. Foreign Key: customer_id → links loan to the borrower.
LoanPayment- Records payments made toward loans. Primary Key: payment_id . Foreign Key: loan_id → links payment to a loan.
Branch- Stores branch details: branch name, location, manager. Primary Key: branch_id
Employee- Stores employee info: name, position, branch, hire date. Primary Key: employee_id. Foreign Key: branch_id → links employee to the branch.

3) The ER diagram illustrates entities (tables) and their relationships:
Customer → Account → Transaction: One customer can have multiple accounts, and each account can have multiple transactions.
Customer → Loan → LoanPayment: One customer can have multiple loans, and each loan can have multiple payments.
Branch → Employee: One branch can have multiple employees assigned to it.

4) Features
Relational integrity → Foreign keys ensure linked data stays consistent. Scalability → Structure can easily handle more customers, accounts, and branches.
Reporting-ready → Can generate summaries for transactions, loans, and payments. Realistic simulation → Covers essential banking operations.

5) Real-World Use Case
This system could serve as the backend for: A bank’s internal management system for tracking accounts, transactions, and loans.
Training datasets for data analysts to practice SQL queries and business reporting. Integration base for banking web/mobile apps.

6) In the dashboard, I used multiple visuals:
A Loan Amount by Customer chart showing Amit with ₹5,00,000 (47.6%), Riya with ₹3,00,000 (28.6%), and Priya with ₹2,50,000 (23.8%), giving a total loan portfolio of ₹10.5 lakh.
A Balance by Customer ID chart showing who has high balances and who’s overdrawn — for example, Riya has ₹75K, Amit has ₹50K, John ₹32K, and Priya is at -₹5K (overdraft).
A Transaction Amount by Account ID pie showing 44.44% from account 101, 22.22% each from accounts 103 and 104, and 11.11% from account 102.
A Transaction Type by Year bar showing credits and debits in 2023, which helps analyze cash inflows vs. outflows.
Transaction Count by Account Type shows activity distribution between Current and Savings accounts.
A Loan Status Count showing how many loans are approved for different loan types (Home, Car, Education).
A Transaction Amount by Description chart highlighting what transactions are for — such as initial deposits, ATM withdrawals, salaries, and bill payments.
The idea is to give a banking manager a quick view of loan distribution, account balances, transaction patterns, and potential risk areas like overdrafts. This dashboard combines raw SQL data with Power BI visualizations to make decision-making faster and more data-driven.

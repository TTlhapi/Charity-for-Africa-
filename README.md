# Charity-for-Africa-
Donation Management Database System

# Donation Management Database System

## Overview

This database system is designed to manage customer information, employees, donors, donations, deliveries, and returned products for a donation management organization.

The system demonstrates the use of:

* Relational database design
* Primary and foreign keys
* Constraints
* Data management using SQL
* Oracle SQL database concepts

---

# Database Tables

## 1. Customers Table

### Purpose

Stores customer details.

### Structure

| Column Name    | Data Type     | Description          |
| -------------- | ------------- | -------------------- |
| Customers_ID   | NUMBER        | Primary Key          |
| First_Name     | VARCHAR2(50)  | Customer first name  |
| Surname        | VARCHAR2(50)  | Customer surname     |
| Address        | VARCHAR2(200) | Customer address     |
| Contact_Number | VARCHAR2(20)  | Phone number         |
| Email          | VARCHAR2(100) | Unique email address |

### Constraints

* Primary Key on `Customers_ID`
* Unique constraint on `Email`
* `First_Name` and `Surname` cannot be NULL

---

# 2. Employee Table

## Purpose

Stores employee information.

## Structure

| Column Name    | Data Type     | Description         |
| -------------- | ------------- | ------------------- |
| Employee_ID    | NUMBER        | Primary Key         |
| First_Name     | VARCHAR2(50)  | Employee first name |
| Surname        | VARCHAR2(50)  | Employee surname    |
| Contact_Number | VARCHAR2(20)  | Contact number      |
| Address        | VARCHAR2(200) | Employee address    |
| Email          | VARCHAR2(100) | Unique email        |

### Constraints

* Primary Key on `Employee_ID`
* Unique constraint on `Email`

---

# 3. Donator Table

## Purpose

Stores donor information.

## Structure

| Column Name    | Data Type     | Description      |
| -------------- | ------------- | ---------------- |
| Donator_ID     | NUMBER        | Primary Key      |
| First_Name     | VARCHAR2(50)  | Donor first name |
| Surname        | VARCHAR2(50)  | Donor surname    |
| Contact_Number | VARCHAR2(20)  | Contact number   |
| Email          | VARCHAR2(100) | Unique email     |

---

# 4. Donation Table

## Purpose

Stores donated items and donation details.

## Structure

| Column Name   | Data Type    | Description          |
| ------------- | ------------ | -------------------- |
| Donation_ID   | NUMBER       | Primary Key          |
| Donator_ID    | NUMBER       | Foreign Key          |
| Donation      | VARCHAR2(50) | Name of donated item |
| Price         | VARCHAR2(20) | Item value           |
| Donation_Date | DATE         | Date of donation     |

### Relationships

* `Donator_ID` references `Donator(Donator_ID)`

---

# 5. Delivery Table

## Purpose

Stores delivery records.

## Structure

| Column Name    | Data Type    | Description              |
| -------------- | ------------ | ------------------------ |
| Delivery_ID    | NUMBER       | Primary Key              |
| Delivery_Notes | VARCHAR2(50) | Notes regarding delivery |
| Dispatch_Date  | DATE         | Dispatch date            |
| Delivery_Date  | DATE         | Delivery completion date |

---

# 6. Returns Table

## Purpose

Stores customer return information.

## Structure

| Column Name  | Data Type    | Description   |
| ------------ | ------------ | ------------- |
| Returns_ID   | NUMBER       | Primary Key   |
| Returns_Date | DATE         | Date returned |
| Reason       | VARCHAR2(50) | Return reason |
| Customers_ID | NUMBER       | Foreign Key   |

### Relationships

* `Customers_ID` references `Customers(Customers_ID)`

---

# Database Relationships

The database uses foreign keys to maintain referential integrity.

### Relationships Include:

* Donation → Donator
* Returns → Customers

These relationships ensure data consistency between tables.

---

# Features of the Database

* Customer management
* Employee management
* Donation tracking
* Delivery tracking
* Product return management
* Data integrity using constraints
* Unique email validation
* Relational database structure

---

# Sample Data Included

The script contains sample records for:

* Customers
* Employees
* Donators
* Donations
* Deliveries
* Returns

These records can be used for:

* Database testing
* Query demonstrations
* Academic purposes
* SQL practice

---

# Issues and Corrections Required

The current script contains several syntax and logical errors that should be corrected before execution.

---

# 1. Multiple INSERT Syntax Error

Oracle SQL does not support multiple records inside one `VALUES` clause.

### Incorrect

```sql
INSERT INTO Customers (...)
VALUES (...), (...);
```

### Correct Method

Use separate INSERT statements or `INSERT ALL`.

Example:

```sql
INSERT ALL
INTO Customers VALUES (...)
INTO Customers VALUES (...)
SELECT * FROM dual;
```

---

# 2. Incorrect Customer Name Formatting

Some customer records combine first name and surname into one value.

### Incorrect

```sql
'Jeff,Jones'
```

### Correct

```sql
'Jeff', 'Jones'
```

---

# 3. Employee INSERT Statement Error

The Employee table uses `Employee_ID`, but the INSERT statement references `Customers_ID`.

### Incorrect

```sql
INSERT INTO Employee (Customers_ID, ...)
```

### Correct

```sql
INSERT INTO Employee (Employee_ID, ...)
```

---

# 4. Invalid Employee IDs

Values such as:

```sql
emp101
```

are invalid for a NUMBER column.

### Correct Example

```sql
101
```

---

# 5. Incorrect Foreign Key Reference

### Incorrect

```sql
REFERENCES Donators(Donator_ID)
```

### Correct

```sql
REFERENCES Donator(Donator_ID)
```

---

# 6. Delivery INSERT Errors

The Delivery table contains 4 columns, but the INSERT statements attempt to insert 5 values.

### Table Columns

* Delivery_ID
* Delivery_Notes
* Dispatch_Date
* Delivery_Date

The inserted values do not match the structure.

---

# 7. Missing Comma in Returns Table

### Incorrect

```sql
Customers_ID Number
CONSTRAINT fk_customers_id ...
```

### Correct

```sql
Customers_ID Number,
CONSTRAINT fk_customers_id ...
```

---

# 8. Returns INSERT Statement Errors

Problems include:

* Too many inserted values
* Invalid NUMBER values such as:

```sql
ret001
```

If the column is NUMBER, IDs must be numeric.

### Correct Example

```sql
1
```

---

# 9. Incorrect DATE Formatting

Oracle requires proper date formatting.

### Recommended Format

```sql
TO_DATE('01-MAY-2024', 'DD-MON-YYYY')
```

---

# Recommended Improvements

## Data Type Improvements

* Store `Price` as NUMBER instead of VARCHAR2
* Use DATE functions for inserting dates
* Add CHECK constraints where needed
* Add NOT NULL constraints for important columns

---

# Example Corrected Donation INSERT

```sql
INSERT INTO Donation
(Donation_ID, Donator_ID, Donation, Price, Donation_Date)
VALUES
(7111, 20111, 'KIC Fridge', 599,
TO_DATE('01-MAY-2024', 'DD-MON-YYYY'));
```

---

# Technologies Used

* Oracle SQL
* Relational Database Management System (RDBMS)
* SQL Constraints
* Foreign Keys
* Primary Keys
* Data Integrity Rules

---

# How to Run the Script

1. Open Oracle SQL Developer or another Oracle-compatible DBMS.
2. Create a new schema or database.
3. Execute the CREATE TABLE statements.
4. Insert the sample data.
5. Run queries to test functionality.

---

# Conclusion

This Donation Management Database System provides a structured solution for managing:

* Customers
* Employees
* Donors
* Donations
* Deliveries
* Product returns

The project demonstrates important database concepts including:

* Relational design
* Data integrity
* SQL table creation
* Constraints
* Foreign key relationships
* Database normalization principles

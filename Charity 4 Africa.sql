CREATE TABLE Customers (
  Customers_ID NUMBER PRIMARY KEY,
  First_Name VARCHAR2(50) NOT NULL,
  Surname VARCHAR2(50) NOT NULL,
  Address VARCHAR2(200),
  Contact_Number VARCHAR2(20),
  Email VARCHAR2(100) UNIQUE
);

INSERT INTO Customers (Customers_ID, First_Name, Surname, Address, Contact_Number, Email)
VALUES (11011,'Bob','Smith','18 Water rd','0877277521','bobs@isat.com'),
(11012,'Sam','Hendricks','22 Water rd','0863257857','shen@mcom.co.za'),
(11013,'Larry','Clark','101 Summer lane','0834567891','larc@mcom.co.za'),
(11014,'Jeff,Jones','55 Mountain way','0612547895','jj@isat.co.za'),
(11015,'Andre,Kerk','5 Main rd','0827238521','akerk@mcal.co.za'),
(11016,'Wayne,Smith','13 Water rd','0877277522','ws@isat.com'),
(11017,'John,Hendricks','29 Water rd','0863257851','jhen@mcom.co.za'),
(11018,'Sally','Clark','111 Summer lane','0834567892','sallyc@mcom.co.za'),
(11019,'Bridget,Bitterhour','125 Mountain way','0612547896','bb@isat.co.za'),
(11111,'Nicole','Kerk','175 Main rd','0827238529','nk@mcal.co.za'),
(11112,'Catherine','Smith','19 Water rd','0877277523','cath@isat.com'),
(11113,'Mel','Hendricks','5 Water rd','0863257852','melh@mcom.co.za'),
(11114,'Lucy,Du Plessis','221 Summer lane','0834567892','ldup@mcom.co.za'),
(11116,'Josh','Maverick','155 Mountain way','0612547897','joshm@isat.co.za'),
(11117,'Stuart','Jones','35 Main rd','0827238521','sjones@mcal.co.za');

CREATE TABLE Employee (
  Employee_ID NUMBER PRIMARY KEY,
  First_Name VARCHAR2(50) NOT NULL,
  Surname VARCHAR2(50) NOT NULL,
  Contact_Number VARCHAR2(20),
  Address VARCHAR2(200),
  Email VARCHAR2(100) UNIQUE
);

INSERT INTO Employee (Customers_ID, First_Name, Surname, Contact_Number, Address, Email)
VALUES (emp101,'Jeff','Davis','0877277521','10 Main Road','jand@isat.com'),
(emp102,'Kevin','Mark','0837377522','18 Water Road','km@isat.com'),
(emp103,'Jeff','Davis','0877277521','21 Circle lane','aa@isat.com'),
(emp104,'Jeff','Davis','0877277521','1 Sea Road','aryer@isat.com'),
(emp105,'Jeff','Davis','0877277521','12 Main Road','xosam@isat.com');

CREATE TABLE Donator (
  Donator_ID NUMBER PRIMARY KEY,
  First_Name VARCHAR2(50) NOT NULL,
  Surname VARCHAR2(50) NOT NULL,
  Contact_Number VARCHAR2(20),
  Email VARCHAR2(100) UNIQUE
);

INSERT INTO Donator (Donator_ID, First_Name, Surname, Contact_Number, Email)
VALUES (20111,'Jeff','Waston','0827277521','jwaston@ymail.com'),
(20112,'Stephen','Jones','0837377522','joness@ymail.com'),
(20113,'James','Joe','0877277521','jj@isat.com'),
(20114,'Kelly','Ross','0877277521','kross@gsat.com'),
(20115,'Abrham','Clark','0877277521','aclark@ymail.com');

CREATE TABLE Donation (
  Donation_ID NUMBER PRIMARY KEY,
  Donator_ID NUMBER,
  Donation VARCHAR2(50) NOT NULL,
  Price VARCHAR2(20),
  Donation_Date DATE,
  CONSTRAINT fk_donator_id FOREIGN KEY (Donator_ID) REFERENCES Donators(Donator_ID)
);

INSERT INTO Donation (Donation_ID, Donator_ID, Donation, Price, Donation_Date)
VALUES (7111,'20111','KIC Frigde ','R599','1 May 2024'),
(7112,'20112','Samsung 42inch LCD','R1299','3 May 2024'),
(7113,'20113','Sharp Microwave','R1599','3 May 2024'),
(7114,'20114','6 Seat Dinning room table','R799','5 May 2024'),
(7115,'20115','lazyboy sofa','R1199','7 May 2024');

CREATE TABLE Delivery (
  Delivery_ID NUMBER PRIMARY KEY,
  Delivery_Notes VARCHAR2(50) NOT NULL,
  Dispatch_Date DATE,
  Delivery_Date DATE
);

INSERT INTO Delivery (Delivery_ID, Delivery_Notes, Dispatch_Date, Delivery_Date)
VALUES (7111,'20111','KIC Frigde ','R599','1 May 2024'),
(7112,'20112','Samsung 42inch LCD','R1299','3 May 2024'),
(7113,'20113','Sharp Microwave','R1599','3 May 2024'),
(7114,'20114','6 Seat Dinning room table','R799','5 May 2024'),
(7115,'20115','lazyboy sofa','R1199','7 May 2024');

CREATE TABLE Returns (
  Returns_ID NUMBER PRIMARY KEY,
  Returns_Date Date,
  Reason VARCHAR2(50) NOT NULL,
  Customers_ID Number
  CONSTRAINT fk_customers_id FOREIGN KEY (Customers_ID) REFERENCES Customers(Customers_ID)
);

INSERT INTO Returns (Returns_ID, Returns_Date, Reason, Customers_ID)
VALUES (ret001,'25 May 2024','KIC Customer not happy ','11011','1 May 2024'),
(ret002,'25 May 2024','Product broken ','11013','3 May 2024');








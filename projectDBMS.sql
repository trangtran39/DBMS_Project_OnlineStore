-- to drop those tables that have been created earlier
DROP TABLE Customers CASCADE;
DROP TABLE Orders;
DROP TABLE Items;
DROP TABLE Suppliers CASCADE;
DROP TABLE Places;
DROP TABLE Has;
DROP TABLE Supplied;
DROP TABLE Shipped;

-- Create Tables
CREATE TABLE Customers (
     id int NOT NULL,
     name varchar(20),
     phone varchar(16),
     email varchar(30),
     addr varchar(30),
     primary key (id)
   );

   CREATE TABLE Orders(
     Order_numb int NOT NULL,
     Order_date varchar(20),
     Tracking varchar(20),
     amount DECIMAL(6,2) check (amount > 0.0 and amount < 3000),
     paymentType VARCHAR(30) check (paymentType = 'Credit Card' or paymentType = 'PayPal'),
     transaction VARCHAR(20),
     PRIMARY KEY (Order_numb)
   );

   CREATE TABLE Items(
     id int NOT NULL,
     Cost DECIMAL(6,2),
     Name VARCHAR(100),
     Discount Decimal(4,2),
     Description varchar(200),
     price DECIMAL(6,2),
     PRIMARY KEY(id),
     Check(price > cost + price * discount)
   );

   CREATE TABLE Suppliers(
     ID INT NOT NULL,
     Name VARCHAR(20),
     Addr VARCHAR(20),
     phone VARCHAR(20),
     PRIMARY KEY(ID)
   );

   CREATE TABLE Places(
     Cus_ID INT references Customers(id) on update cascade,
     Order_numb INT PRIMARY KEY
   );

   CREATE TABLE Has(
     Order_numb int,
     item_ID int,
     Quantity int check(quantity > 0),
     PRIMARY KEY (Order_numb, item_ID)
   );

   CREATE TABLE Supplied(
     item_ID int PRIMARY KEY,
     Supplier_ID int references Suppliers(ID) on delete set null
   );

   CREATE TABLE Shipped(
     Order_numb int PRIMARY KEY,
     Supplier_ID int,
     Foreign Key (supplier_ID) references Suppliers(ID) on delete set null
   );


INSERT INTO Customers VALUES (1234, 'Sally', '870-891-9381', 'sally1@gmail.com', 'Jonesboro');
INSERT INTO Customers VALUES (2893, 'John', '609-287-1822', 'johnsonbaby@gmail.com', 'Memphis');
INSERT INTO Customers VALUES (8912, 'Linda', '831-849-2874', 'linda1932@gmail.com', 'Egg Harbor Township');
INSERT INTO Customers VALUES (7719, 'Billy', '762-991-4211', 'billy@gmail.com', 'Philadelphia');
INSERT INTO Customers VALUES (3081, 'James', '212-772-2144', 'james12@gmail.com', 'Austin');

INSERT INTO Orders VALUES (123000, '2017-09-01', '1ZE42F480209223788', 30, 'Credit Card', '5527351');
INSERT INTO Orders VALUES (489200, '2017-02-11', '1ZE43H382309223801', 40, 'Credit Card', '6087312');
INSERT INTO Orders VALUES (431030, '2017-05-30', '1ZE42F481435497788', 25, 'PayPal', '5126435');
INSERT INTO Orders VALUES (129473, '2018-12-12', '1ZE42F097712438726', 100, 'PayPal', '2308549');

INSERT INTO Items VALUES (9888, 10, 'Big Girls Ribbed Sweater Dress', 0, 'cute and casual stylish sweater dress', 25);
INSERT INTO Items VALUES (1992, 12, 'Crochet-Trim Bell-Sleeve Dress', 0.10, 'Pretty crochet lace trim', 30);
INSERT INTO Items VALUES (4801, 40, 'Women''s Saltwater Duck Booties', 0, 'Let this waterproof style take you where others
  can''t go', 100);
INSERT INTO Items VALUES (2848, 10, 'Around-Town Flip-Top Mittens', 0, 'A buttoned flip-top lends around-town versatility', 40);
INSERT INTO Items VALUES (3892, 100, 'BL770 Blender & Food Processor', 0.15, 'From mixing dough to making single-serve smoothies', 240);
INSERT INTO Items VALUES (1277, 20, '3-Qt. Soup Pot with Lid', 0, 'A classic look with contemporary performance', 40);
INSERT INTO Items VALUES (8921, 20, 'Tanjun Casual Sneakers from Finish Line', 0.10, 'Modern and comfortable', 45);
INSERT INTO Items VALUES (8943, 35, 'Free Run 2018 Running Sneakers', 0.10, 'Features an upgraded sole design for a natural feel', 70);

INSERT INTO Suppliers VALUES (890, 'Ninja', 'Los Angeles', '981-378-2861');
INSERT INTO Suppliers VALUES (134, 'Under Armour', 'Pittsburgh', '217-972-9910');
INSERT INTO Suppliers VALUES (367, 'Belgique', 'Bishop', '743-219-8475');
INSERT INTO Suppliers VALUES (772, 'Nike', 'Campbell', '972-843-2854');
INSERT INTO Suppliers VALUES (471, 'HM', 'Brea', '874-987-8124');
INSERT INTO Suppliers VALUES (032, 'BestBuy', 'Little Rock', '609-432-4371');

INSERT INTO Places VALUES (2893, 489200);
INSERT INTO Places VALUES (3081, 129473);
INSERT INTO Places VALUES (8912, 431030);
INSERT INTO Places VALUES (2893, 123000);

INSERT INTO Has VALUES (489200, 2848, 1);
INSERT INTO Has VALUES (129473, 4801, 1);
INSERT INTO Has VALUES (431030, 9888, 1);
INSERT INTO Has VALUES (123000, 1992, 1);

INSERT INTO Supplied VALUES (8921, 772);
INSERT INTO Supplied VALUES (8943, 772);
INSERT INTO Supplied VALUES (9888, 890);
INSERT INTO Supplied VALUES (1992, 134);
INSERT INTO Supplied VALUES (4801, 367);
INSERT INTO Supplied VALUES (2848, 134);
INSERT INTO Supplied VALUES (3892, 471);
INSERT INTO Supplied VALUES (1277, 032);

INSERT INTO Shipped VALUES (123000, 134);
INSERT INTO Shipped VALUES (489200, 772);
INSERT INTO Shipped VALUES (431030, 890);
INSERT INTO Shipped VALUES (129473, 367);

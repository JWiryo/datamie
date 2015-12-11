INSERT INTO Users (Username, Password, Full_Name, Email, Gender, Age, Contact_No, Nationality, Is_Admin) VALUES
('kat123','password123','Katherine Fennedy','katherine@gmail.com','F',21,'81818181','American', FALSE),
('wiryo1995','jamesgiggs','James Denny Wiryo','james@gmail.com','F',20,'88888888','African', FALSE),
('luccan','password123','Luccan Ryanata','luccan@gmail.com','M',22,'800080000','Bangladeshi', FALSE),
('ivanho','password123','Ivan Ho Sung Zhi','ivam@gmail.com','M',21,'81238123','Russian', FALSE),
('janicetyp','password123','Janice Tan Yen Ping','janice@gmail.com','F',16,'81010810','French', FALSE),
('test','test','Tester','tester@gmail.com','M',99,'00000000','African', TRUE);

INSERT INTO Products (Product_ID, Product_Name, Stock_Qty, Price, Date_Added) VALUES
(1,'Indomie Goreng',1,1.25,'2015-10-28 00:00:00'),
(2,'Indomie Bakso',5,1.30,'2015-10-23 00:00:00'),
(3,'Indomie Soto',3,1.30,'2015-10-23 00:00:00'),
(4,'Indomie Ayam',20,1.30,'2015-10-23 00:00:00'),
(5,'Indomie Curry',10,1.30,'2015-10-23 00:00:00'),
(6,'Indomie Cheese',6,1.50,'2015-10-23 00:00:00'),
(7,'Indomie Rendang',5,1.30,'2015-10-23 00:00:00'),
(8,'Indomie Fish',17,1.40,'2015-10-23 00:00:00'),
(9,'Indomie Mala',9,1.40,'2015-10-23 00:00:00'),
(10,'Indomie Prata1',1.00,35,'2015-10-23 00:00:00'),
(11,'Indomie Prata2',5,1.10,'2015-10-23 00:00:00'),
(12,'Indomie Prata3',55,1.20,'2015-10-23 00:00:00');

INSERT INTO Orders (Order_ID, Username,Order_Date) VALUES
(1,'wiryo1995','2015-10-28 00:00:00'),
(2,'wiryo1995','2015-10-29 00:00:00'),
(3,'wiryo1995','2015-10-30 00:00:00'),
(4,'wiryo1995','2015-10-31 00:00:00'),
(5,'wiryo1995','2015-11-01 00:00:00'),
(6,'ivanho','2015-11-02 00:00:00'),
(7,'ivanho','2015-11-03 00:00:00'),
(8,'janicetyp','2015-11-04 00:00:00'),
(9,'janicetyp','2015-11-05 00:00:00'),
(10,'luccan','2015-11-06 00:00:00');

INSERT INTO Order_Items (Order_ID, Product_ID, Quantity) VALUES
(1,1,50), (1,5,10),
(2,1,50), (2,4,10),
(3,1,50), (3,3,10),
(4,1,50), (4,8,10),
(5,1,50), (5,2,10), (5,3,10), (5,4,10), (5,5,10), (5,6,10), (5,7,10), (5,8,10), (5,9,10), (5,10,10),
(6,1,8), (6,6,3),
(7,6,3),
(8,10,500), (8,1,500),
(9,2,5),
(10,2,1);

INSERT INTO Ratings (Rating_ID, Product_ID, Username, Score, Date_Added, Description) VALUES
(1,1,'kat123',10,'2015-10-28 00:00:00','Deliciousss'),
(2,1,'wiryo1995',10,'2015-10-28 00:00:00','AWWYISSS'),
(3,1,'ivanho',1,'2015-10-28 00:00:00','This is garbage'),
(4,1,'janicetyp',4,'2015-10-28 00:00:00','ok la'),
(5,1,'kat123',10,'2015-10-28 00:00:00','THIS IS DELICIOUS'),
(6,1,'wiryo1995',3,'2015-10-28 00:00:00','Actually now i got fed up with it'),
(7,2,'kat123',10,'2015-10-28 00:00:00','Deliciousss'),
(8,2,'wiryo1995',10,'2015-10-28 00:00:00','AWWYISSS'),
(9,2,'ivanho',1,'2015-10-28 00:00:00','This is garbage'),
(10,2,'janicetyp',4,'2015-10-28 00:00:00','ok la'),
(11,2,'kat123',10,'2015-10-28 00:00:00','THIS IS DELICIOUS'),
(12,2,'wiryo1995',3,'2015-10-28 00:00:00','Actually now i got fed up with it');

INSERT INTO Helpfulness (Rating_ID, Username, Score) VALUES
(1,'wiryo1995',5),
(2,'kat123',5),
(1,'luccan',0),
(2,'luccan',5),
(3,'luccan',4),
(1,'ivanho',0),
(1,'janicetyp',1),
(5,'luccan',5),
(6,'luccan',4),
(5,'ivanho',5),
(5,'wiryo1995',5),

(7,'wiryo1995',4),
(9,'wiryo1995',3),
(12,'kat123',3),
(10,'luccan',2),
(11,'luccan',2),
(12,'luccan',2);

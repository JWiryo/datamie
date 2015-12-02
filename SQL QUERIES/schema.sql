DROP TABLE Helpfulness;
DROP TABLE Ratings;
DROP TABLE Order_Items;
DROP TABLE Orders;
DROP TABLE Products;
DROP TABLE Users;
DROP TABLE Brand;

CREATE TABLE Users(
	Username VARCHAR(255) NOT NULL,
	Password VARCHAR(255) NOT NULL,
	Full_Name VARCHAR(255),
	Email VARCHAR(255) NOT NULL CHECK (Email like '%@%.%'),
	Gender VARCHAR(1) CHECK (Gender='F' OR 'M'),
	Age INTEGER,
	Contact_No VARCHAR(255),
    Nationality VARCHAR(255),
    Is_Admin BOOLEAN,
    PRIMARY KEY (Username)
);

delimiter //
CREATE TRIGGER Users_Create_Check
BEFORE INSERT ON Users FOR EACH ROW BEGIN
	IF not (NEW.Gender='F' OR NEW.Gender='M') then
		SIGNAL SQLSTATE '10001' SET MESSAGE_TEXT = 'Check Constraint on Gender Failed';
    END IF;
    IF NEW.Email not like '%@%.%' then
		SIGNAL SQLSTATE '10001' SET MESSAGE_TEXT = 'Check Constraint on Email Failed';
    END IF;
END;//

CREATE TRIGGER Users_Update_Check
BEFORE UPDATE ON Users FOR EACH ROW BEGIN
	IF not (NEW.Gender='F' OR NEW.Gender='M') then
		SIGNAL SQLSTATE '10001' SET MESSAGE_TEXT = 'Check Constraint on Gender Failed';
    END IF;
    IF NEW.Email not like '%@%.%' then
		SIGNAL SQLSTATE '10001' SET MESSAGE_TEXT = 'Check Constraint on Email Failed';
    END IF;
END;//
delimiter ;

CREATE TABLE Products(
	Product_ID BIGINT NOT NULL AUTO_INCREMENT,
	Product_Name VARCHAR(255) NOT NULL,
    Stock_Qty INTEGER NOT NULL DEFAULT 0,
    Date_Added DATETIME NOT NULL,
    Last_Updated DATETIME CHECK (Last_Updated > Date_Added),
    PRIMARY KEY (Product_ID)
);

delimiter //
CREATE TRIGGER Products_Create_Check
BEFORE INSERT ON Products FOR EACH ROW BEGIN
	IF not (NEW.Last_Updated > NEW.Date_Added) then
		SIGNAL SQLSTATE '10001' SET MESSAGE_TEXT = 'Check Constraint on Last_Updated / Date_Added Failed';
    END IF;
END;//

CREATE TRIGGER Products_Update_Check
BEFORE UPDATE ON Products FOR EACH ROW BEGIN
	IF not (NEW.Last_Updated > NEW.Date_Added) then
		SIGNAL SQLSTATE '10001' SET MESSAGE_TEXT = 'Check Constraint on Last_Updated / Date_Added Failed';
    END IF;
END;//
delimiter ;

CREATE TABLE Orders(
	Order_ID BIGINT NOT NULL AUTO_INCREMENT,
    Username VARCHAR(255) NOT NULL,
	Order_Date DATETIME NOT NULL,
    Order_Status VARCHAR(255) CHECK (Order_Status='Pending' OR 'Submitted' OR 'Confirmed'),
    PRIMARY KEY (Order_ID),
    FOREIGN KEY (Username) REFERENCES Users(Username)
);

delimiter //
CREATE TRIGGER Orders_Create_Check
BEFORE INSERT ON Orders FOR EACH ROW BEGIN
	IF not (NEW.Order_Status='Pending' OR NEW.Order_Status='Submitted' OR NEW.Order_Status='Confirmed') then
		SIGNAL SQLSTATE '10001' SET MESSAGE_TEXT = 'Check Constraint on Order_Status Failed';
    END IF;
END;//

CREATE TRIGGER Orders_Update_Check
BEFORE INSERT ON Orders FOR EACH ROW BEGIN
	IF not (NEW.Order_Status='Pending' OR NEW.Order_Status='Submitted' OR NEW.Order_Status='Confirmed') then
		SIGNAL SQLSTATE '10001' SET MESSAGE_TEXT = 'Check Constraint on Order_Status Failed';
    END IF;
END;//
delimiter ;

-- Relationship
CREATE TABLE Order_Items(
	Order_ID BIGINT NOT NULL,
	Product_ID BIGINT NOT NULL,
    Quantity INTEGER NOT NULL DEFAULT 1,
    PRIMARY KEY (Order_ID, Product_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

CREATE TABLE Ratings(
	Rating_ID BIGINT NOT NULL AUTO_INCREMENT,
    Product_ID BIGINT NOT NULL,
    Username VARCHAR(255) NOT NULL,
    Score INTEGER NOT NULL CHECK (Score>=0 AND Score<=10),
    Date_Added DATETIME NOT NULL,
    Last_Updated DATETIME CHECK (Last_Updated > Date_Added),
    Description VARCHAR(1000),
    PRIMARY KEY (Rating_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),
    FOREIGN KEY (Username) REFERENCES Users(Username)
);

delimiter //
CREATE TRIGGER Ratings_Create_Check
BEFORE INSERT ON Ratings FOR EACH ROW BEGIN
	IF not (NEW.Score>=0 AND NEW.Score<=10) then
		SIGNAL SQLSTATE '10001' SET MESSAGE_TEXT = 'Check Constraint on Score Failed';
    END IF;
	IF not (NEW.Last_Updated > NEW.Date_Added) then
		SIGNAL SQLSTATE '10001' SET MESSAGE_TEXT = 'Check Constraint on Last_Updated / Date_Added Failed';
    END IF;
END;//

CREATE TRIGGER Ratings_Update_Check
BEFORE UPDATE ON Ratings FOR EACH ROW BEGIN
	IF not (NEW.Score>=0 AND NEW.Score<=10) then
		SIGNAL SQLSTATE '10001' SET MESSAGE_TEXT = 'Check Constraint on Score Failed';
    END IF;
	IF not (NEW.Last_Updated > NEW.Date_Added) then
		SIGNAL SQLSTATE '10001' SET MESSAGE_TEXT = 'Check Constraint on Last_Updated / Date_Added Failed';
    END IF;
END;//
delimiter ;

CREATE TABLE Helpfulness(
	Rating_ID BIGINT NOT NULL,
    Username VARCHAR(255) NOT NULL,
    Score INTEGER NOT NULL CHECK (Score=0 OR 1 OR 2 OR 3 OR 4 OR 5),
    PRIMARY KEY (Rating_ID, Username),
    FOREIGN KEY (Rating_ID) REFERENCES Ratings(Rating_ID),
    FOREIGN KEY (Username) REFERENCES Users(Username)
);

delimiter //
CREATE TRIGGER Helpfulness_Create_Check
BEFORE INSERT ON Helpfulness FOR EACH ROW BEGIN
	IF not (NEW.Score>=0 AND NEW.Score<=5) then
		SIGNAL SQLSTATE '10001' SET MESSAGE_TEXT = 'Check Constraint on Score Failed';
    END IF;
END;//

CREATE TRIGGER Helpfulness_Update_Check
BEFORE UPDATE ON Helpfulness FOR EACH ROW BEGIN
	IF not (NEW.Score>=0 AND NEW.Score<=5) then
		SIGNAL SQLSTATE '10001' SET MESSAGE_TEXT = 'Check Constraint on Score Failed';
    END IF;
END;//
delimiter ;

CREATE TABLE Brand(
	Brand_Name VARCHAR(255),
    Brand_Code VARCHAR(8)
);
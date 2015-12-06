DROP TABLE Helpfulness;
DROP TABLE Ratings;
DROP TABLE Order_Items;
DROP TABLE Orders;
DROP TABLE Products;
DROP TABLE Users;
DROP TABLE Brand;

DROP TABLE book;
DROP TABLE copy;
DROP TABLE loan;
DROP TABLE student;

SELECT * FROM Ratings;
SELECT * FROM Helpfulness;
SELECT * FROM Order_Items;
SELECT * FROM Ratings;

-- Query for most popular products in terms of quantities sold in a particular month
SELECT * FROM ( SELECT Product_ID, SUM(Quantity) AS amt_sold FROM Order_Items
				WHERE Order_Id IN (SELECT Order_Id FROM Orders 
									WHERE Order_Date >= DATE_FORMAT(sysdate(), '%Y-%m-01'))
				GROUP BY Product_ID) A 
inner join Products B
on A.Product_ID = B.Product_ID
Order By A.amt_sold DESC
LIMIT 3;

-- For a given product, a user could ask for the top 3  most useful feedback.
-- Sorted based on average usefulness score
SELECT * FROM (SELECT Rating_ID, AVG(score) FROM Helpfulness
				GROUP BY Rating_ID
				Order By AVG(score) DESC) A
inner join Ratings B
on A.Rating_ID = B.Rating_ID
WHERE B.Product_ID = 2
LIMIT 3;

-- Book recommendation in decreasing sales
SELECT Product_ID, sum(Quantity) FROM Order_Items
WHERE Order_ID IN (SELECT DISTINCT Order_ID FROM Order_Items
					WHERE Product_ID IN (SELECT Product_ID FROM Order_Items
										WHERE Order_ID=6)
					AND Order_ID != 6) 
AND Product_ID NOT IN (SELECT Product_ID from Order_Items
						WHERE Order_ID=6)
GROUP BY Product_ID;

-- CREATE TRIGGER Helpful_Check
-- BEFORE INSERT ON Helpfulness FOR EACH ROW
-- BEGIN
-- 	DECLARE msg VARCHAR(255);
--     IF EXISTS (SELECT * FROM Ratings WHERE Ratings.Username = new.Username AND Rat

-- CREATE TRIGGER Helpful_Check
-- BEFORE INSERT ON Helpfulness FOR EACH ROW
-- BEGIN
-- 	DECLARE msg VARCHAR(255);
--     IF EXISTS (SELECT * FROM Ratings WHERE Ratings.Username = new.Username AND Ratings.Rating_ID = new.Rating_ID) THEN

SELECT * FROM Helpfulness;
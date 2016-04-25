-- 181	Employees Earning More Than Their Managers
-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers. 
-- For the above table, Joe is the only employee who earns more than his manager.

SELECT employee.Name
FROM Employee employee
JOIN Employee manager ON employee.ManagerId = manager.Id
WHERE employee.Salary > manager.Salary

SELECT employee.Name
FROM Employee AS employee, Employee AS manager
WHERE (employee.ManagerID = manager.Id) AND (employee.Salary > manager.Salary)

-- 182	Duplicate Emails
-- Write a SQL query to find all duplicate emails in a table named Person.
-- For example, your query should return the following for the above table:
SELECT Email
FROM Person
GROUP BY Email
HAVING count(*) > 1

-- 175	Combine Two Tables (Left Join)
-- Write a SQL query for a report that provides the following information for each person in the Person table, 
-- regardless if there is an address for each of those people: ****** If a person without an address, we also show him/her out

SELECT FirstName, LastName, City, State
FROM Person p LEFT JOIN Address a ON p.PersonId = a.PersonId

-- 183	Customers Who Never Order
-- Suppose that a website contains two tables, the Customers table and the Orders table.
-- Write a SQL query to find all customers who never order anything.

SELECT c2.Name AS Customers
FROM Customers c2
WHERE c2.Id NOT IN (
    SELECT c1.Id
    FROM Customers c1 JOIN Orders on c1.Id = Orders.CustomerId)

SELECT c2.Name AS Customers
FROM Customers c2
WHERE c2.Id NOT IN (SELECT c1.Id FROM Customers c1, Orders WHERE c1.Id = Orders.CustomerId)

SELECT c1.Name
FROM Customers c1 LEFT JOIN Orders ON c1.Id = Orders.CustomerId
WHERE Orders.Id IS NULL

-- 197.	Rising Temperature
-- Given a Weather table, write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.

SELECT w2.Id
FROM Weather w1
JOIN Weather w2 ON TO_DAYS(w2.Date) = TO_DAYS(w1.Date) + 1
WHERE w1.Temperature < w2.Temperature

SELECT w2.Id
FROM Weather w1
JOIN Weather w2 ON TO_DAYS(w1.Date) < TO_DAYS(w2.Date)
WHERE (TO_DAYS(w2.Date) - TO_DAYS(w1.Date) = 1) AND (w1.Temperature < w2.Temperature)

SELECT w2.Id
FROM Weather w1 JOIN Weather w2 ON (datediff(w2.Date, w1.Date) = 1 AND w2.Temperature > w1.Temperature)

-- 176	Second Highest Salary
-- For example, given the above Employee table, 
-- the second highest salary is 200. If there is no second highest salary, then the query should return null.

-- 92.94%
SELECT max(e2.Salary)
FROM Employee e2
WHERE e2.Salary < (SELECT max(e1.Salary) FROM Employee e1) 

-- 196. Delete Duplicate Emails
-- Write a SQL query to delete all duplicate email entries in a table named Person, 
-- keeping only unique emails based on its smallest Id.

DELETE p2
FROM Person p1 JOIN Person p2 ON (p1.Email = p2.Email AND p1.Id < p2.Id) 

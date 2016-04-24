-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers. 
-- For the above table, Joe is the only employee who earns more than his manager.

SELECT employee.Name
FROM Employee employee
JOIN Employee manager ON employee.ManagerId = manager.Id
WHERE employee.Salary > manager.Salary

-- 180. Consecutive Numbers
-- Write a SQL query to find all numbers that appear at least three times consecutively.

SELECT DISTINCT l1.Num
FROM Logs l1 JOIN Logs l2 ON l2.Id - l1.Id = 1
JOIN Logs l3 ON l3.Id - l2.Id = 1
WHERE l1.Num = l2.Num AND l2.Num = l3.Num

Select DISTINCT l1.Num from Logs l1, Logs l2, Logs l3 
where l1.Id=l2.Id-1 and l2.Id=l3.Id-1 
and l1.Num=l2.Num and l2.Num=l3.Num

-- 178. Rank Scores
-- Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. 
-- Note that after a tie, the next ranking number should be the next consecutive integer value. 
-- In other words, there should be no "holes" between ranks.
SELECT s1.Score, (SELECT count(DISTINCT s2.Score) FROM Scores s2 WHERE s2.Score >= s1.Score) as Rank
FROM Scores s1
ORDER BY s1.Score DESC

-- 184. Department Highest Salary ****
-- The Employee table holds all employees. 
-- Every employee has an Id, a salary, and there is also a column for the department Id.
SELECT d.Name AS Department, e.Name AS Employee, maxSalary.maxing AS Salary
FROM
(SELECT DepartmentId, max(Salary) AS maxing FROM Employee GROUP BY DepartmentId) AS maxSalary
JOIN Department d ON d.Id = maxSalary.DepartmentId
JOIN Employee e ON (e.DepartmentId = d.Id AND e.Salary = maxSalary.maxing)

-- 177. Nth Highest Salary
-- Write a SQL query to get the nth highest salary from the Employee table.

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
SET M=N-1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT M, 1
  );
END


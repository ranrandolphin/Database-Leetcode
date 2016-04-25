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

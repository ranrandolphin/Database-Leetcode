-- Department Top Three Salaries

SELECT d.Name Department, e2.Name Employee, e2.Salary
FROM Employee e2
JOIN Department d ON d.Id = e2.DepartmentId
WHERE (SELECT count(distinct(e1.Salary)) FROM Employee e1
        WHERE e2.DepartmentId = e1.DepartmentId
        AND e2.Salary <= e1.Salary) <= 3
order by d.Name, e2.Salary DESC

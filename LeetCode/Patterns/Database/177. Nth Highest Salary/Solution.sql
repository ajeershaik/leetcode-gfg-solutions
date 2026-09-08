CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      
        select salary as NthSalary
        from(
            select distinct salary,dense_rank() over(order by salary desc) as rn from Employee
        )as t where rn = N
    );
END
/*Problem:

Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Id is the primary key column for this table.
For example, after running your query, the above Person table should have the following rows:

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Note:

Your output is the whole Person table after executing your sql. Use delete statement.

Solution1: Sub query find larger Id to delete:*/

delete from Person where Id in (
select Id from (
    select p1.Id as Id
    from Person p1, Person p2
    where p1.email = p2.email
    and p1.Id > p2.Id) as p
)

Solution2 (faster): Using Min and grou by to find the min duplicate email id. delete not in

delete from Person where Id not in (
    select Id from 
    (select MIN(Id) as Id from Person group by Email) as p
)

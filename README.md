# DnA Project Phase 4
## Group 19 
<pre>     Ishan Kavathekar    Faizal Karim     Kunal Bhosikar 
        2022121003        2022121004        2022121005
</pre>

## Comands:
1. Fetch the owner details:<br>
This query returns all the information that is stored for every owner of the restaurant.<br>
The query used is:<br>
```sql
SELECT *
FROM OWNER;
```

2. Display menu:<br>
This command returns all the food items that are on the menu with the corresponding price and cuisine.<br>
The query used is:<br>
```sql
SELECT *
FROM FOOD;
```
3. Bills having cost more than certain amount:<br>
This command returns the information of bills having cost more than the specified cost by the user.
```sql
SELECT * 
FROM bill 
WHERE cost > {amount};
```

4. Maximum salary of a manager:<br>
This command returns the maximum salary of all the managers in the restaurants.<br>
The query used is:<br>
```sql
SELECT m.first_name, s.total_salary 
FROM pays_salary_manager p, manager m, salary s
WHERE p.salary_id=s.id AND p.manager_id=m.employee_id 
ORDER BY s.total_salary DESC 
LIMIT 0,1;
```

5. Average food price grouped by cuisine:<br>
This command returns the average food price corresponding to each of the cuisine so that the restaurant can approximate it's revenue.<br>
The query used is:<br>
```sql
SELECT avg(price), cuisine 
FROM food 
GROUP BY cuisine;
```

6. Order with the nth largest amount:<br>
This command returns the order details of the nth largest amount. Here the user can input the desired value of n.<br>
The query used is:<br>
```sql
SELECT * 
FROM order_
ORDER BY amount DESC 
LIMIT {n-1},1;
```

7. Manager who manages atleast two employees:<br>
This command returns the details of all the managers who manage atleast 2 waiters. This is helpful of load balancing.<br>
The query used is:<br>
```sql
SELECT m.Employee_id, m.first_name, m.last_name 
FROM manager m, waiter w 
WHERE m.employee_id=w.manager_id 
GROUP BY manager_id 
HAVING count(w.waiter_id > 2);
```

8. Retrieve names of food consisting of a given keyword:<br>
Given an input of a particular keyword, this command returns all the food items having that keyword in it's name<br>
The query used is:<br>
```sql
SELECT * 
FROM food 
WHERE food_name LIKE "%{keyword}%";
```

9. Add new chef:<br>
This command is used to add a new chef to the database.<br>
This is an update query<br>
The query used is:<br>
```sql
INSERT INTO chef (c_id, m_id, f_name, l_name, hc_id)
VALUES ("cust_id", "manager_id", "first_name", "last_name", "hc_id");
```

10. Remove customer:<br>
This command deletes a particular customer after they have been serviced and paid the bill. The user can use the customer ID to do so.<br>
This is an update query<br>
The query used is:<br>
```sql
DELETE FROM customer 
WHERE customer_id = {c_id};
```

11. Update the price of a food item:<br>
This command is used to update the value of a particular food item. The user can input the food name for which they want to update the price.<br>
This is an update query<br>
The query used is:<br>
```sql
UPDATE food 
SET price = {food_price} 
WHERE food_name = {food_name};
```
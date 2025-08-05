self join examples
===================================
| Join Type       | Description                                            |
| --------------- | ------------------------------------------------------ |
| INNER JOIN      | Returns matching rows from both tables                 |
| LEFT JOIN       | Returns all rows from the left table, matched or not  matching from right |
| RIGHT JOIN      | Returns all rows from the right table, matched or not, matching from left |
| FULL OUTER JOIN | Returns all rows when there is a match in either table |
| SELF JOIN       | Joins a table with itself                              |
| CROSS JOIN      | Cartesian product (all combinations)                   |



Write a query to find all record_dates with higher temperatures compared to its previous record_dates (yesterday)

For date interval you can use (Date - Interval 1 day)

Weather table:



id     record_date     temperature

1      20-dec-2024      20°C  

2      21-dec-2024      25°C 

3      22-dec-2024      15°C  

4      23-dec-2024      18°C


SELECT w1.record_date
FROM Weather w1
JOIN Weather w2 
  ON w1.record_date = w2.record_date + INTERVAL '1 day'
WHERE w1.temperature > w2.temperature;


Weather.joins("JOIN weathers w2 ON weathers.record_date = w2.record_date + INTERVAL '1 day'")
       .where("weathers.temperature > w2.temperature")
       .select(:record_date)



user table 
| id | name    | managerid |
| -- | ------- | ----------- |
| 1  | Alice   | NULL        |
| 2  | Bob     | 1           |
| 3  | Charlie | 1           |
| 4  | David   | 2           |

find each user manager 

select u.name as name, u1.name as manager_name from users u left join users u1 on u1.manger_id = u.id   
employees
=====================================================
| emp\_id | name  | dept\_id |
| ------- | ----- | -------- |
| 1       | John  | 10       |
| 2       | Sarah | 20       |
| 3       | Mike  | 30       |
| 4       | Emma  | NULL     |

departments
| dept\_id | dept\_name |
| -------- | ---------- |
| 10       | HR         |
| 20       | IT         |
| 30       | Finance    |
| 40       | Marketing  |

Question: Fetch all employees and their department names.

select emp.name dep.dep_name from employees emp INNER JOIN departments dep on emp.dept_id = dep.dept_id



================================================
Question: Fetch all employees and their department names, even if the department is missing.

select emp.name, dept.dep_name from employees left join departments dep ON emp.dept_id = dept.dept_id

===============================================================
Question: Fetch all departments and their employees, even if no employee is assigned.

select emp.name dept.dep_name from employees right join departments ON emp.dept_id = dept.dept_id

==================================================================
Question: List all employees and departments, even if there’s no match.

SELECT e.name, d.dept_name
FROM employees e
FULL OUTER JOIN departments d ON e.dept_id = d.dept_id;


===========================================

Question: Show employees and their department.

==============================

Perfect! Here are **interview-ready answers** to the questions I shared, plus extra clarification to help you answer confidently.

---

# ✅ SQL Joins Interview Questions with Answers

---

### 1. **What’s the difference between INNER JOIN and LEFT JOIN?**

👉 **Answer:**

* **INNER JOIN** returns only the rows where there is a match in both tables.
* **LEFT JOIN** returns all rows from the **left table**, and matches from the right table. If no match exists, `NULL` is returned for the right table columns.

**Example:**

```sql
-- INNER JOIN: Only matched records
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id;

-- LEFT JOIN: All employees, NULL if no department
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;
```

---

### 2. **What happens if you use INNER JOIN but there’s no match?**

👉 **Answer:**

* If there is no match in the joined tables, the row will **not be included in the result**.
* The result set will simply skip unmatched records.

---

### 3. **When would you use FULL OUTER JOIN in a real project?**

👉 **Answer:**

* Use **FULL OUTER JOIN** when you need **all records** from both tables, whether they have a match or not.
* Common in **data reconciliation**, **reporting**, and **finding differences between datasets**.

**Example:**

* Listing all products and their suppliers, even if some products don’t have suppliers and some suppliers don’t have products.

---

### 4. **Explain a scenario where SELF JOIN is required.**

👉 **Answer:**

* **SELF JOIN** is used when you need to compare records within the same table.

**Example:**

* Employee-management relationships where each employee record has a `manager_id` referencing another employee.

```sql
SELECT e1.name AS employee, e2.name AS manager
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.emp_id;
```

---

### 5. **What’s the output of CROSS JOIN and where can it be useful?**

👉 **Answer:**

* **CROSS JOIN** returns the **Cartesian product**: every row from the first table is combined with every row from the second table.
* It’s useful when:

  * You want **all possible combinations** (e.g., price lists, schedules).
  * Example: Combining all colors with all sizes in a product table.

```sql
SELECT e.name, d.dept_name
FROM employees e
CROSS JOIN departments d;
```

---

### 6. **How can you find employees without a department?**

👉 **Answer:**

* Use **LEFT JOIN** and filter `NULL` on the right table’s key.

```sql
SELECT e.name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;
```

✔️ This query returns employees who do not belong to any department.

---

### ⭐ Bonus Quick Summary Table for Reference:

| Join Type       | Includes unmatched rows? | Real-World Use     |
| --------------- | ------------------------ | ------------------ |
| INNER JOIN      | No                       | Exact matches      |
| LEFT JOIN       | Yes (left table only)    | Optional relations |
| RIGHT JOIN      | Yes (right table only)   | Optional relations |
| FULL OUTER JOIN | Yes (both tables)        | Full data view     |
| SELF JOIN       | N/A                      | Hierarchies        |
| CROSS JOIN      | N/A                      | All combinations   |

    ============================================================================
SQL Injection is a critical security vulnerability that allows an attacker to manipulate your SQL queries by injecting malicious input, usually through forms, URLs, or any input field.

User.where("email = '#{params[:email]}' AND password = '#{params[:password]}'").first


params[:email] = "' OR 1=1 --"

SELECT * FROM users WHERE email = '' OR 1=1 --' AND password = '...'
🔴 OR 1=1 is always true
🔴 -- comments out the rest
➡️ Attacker logs in without valid credentials!

======================================================================
Q7: Write a SQL query to find users who placed the most orders.
Answer:

sql
Copy
Edit
SELECT user_id, COUNT(*) AS order_count
FROM orders
GROUP BY user_id
HAVING COUNT(*) = (
  SELECT MAX(order_count)
  FROM (
    SELECT COUNT(*) AS order_count FROM orders GROUP BY user_id
  ) AS sub
);
Q8: Find users who haven't placed any orders.
Answer:

sql
Copy
Edit
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM orders);
🔹 4. AWS / File Uploads

 Find Duplicate Records
  
SELECT email, COUNT(*) 
FROM users 
GROUP BY email 
HAVING COUNT(*) > 1;

Get the second highest salary.

SELECT MAX(salary) AS second_highest
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

. Using DENSE_RANK() (SQL Server, PostgreSQL, Oracle, etc.)
  
SELECT salary
FROM (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employees
) AS ranked
WHERE rnk = 3;

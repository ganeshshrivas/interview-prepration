### ✅ What is Database Normalization?

**Database normalization** is the process of organizing data in a relational database to reduce **data redundancy** and improve **data integrity**.

It involves dividing a database into **smaller, related tables** and defining relationships between them using **foreign keys**.

---

### 🎯 Goals of Normalization:

1. Eliminate redundant data (repetition of data).
2. Ensure data dependencies make sense (store related data in a logical manner).
3. Improve data consistency and integrity.

---

### 🔢 Normal Forms (NF):

There are several **normal forms**, but the most common are:

#### 🔹 1NF – First Normal Form

* Atomic values only (no multiple values in a field)
* Each record is unique

✅ **Example (Unnormalized):**

| StudentID | Name  | Courses       |
| --------- | ----- | ------------- |
| 1         | Alice | Math, Science |
| 2         | Bob   | English       |

❌ Problem: "Courses" contains multiple values.

✅ **1NF (Atomic values):**

| StudentID | Name  | Course  |
| --------- | ----- | ------- |
| 1         | Alice | Math    |
| 1         | Alice | Science |
| 2         | Bob   | English |

---

#### 🔹 2NF – Second Normal Form

* Must be in **1NF**
* No **partial dependencies** (non-key attributes must depend on the **whole** primary key)

✅ **Example (1NF but not 2NF):**

| StudentID | Course  | Instructor |
| --------- | ------- | ---------- |
| 1         | Math    | Mr. A      |
| 1         | Science | Mr. B      |

❌ Problem: Instructor depends only on `Course`, not `StudentID`.

✅ **2NF (Split into 2 tables):**

**Students Table:**

| StudentID | Course  |
| --------- | ------- |
| 1         | Math    |
| 1         | Science |

**Courses Table:**

| Course  | Instructor |
| ------- | ---------- |
| Math    | Mr. A      |
| Science | Mr. B      |

---

#### 🔹 3NF – Third Normal Form

* Must be in **2NF**
* No **transitive dependencies** (non-key attributes must depend only on the key)

✅ **Example (2NF but not 3NF):**

| StudentID | Name  | Department | DeptHead  |
| --------- | ----- | ---------- | --------- |
| 1         | Alice | Science    | Dr. Smith |
| 2         | Bob   | Arts       | Dr. John  |

❌ Problem: `DeptHead` depends on `Department`, not directly on `StudentID`.

✅ **3NF (Split further):**

**Students Table:**

| StudentID | Name  | Department |
| --------- | ----- | ---------- |
| 1         | Alice | Science    |
| 2         | Bob   | Arts       |

**Departments Table:**

| Department | DeptHead  |
| ---------- | --------- |
| Science    | Dr. Smith |
| Arts       | Dr. John  |

---

### ⚖️ Summary Table:

| Normal Form | Rule                                                |
| ----------- | --------------------------------------------------- |
| 1NF         | No repeating groups (atomic columns)                |
| 2NF         | No partial dependency on part of a composite key    |
| 3NF         | No transitive dependency between non-key attributes |

---

### 🧠 Why Normalize?

* Makes data updates more efficient
* Reduces anomalies (insert, update, delete)
* Ensures logical data structure

---

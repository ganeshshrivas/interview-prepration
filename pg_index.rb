
---

## ✅ 1. **B-Tree Index (Default)**

### 📌 Usage:

* Most common type.
* Automatically created for primary keys and unique constraints.

### ✅ Best For:

* Equality comparisons: `=`
* Range queries: `<`, `<=`, `>`, `>=`
* Sorting (`ORDER BY`)

### 💡 Example:

```sql
CREATE INDEX idx_users_email ON users(email);
```

### ⚡ Notes:

* Efficient for almost all simple lookups and range scans.
* Supports multi-column indexes.

---

## ✅ 2. **Hash Index**

### 📌 Usage:

* Specifically optimized for equality comparisons (`=`) only.

### ✅ Best For:

* Very fast lookups when using exact matches.

### 💡 Example:

```sql
CREATE INDEX idx_users_email_hash ON users USING hash (email);
```

### ⚡ Notes:

* Not useful for range queries or ordering.
* Historically less used due to prior PostgreSQL limitations (now improved from version 10+).

---

## ✅ 3. **GIN (Generalized Inverted Index)**

### 📌 Usage:

* Useful for searching within complex data types:

  * `ARRAY` fields
  * `JSONB` fields
  * Full-text search

### ✅ Best For:

* Indexing JSON, arrays, or documents.
* Full-text search (`to_tsvector`).

### 💡 Example:

```sql
CREATE INDEX idx_posts_tags ON posts USING gin (tags);
```

### ⚡ Notes:

* GIN indexes are larger but excellent for multi-value fields.
* Supports full-text search very efficiently.

---

## ✅ 4. **GiST (Generalized Search Tree) Index**

### 📌 Usage:

* Supports many types of complex queries:

  * Geometric data
  * Range types
  * Full-text search (alternative to GIN)

### ✅ Best For:

* Proximity search
* Geospatial queries
* Range overlaps

### 💡 Example:

```sql
CREATE INDEX idx_locations_point ON locations USING gist (coordinates);
```

### ⚡ Notes:

* Flexible, but not as fast as B-Tree or GIN for basic equality.
* Works well with PostGIS (spatial data).

---

## ✅ 5. **BRIN (Block Range Index)**

### 📌 Usage:

* Efficient for very large tables where data is naturally ordered (like time-series).

### ✅ Best For:

* Time-based data
* Log tables
* Append-only tables

### 💡 Example:

```sql
CREATE INDEX idx_logs_created_at ON logs USING brin (created_at);
```

### ⚡ Notes:

* Very small and fast to create.
* Performance improves when table data is physically ordered.

---

## ✅ 6. **SP-GiST (Space-Partitioned GiST)**

### 📌 Usage:

* Supports partitioned data structures (quad trees, k-d trees).

### ✅ Best For:

* Advanced spatial searches.
* Non-balanced trees.

### 💡 Notes:

* Less commonly used unless working with specialized spatial or routing applications.

---

## ✅ 7. **Expression Index**

### 📌 Usage:

* Index based on a computed expression or a function.

### ✅ Best For:

* Filtering on calculated fields.

### 💡 Example:

```sql
CREATE INDEX idx_users_lower_email ON users (LOWER(email));
```

### ⚡ Notes:

* Supports efficient case-insensitive searches.

---

## ✅ 8. **Partial Index**

### 📌 Usage:

* Index only a subset of rows based on a condition.

### ✅ Best For:

* Sparsely populated fields
* Indexes on active records

### 💡 Example:

```sql
CREATE INDEX idx_active_users ON users (email) WHERE active = true;
```

### ⚡ Notes:

* Reduces index size.
* Improves query performance for selective queries.

---

## 🚀 Summary Table

| Index Type     | Best For                   | Key Limitation                  |
| -------------- | -------------------------- | ------------------------------- |
| **B-Tree**     | Equality, Range, Sorting   | Not optimal for multi-value     |
| **Hash**       | Equality                   | No range or sort support        |
| **GIN**        | Arrays, JSONB, Full-Text   | Large size, slower writes       |
| **GiST**       | Spatial, Proximity, Range  | Slower than B-Tree for equality |
| **BRIN**       | Large, ordered datasets    | Less precise, block level only  |
| **SP-GiST**    | Spatial, Routing, Advanced | Very specialized                |
| **Expression** | Computed columns           | Limited to specific expressions |
| **Partial**    | Conditional indexes        | Only optimizes partial queries  |

---


check index in PG
SELECT *
FROM pg_indexes
WHERE tablename = 'users';
or
\d in pg console 

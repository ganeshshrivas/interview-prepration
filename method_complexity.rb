To **check the time and space complexity of methods**, follow a structured approach:

---

## ✅ 1. **Understand What "Complexity" Means**

* **Time complexity** measures **how the execution time grows** with input size.
* **Space complexity** measures **how memory usage grows** with input size.

---

## 🔍 2. **Identify the Input Size**

The complexity depends on the **size of input data** — commonly represented as `n`.

Example:
For a method processing an array:

```ruby
def sum_array(arr)
  sum = 0
  arr.each { |num| sum += num }
  sum
end
```

* Here, `n = arr.length`

---

## 🧠 3. **Analyze the Operations**

### 🚀 Time Complexity

* Count how many times each statement executes **relative to input size**.
* Common complexities:

  * `O(1)` – Constant time
  * `O(n)` – Linear time
  * `O(n²)` – Quadratic (e.g., nested loops)
  * `O(log n)` – Logarithmic (e.g., binary search)
  * `O(n log n)` – Efficient sorting (e.g., merge sort)

#### Example 1:

```ruby
def print_items(arr)
  arr.each { |item| puts item }
end
```

✅ Time complexity: **O(n)**
✅ Space complexity: **O(1)**

---

#### Example 2:

```ruby
def print_pairs(arr)
  arr.each do |i|
    arr.each do |j|
      puts "#{i}, #{j}"
    end
  end
end
```

✅ Time complexity: **O(n²)**
✅ Space complexity: **O(1)**

---

#### Example 3:

```ruby
def binary_search(arr, target)
  left = 0
  right = arr.length - 1
  while left <= right
    mid = (left + right) / 2
    return mid if arr[mid] == target
    if arr[mid] < target
      left = mid + 1
    else
      right = mid - 1
    end
  end
  -1
end
```

✅ Time complexity: **O(log n)**
✅ Space complexity: **O(1)**

---

### 📦 Space Complexity

* Count additional space used **proportional to input size**.
* Ignore input — only count **extra** storage (e.g., arrays, hashes created inside method).

#### Example:

```ruby
def double_array(arr)
  result = []
  arr.each { |el| result << el * 2 }
  result
end
```

✅ Time complexity: **O(n)**
✅ Space complexity: **O(n)** (new array of same size)

---

## 🛠️ 4. **Tips for Manual Analysis**

| Pattern                    | Time Complexity       |
| -------------------------- | --------------------- |
| Simple loop over `n` items | O(n)                  |
| Nested loop over `n` items | O(n²)                 |
| Divide input in half       | O(log n)              |
| Recursion over `n`         | Depends on tree depth |

---

## 🧪 5. **Tools to Measure Real Execution Time**

In Ruby, use `Benchmark`:

```ruby
require 'benchmark'

arr = (1..10000).to_a

puts Benchmark.measure {
  sum_array(arr)
}
```

Or in Python:

```python
import time
start = time.time()
sum_array(arr)
print("Time:", time.time() - start)
```

⚠️ **Note**: Runtime is not equal to time complexity — complexity is theoretical, runtime is actual performance.

---

## ✅ Final Tip:

Focus on **loops, recursion, and data structures** used. Each affects complexity:

| Structure                  | Time Complexity |
| -------------------------- | --------------- |
| Array lookup               | O(1)            |
| Array `insert` or `delete` | O(n)            |
| Hash lookup or insert      | O(1)            |
| Sorting (e.g., quicksort)  | O(n log n)      |

---

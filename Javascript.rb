⚡ What is Turbolinks?
Turbolinks is a JavaScript library created by the Rails team to make navigating a web application faster by loading 
only the HTML needed instead of reloading the full page.

🧠 How it Works:
When you click a link:

Turbolinks intercepts the click.

It sends an AJAX request to the server for the new page.

It replaces the <body> and merges the <head> (if needed).

It doesn't reload the full page or JavaScript — it reuses the current JavaScript context.

✅ Result: Much faster page transitions, almost like a single-page application (SPA), but without rewriting your app in React/Vue.
=======================================================================================================================================
Here are clear and complete answers to all 10 of your JavaScript and React interview questions — useful for technical interviews or concept refreshers:

---

### ✅ 1. **What is the difference between `var`, `let`, and `const` in JavaScript?**

| Keyword | Scope    | Hoisting | Reassignment | Redeclaration |
| ------- | -------- | -------- | ------------ | ------------- |
| `var`   | Function | Yes      | ✅ Yes        | ✅ Yes         |
| `let`   | Block    | No       | ✅ Yes        | ❌ No          |
| `const` | Block    | No       | ❌ No         | ❌ No          |

* **`var`** is function-scoped and hoisted (initialized as `undefined`).
* **`let`** and **`const`** are block-scoped and not initialized at hoisting (temporal dead zone).
* **`const`** must be initialized and cannot be reassigned.

---

### ✅ 2. **How does the JavaScript event loop work?**

JavaScript is **single-threaded** but can handle asynchronous code using the **event loop**.

1. Executes synchronous code in the **call stack**.
2. Asynchronous tasks (like `setTimeout`, `fetch`) are handled by the browser and queued.
3. The **event loop** moves tasks from the **task queue** or **microtask queue** into the call stack **when it's empty**.

**Example:**

```js
console.log("A");
setTimeout(() => console.log("B"), 0);
Promise.resolve().then(() => console.log("C"));
console.log("D");
```

**Output:**

```
A  
D  
C  
B
```

---

### ✅ 3. **Explain closures in JavaScript with an example.**

A **closure** is a function that remembers variables from its **outer scope**, even after that outer function has finished executing.

**Example:**

```js
function outer() {
  let count = 0;
  return function inner() {
    return ++count;
  };
}
const counter = outer();
console.log(counter()); // 1
console.log(counter()); // 2
```

Here, `inner` forms a closure over `count`.

---

### ✅ 4. **What are promises, and how do they differ from async/await?**

* A **Promise** is an object representing the eventual result of an asynchronous operation.
* **`async/await`** is syntax sugar built on top of promises to write asynchronous code more clearly.

**Example:**

```js
// Promise
fetchData().then(data => console.log(data));

// Async/await
async function getData() {
  const data = await fetchData();
  console.log(data);
}
```

They both handle the same logic, but `async/await` is more readable and debuggable.

---

### ✅ 5. **What is the difference between shallow and deep copying in JavaScript?**

| Type        | Description                           | Affects Nested Data                    |
| ----------- | ------------------------------------- | -------------------------------------- |
| **Shallow** | Copies only top-level properties      | ❌ Still references same nested objects |
| **Deep**    | Recursively copies all levels of data | ✅ Independent nested copies            |

**Shallow Copy Example:**

```js
let a = { info: { age: 30 } };
let b = { ...a };
b.info.age = 40;
console.log(a.info.age); // 40 (shared reference)
```

**Deep Copy Example:**

```js
let deep = JSON.parse(JSON.stringify(a));
```

For complex cases, use `lodash.cloneDeep()`.

---

### ✅ 6. **Explain the difference between `==` and `===` in JavaScript.**

* `==` → **loose equality** with type coercion.
* `===` → **strict equality** without type coercion.

**Examples:**

```js
'5' == 5   // true
'5' === 5  // false
null == undefined  // true
null === undefined // false
```

**Best practice:** Always use `===` to avoid unexpected type coercion.

---

### ✅ 7. **What is the virtual DOM, and how does React use it?**

The **virtual DOM (VDOM)** is an in-memory representation of the real DOM. It allows React to:

1. Track changes efficiently.
2. Use a **diffing algorithm** to find what changed.
3. Update only those parts of the real DOM.

This improves performance and minimizes direct DOM manipulation.

---

### ✅ 8. **Explain the purpose of React hooks. How does `useEffect` work?**

Hooks let you use **state and lifecycle features** in **functional components**.

* **`useEffect`** is used for:

  * Fetching data
  * Subscribing/unsubscribing
  * Running side effects

**Basic usage:**

```js
useEffect(() => {
  console.log("Component mounted");

  return () => {
    console.log("Cleanup on unmount");
  };
}, []);
```

* Runs on **mount**.
* With dependencies (`[value]`), it runs on value change.
* Cleanup function is optional but useful for unsubscribing or clearing timers.

---

### ✅ 9. **What is the difference between controlled and uncontrolled components in React?**

| Type             | Data Source | Control               |
| ---------------- | ----------- | --------------------- |
| **Controlled**   | React state | React manages value   |
| **Uncontrolled** | DOM (`ref`) | Browser manages value |

**Controlled:**

```js
<input value={value} onChange={e => setValue(e.target.value)} />
```

**Uncontrolled:**

```js
<input ref={inputRef} />
```

Controlled components are preferred in most cases for validation and form handling.

---

### ✅ 10. **What is the significance of `key` props in React lists?**

The `key` prop helps React **identify which list items changed**, preventing unnecessary re-renders.

**Example:**

```js
items.map(item => <li key={item.id}>{item.name}</li>);
```

* A good `key` should be **unique and stable**.
* Don’t use array indexes unless items are static and won't reorder.

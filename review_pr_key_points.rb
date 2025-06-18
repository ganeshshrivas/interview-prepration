
---

## ✅ 1. **Code Quality**

* Is the code clean, readable, and properly formatted?
* Are method names, variable names, and class names meaningful and consistent?
* Is the code DRY (Don’t Repeat Yourself)?
* Are there unnecessary comments added

---

## ✅ 2. **Business Logic**

* Does the code correctly implement the requested feature or fix?
* Does it follow the acceptance criteria of the ticket/story?
* Are edge cases handled?

---

## ✅ 3. **Security**

* Is user input properly validated and sanitized?
* Are there any SQL injection, XSS, or mass assignment vulnerabilities?
* Are authentication and authorization checks in place?

---

## ✅ 4. **Performance**

* Are N+1 query issues avoided? (Look for `.includes`, `.preload` where needed)
* Are expensive operations or unnecessary DB queries avoided?
* Are indexes used where needed?

---

## ✅ 5. **Test Coverage**

* Are there unit, request, or feature tests for new functionality?
* Are edge cases tested?
* Do all tests pass in CI/CD?
* Are factories and test data meaningful?

---

## ✅ 6. **Database Changes**

* Are migrations properly written and reversible?
* Are proper constraints, indexes, and foreign keys applied?
* Is data integrity maintained?

---

## ✅ 7. **Rails Conventions**

* Are Rails best practices followed?
* Are callbacks (if used) appropriate and minimal?
* Are strong parameters correctly implemented in controllers?

---

## ✅ 8. **API Design (if applicable)**

* Are RESTful standards followed?
* Are response formats consistent?
* Are proper status codes returned?

  | Action            | Status Code |
| ----------------- | ----------- |
| GET Success       | 200         |
| POST Created      | 201         |
| PUT/PATCH Success | 200 / 204   |
| DELETE Success    | 204         |
| Validation Errors | 422         |
| Auth Errors       | 401 / 403   |

---

## ✅ 9. **Code Reusability and Modularity**

* Are reusable components extracted (service objects, concerns, presenters)?
* Is the Single Responsibility Principle followed?

---

## ✅ 10. **Documentation and Communication**

* Are the PR title and description clear and meaningful?
* Is the code self-explanatory or properly commented where needed?
* Are environment/configuration changes clearly documented?

---

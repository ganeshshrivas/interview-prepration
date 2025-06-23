Here’s a **complete list of Rails validations** commonly used in real projects and interviews, along with **examples** and **when to use them.**

---

# ✅ Rails Validations – Types & Examples

Rails provides a variety of **built-in validations** to ensure data integrity before records are saved to the database.

---

## 📌 1. **Presence Validation**

* Ensures that the field is not empty or `nil`.

```ruby
validates :name, presence: true
```

✔️ Use when a field must always have a value (e.g., name, email).

---

## 📌 2. **Uniqueness Validation**

* Ensures that no two records have the same value for a field.

```ruby
validates :email, uniqueness: true
```

✔️ Use for unique fields like email, username, phone number.

---

## 📌 3. **Length Validation**

* Restricts the number of characters.

```ruby
validates :username, length: { minimum: 3, maximum: 15 }
```

✔️ Use for passwords, names, or fixed-length fields.

---

## 📌 4. **Numericality Validation**

* Ensures that the field is a number.

```ruby
validates :age, numericality: true
validates :price, numericality: { greater_than: 0 }
```

✔️ Can also check if the number is an integer, positive, within a range, etc.

---

## 📌 5. **Format Validation**

* Ensures the field matches a specific regex pattern.

```ruby
validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
```

✔️ Common for emails, phone numbers, URLs.

---

## 📌 6. **Inclusion Validation**

* Ensures the field value is included in a predefined set.

```ruby
validates :role, inclusion: { in: %w[admin user guest] }
```

✔️ Useful for fields with limited allowed values.

---

## 📌 7. **Exclusion Validation**

* Ensures the field value is **not** in a specific list.

```ruby
validates :username, exclusion: { in: %w[admin superuser root] }
```

✔️ Useful to prevent reserved names.

---

## 📌 8. **Confirmation Validation**

* Ensures the field matches its confirmation field (commonly used for passwords).

```ruby
validates :password, confirmation: true
# requires a `password_confirmation` field to be present in the form
```

✔️ Often used in user registration forms.

---

## 📌 9. **Acceptance Validation**

* Validates that a checkbox (like terms of service) was accepted.

```ruby
validates :terms_of_service, acceptance: true
```

---

## 📌 10. **Custom Validation**

* You can write your own validation methods.

```ruby
validate :must_have_uppercase

def must_have_uppercase
  unless name =~ /[A-Z]/
    errors.add(:name, 'must contain at least one uppercase letter')
  end
end
```

✔️ Useful when built-in validators don’t cover complex cases.

---

# ✅ Other Important Concepts:

### 🔸 `validates_with`

* Use to apply a custom validator class.

### 🔸 `validates_each`

* Use to validate each element in an array field.

---

# ✅ Interview Tip:

Be ready to answer:

* **When would you use each validation?**
* **How to show custom error messages?**

```ruby
validates :email, presence: { message: "Email can't be blank" }
```

* **How validations are skipped?**
  Answer: `save(validate: false)` skips validations.

---

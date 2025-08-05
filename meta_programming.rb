**Ruby metaprogramming** is a powerful feature that allows Ruby code to write or modify other Ruby code at runtime. In essence, you're writing code that writes code. This enables dynamic behavior, such as defining methods on the fly, intercepting method calls, and modifying classes or objects during program execution.

---

### ✅ What Is Metaprogramming?

Metaprogramming = *"code that manipulates code."*

Ruby treats **classes, methods, and variables as objects**, and because of this, you can:

* Add methods to classes at runtime
* Define or remove methods dynamically
* Use `send` to invoke methods dynamically
* Use hooks like `method_missing` to respond to undefined methods

---

### 🔧 Common Metaprogramming Techniques

| Technique                           | Description                                |
| ----------------------------------- | ------------------------------------------ |
| `define_method`                     | Dynamically define a method                |
| `method_missing`                    | Handle calls to undefined methods          |
| `send` / `public_send`              | Dynamically invoke a method                |
| `class_eval` / `instance_eval`      | Evaluate code in class or instance context |
| `singleton_class`                   | Define methods only on a specific object   |
| `included`, `extended`, `inherited` | Hooks in modules and classes               |

---

### 📌 Examples of Usage

#### 1. **`define_method` — Dynamic Method Definition**

```ruby
class Product
  [:price, :title, :description].each do |attr|
    define_method(attr) do
      instance_variable_get("@#{attr}")
    end

    define_method("#{attr}=") do |value|
      instance_variable_set("@#{attr}", value)
    end
  end
end

p = Product.new
p.title = "Book"
puts p.title  # => "Book"
```

---

#### 2. **`method_missing` — Catch Undefined Methods**

```ruby
class APIClient
  def method_missing(method, *args)
    puts "Calling API method: #{method} with args #{args.inspect}"
  end
end

client = APIClient.new
client.get_users(1) # => Calling API method: get_users with args [1]
```

Use with caution—can make code hard to debug.

---

#### 3. **`send` — Dynamic Method Invocation**

```ruby
class Greeting
  def hello(name)
    "Hello, #{name}"
  end
end

g = Greeting.new
puts g.send(:hello, "Ganesh") # => "Hello, Ganesh"
```

---

#### 4. **DSLs (Domain-Specific Languages)**

Metaprogramming is the backbone of **DSLs** like:

```ruby
class Person
  attr_accessor :name, :age

  def self.describe(&block)
    instance_eval(&block)
  end

  def self.has(attribute)
    attr_accessor attribute
  end
end

Person.describe do
  has :gender
end

p = Person.new
p.gender = "Male"
puts p.gender  # => "Male"
```

---

#### 5. **ActiveRecord in Rails**

Rails uses metaprogramming **heavily**:

```ruby
User.find_by_email("abc@example.com")
# No such method defined. It's built dynamically using `method_missing`.

User.attribute_names.each do |attr|
  define_method("#{attr}_changed?") do
    # define custom logic
  end
end
```

---

### 🎯 When to Use Metaprogramming

* Building DSLs (like RSpec, Rails migrations)
* DRYing repetitive code (mass method generation)
* Creating flexible APIs
* Decorators and proxies

---

### ⚠️ Caution

* Can make code **hard to understand and debug**
* Use **only when justified** (e.g., DRYing code, building DSLs)
* Prefer readability over cleverness

---

### Summary

Ruby metaprogramming is about:

* Defining/Modifying behavior at runtime
* Making your code more flexible, powerful
* Being **careful** with complexity

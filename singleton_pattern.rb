
# ✅ Singleton Pattern in Ruby Singleton Also knows as eaginclass

The **Singleton Pattern** ensures that **a class has only one instance** throughout the lifetime of an application and provides a global access point to it.

In Ruby, we can easily implement this using the `Singleton` module from Ruby’s standard library.

---

## 🔹 When to Use the Singleton Pattern

* Logger classes
* Configuration managers
* Cache handlers
* Service connectors (like database connection pools)

---

## 📚 Example: Using `Singleton` Module

```ruby
require 'singleton'

class AppConfig
  include Singleton

  attr_accessor :app_name, :version
end

# Access the singleton instance
config1 = AppConfig.instance
config2 = AppConfig.instance

config1.app_name = "MyApp"
config2.version = "1.0.0"

puts config1.app_name   # => "MyApp"
puts config2.version    # => "1.0.0"

puts config1.object_id == config2.object_id  # => true (both are the same object)
```

---

### ✅ Key Notes:

* `AppConfig.instance` always returns **the same instance**.
* You **cannot use `AppConfig.new`**. It’s restricted by the `Singleton` module.
* The `Singleton` module automatically:

  * Makes `new` private.
  * Provides a globally accessible `instance` method.
  * Ensures **thread-safety**.

---

## 🔨 Without Singleton Module (Manual Singleton)

```ruby
class Logger
  @instance = nil

  def self.instance
    @instance ||= new
  end

  private_class_method :new

  def log(message)
    puts "Log: #{message}"
  end
end

logger1 = Logger.instance
logger2 = Logger.instance

puts logger1.object_id == logger2.object_id  # => true
```

👉 This is how you would **manually implement a singleton** if you don’t use the built-in `Singleton` module.

---

## 🔍 Summary

| Feature         | Singleton Class                         | Singleton Pattern               |
| --------------- | --------------------------------------- | ------------------------------- |
| Purpose         | Add methods to a single object          | Ensure one instance globally    |
| Syntax          | `class << object`                       | `include Singleton`             |
| Use Case        | Object-specific customization           | Shared objects (logger, config) |
| Object Creation | No restriction, just per-object methods | Only one instance allowed       |

---

If you’d like, I can help you prepare **interview questions** based on Singleton Class vs Singleton Pattern, or help you code more examples. Would you like that? 😊

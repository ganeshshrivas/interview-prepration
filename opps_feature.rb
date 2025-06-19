
### 1. **Encapsulation**

* **Definition:** Wrapping data (variables) and methods (functions) into a single unit called a class.
* **Purpose:** Hides internal state and requires all interaction to be performed through an object's methods, protecting the object's integrity.
* **Example in Ruby:**

  ```ruby
  class BankAccount
    def initialize(balance)
      @balance = balance
    end

    def deposit(amount)
      @balance += amount
    end

    def show_balance
      @balance
    end

    private

    def secret_pin
      1234
    end
  end
  ```

  * `@balance` is encapsulated and accessed only via methods.
  * `secret_pin` is hidden from outside the class.

---

### 2. **Abstraction**

* **Definition:** Hiding complex implementation details and showing only the necessary features.
* **Purpose:** Reduces programming complexity and effort.
* **Example in Ruby:**

  ```ruby
  class Payment
    def process_payment
      validate_card
      puts "Payment processed"
    end

    private

    def validate_card
      puts "Card validated"
    end
  end
  ```

  * User only knows about `process_payment` and not about how `validate_card` works internally.

---

### 3. **Inheritance**

* **Definition:** Allows a class to acquire the properties and behaviors (methods) of another class.
* **Purpose:** Supports code reuse and establishes relationships between classes.
* **Example in Ruby:**

  ```ruby
  class Vehicle
    def start
      puts "Vehicle started"
    end
  end

  class Car < Vehicle
    def drive
      puts "Car is driving"
    end
  end

  car = Car.new
  car.start   # Inherited method
  car.drive
  ```

---

### 4. **Polymorphism**

* **Definition:** Allows methods to behave differently based on the object that is calling them.
* **Types:** Method Overriding (runtime polymorphism) and Method Overloading (not natively supported in Ruby, but can be simulated).
* **Example in Ruby:**

  ```ruby
  class Animal
    def speak
      puts "Animal speaks"
    end
  end

  class Dog < Animal
    def speak
      puts "Dog barks"
    end
  end

  class Cat < Animal
    def speak
      puts "Cat meows"
    end
  end

  animals = [Dog.new, Cat.new]
  animals.each { |animal| animal.speak }
  ```

  * Same method `speak`, but different behaviors based on the object.

---

### ✅ **Summary:**

| OOP Feature   | Purpose                       | Ruby Example                       |
| ------------- | ----------------------------- | ---------------------------------- |
| Encapsulation | Hide data, control access     | `@balance` with getter/setter      |
| Abstraction   | Hide complexity               | Public method calls private method |
| Inheritance   | Reuse code, class hierarchy   | `class Car < Vehicle`              |
| Polymorphism  | One interface, many behaviors | Method overriding (speak example)  |

---

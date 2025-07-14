module Greetable
  # Instance method
  def greet
    "Hello from instance method!"
  end

  # Class methods go inside a nested module and are extended
  module ClassMethods
    def greet_class
      "Hello from class method!"
    end
  end

  # Hook that gets called when this module is included
  def self.included(base)
    base.extend(ClassMethods)
  end
end


class User
  include Greetable
end

user = User.new
puts user.greet             # => "Hello from instance method!"
puts User.greet_class       # => "Hello from class method!"

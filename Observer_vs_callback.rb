📌 What is a Rails Observer?
A Rails Observer is a design pattern (Observer Pattern) used to monitor changes in a model and perform actions outside of the model’s class.

Used for: Separating logic that doesn't belong directly in the model.

Useful when: You want to keep your models thin and move side-effects (like sending emails, logging) outside the model.

👉 Important: Rails Observers were removed from Rails 4 by default but can still be used via the rails-observers gem.

Exmaple
# app/models/user.rb
class User < ApplicationRecord
  # no callbacks here
end

# app/observers/user_observer.rb
class UserObserver < ActiveRecord::Observer
  def after_create(user)
    UserMailer.welcome_email(user).deliver_later
  end
end

# config/application.rb
config.active_record.observers = :user_observer

What is a Rails Callback?
====================================================
A Rails Callback is a method that gets triggered at specific points in the model’s lifecycle.

Used for: Handling model-related side-effects inside the same model.

Types: before_save, after_create, before_destroy, etc.

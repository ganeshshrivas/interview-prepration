
## 🚀 1. What is a **RESTful Route**?

A **RESTful route** follows the [REST](https://restfulapi.net/) (Representational State Transfer) principles. It uses **standard HTTP verbs** and **conventional URI patterns** to represent actions on resources.

---

### ✅ RESTful Routes Example

```ruby
resources :posts
```

Generates 7 standard routes:

| HTTP Verb | Path             | Controller#Action | Purpose        |
| --------- | ---------------- | ----------------- | -------------- |
| GET       | /posts           | posts#index       | List all posts |
| GET       | /posts/\:id      | posts#show        | Show a post    |
| GET       | /posts/new       | posts#new         | Form for new   |
| POST      | /posts           | posts#create      | Create a post  |
| GET       | /posts/\:id/edit | posts#edit        | Edit form      |
| PATCH/PUT | /posts/\:id      | posts#update      | Update post    |
| DELETE    | /posts/\:id      | posts#destroy     | Delete post    |

---

## 🔥 2. What is a **Non-RESTful Route**?

A **Non-RESTful route** does **not follow** the standard REST conventions. It’s often used for **custom actions** that don’t map to the 7 RESTful ones.

---

### ❌ Non-RESTful Routes Example

```ruby
get '/posts/publish/:id', to: 'posts#publish'
post '/users/:id/reset_password', to: 'users#reset_password'
```

* These actions (`publish`, `reset_password`) don't fit into RESTful CRUD.
* Not wrong — but diverges from Rails convention.

---

### 🧠 Key Differences:

| Feature              | RESTful Routes                                  | Non-RESTful Routes                           |
| -------------------- | ----------------------------------------------- | -------------------------------------------- |
| Structure            | Conventional, standardized                      | Custom and arbitrary                         |
| HTTP verbs           | GET, POST, PATCH, PUT, DELETE                   | Any HTTP verb, often GET/POST                |
| Action names         | index, show, new, create, edit, update, destroy | Custom like `approve`, `archive`, `download` |
| Convention Over Conf | Yes                                             | No                                           |
| Route helper naming  | `posts_path`, `new_post_path`, etc.             | Custom or absent                             |
| Maintainability      | High                                            | Can become messy if overused                 |

---

## ✅ When to Use Non-RESTful Routes

Use them **sparingly** when:

* The action doesn’t map to standard CRUD.
* You need **member-specific** custom actions (on one resource).
* You need **collection-specific** custom actions.

---

### Example in Rails:

```ruby
resources :posts do
  member do
    post 'publish'   # /posts/:id/publish
  end

  collection do
    get 'archived'   # /posts/archived
  end
end
```

---

### ✅ Summary

| RESTful Routes                       | Non-RESTful Routes                    |
| ------------------------------------ | ------------------------------------- |
| Follow conventions (index, show\...) | Custom actions (archive, activate...) |
| Easy to maintain and test            | Can be messy if overused              |
| Encouraged in Rails                  | Use only when needed                  |



✅ What is REST Convention?
REST (Representational State Transfer) is an architectural style for designing networked applications — especially APIs. In Rails (and web development in general), REST conventions provide a standardized, consistent way to organize URLs, HTTP methods, and controller actions to manage resources like posts, users, etc.

🚀 Core Principles of REST Convention
Resources over actions
You treat everything (users, posts, comments) as a resource, not just actions or pages.

Standard HTTP verbs represent specific actions:

GET – Read

POST – Create

PUT/PATCH – Update

DELETE – Delete

Stateless interactions
Every request should contain all the information needed to process it (no sessions stored on the server).

Consistent and predictable URL structure

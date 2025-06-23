# Auth-App API

A RESTful API built with **Ruby on Rails** that supports full **CRUD operations** on companies, with **JWT-based authentication** using **Devise** and **role-based authorization** using **CanCanCan**.

---

## 🚀 Features

- User registration & login with **Devise + JWT**
- Role-based access control using **CanCanCan**
- Companies CRUD (Create, Read, Update, Delete)
- Clean API structure with `Api::V1` namespace
- Error handling with proper status codes
- Protected routes for authenticated users

---

## 🔐 Tech Stack

- **Ruby on Rails** (API mode)
- **Devise** – for user authentication
- **JWT** – for token-based auth
- **CanCanCan** – for role-based authorization
- **PostgreSQL** (or SQLite for local)
- **Puma** – web server
- **RSpec** (optional for testing)

---

## 🧠 User Roles

You can define roles in the `User` model like:
```ruby
ROLES = %w{super_admin admin user editor collaborator}

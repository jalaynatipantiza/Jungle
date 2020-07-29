# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. 
Implemented new features:

**Feature: Sold out badge**
- When a product has 0 quantity, a sold out badge displays on the product list page

**Feature:Admin Categories**
- Admin users can list and create new categories 
- Admin users can add new products to newly create category

**Feature: User Authentication**
- Visitors are able to access registration page, can sign up/log in for user account with email, first name and last name
- User can logout from any page and cannot sign up with an existing e-mail address (uniqueness validation)
- Passwords are not stored as plain text in the database. Instead, has_secure_password is used in the User model, leveraging the bcrypt gem.

**Bug: Checking Out with Empty Cart**
- When the cart is empty, display a friendly message about how it is empty and link to the home page.

!["Category List"](https://github.com/jalaynatipantiza/Jungle/blob/master/docs/category_list.png?raw=true)
!["Friendly message"](https://github.com/jalaynatipantiza/Jungle/blob/master/docs/friendly_message.png?raw=true)
!["Creating New Category"](https://github.com/jalaynatipantiza/Jungle/blob/master/docs/new_category.png?raw=true)
!["Sign Up Form"](https://github.com/jalaynatipantiza/Jungle/blob/master/docs/sign_up_form.png?raw=true)
!["Sold Out Badge"](https://github.com/jalaynatipantiza/Jungle/blob/master/docs/sold_out_badge%20.png?raw=true)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

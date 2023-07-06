# API created with Rails
To demonstrate API creation and authentication with Rails. Can create restaurants, add comments to restaurants, and edit restaurants. Uses Pundit for authorization and Devise for authentication. Formats responses as JSON. Uses Postgres as database.

## Docs

Call all restaurants
```
curl -s http://localhost:3000/api/v1/restaurants | jq
```

Call one restaurant
```
curl -s http://localhost:3000/api/v1/restaurants/1 | jq
```
Update a restaurant
```
curl -i -X PATCH                                        \
       -H 'Content-Type: application/json'              \
       -H 'X-User-Email: email@example.com'               \
       -H 'X-User-Token: YOUR_TOKEN_FROM_RAILS_CONSOLE'          \
       -d '{ "restaurant": { "name": "New name" } }'    \
       http://localhost:3000/api/v1/restaurants/1
```

Create a restaurant
```
curl -i -X POST                                                              \
     -H 'Content-Type: application/json'                                     \
     -H 'X-User-Email: email@example.com'                                      \
     -H 'X-User-Token: YOUR_TOKEN_FROM_RAILS_CONSOLE'                                 \
     -d '{ "restaurant": { "name": "New restaurant", "address": "Paris" } }' \
     http://localhost:3000/api/v1/restaurants
```

Create a comment
```
curl -i -X POST                                                              \
     -H 'Content-Type: application/json'                                     \
     -H 'X-User-Email: email@example.com'                                      \
     -H 'X-User-Token: YOUR_TOKEN_FROM_RAILS_CONSOLE'                                 \
     -d '{ "comment": {"content":"Great" } }' \
     http://localhost:3000/api/v1/restaurants/3/comments
```

Delete a restaurant
```
curl -i -X DELETE                               \
     -H 'X-User-Email: email@example.com'         \
     -H 'X-User-Token: YOUR_TOKEN_FROM_RAILS_CONSOLE'    \
     http://localhost:3000/api/v1/restaurants/1
```

## Setup
A brief overview of the setup process. This API is currently run only on localhost.

### Uses Pundit as authorization library
Cannot edit restaurants that are not created by you.
```
gem 'pundit'
bundle install
rails g pundit:install

(after rails db:migrate)
rails g pundit:policy restaurant
rails g pundit:policy comment
```

### Uses Devise for user authentication (API Keys)
Generate new user tokens after adding the authentication to the user model. Then create new users via the rails console.

Uses the `gem 'simple_token_authentication'` to generate auth tokens for users.

Add migration to add tokens to users table.

Ensure you place `acts_as_token_authenticatable` in the user model.

Add Update route.

For now this has the capability of one user, one token.

### API

All controllers for API live inside app/controllers/api/v1
Base controller acts as parent of all apis.

Neccessary so that we can have different authentication for different apis or other iterations. Also, you may need to make breaking changes and issue new versions of your API.

### Updating restaurants
Update restraurants through restraurants controller. Policy affects this.

Adding comments is done through seperate controller and policy.

### To do:

- [ ] Add unit tests
- [✔️] Seed data

# API created with Rails
To demonstrate API creation and authentication with Rails.

## Uses Pundit as authorization library
Cannot edit restaurants that are not created by you.
```
gem 'pundit'
bundle install
rails g pundit:install

(after rails db:migrate)
rails g pundit:policy restaurant
```

## Uses Devise for user authentication (API Keys)
Like the API key


### API

All controllers for API live inside app/controllers/api/v1
Base controller acts as parent of all apis.

Neccessary so that we can have different authentication for different apis or other iterations. Also, you may need to make breaking changes and issue new versions of your API.

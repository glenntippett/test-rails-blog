# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

# FYI:

```bash
rails generate model Comment commenter:string body:text article:references
```

A Comment `belongs_to :article` - Active Record association

The (:references) keyword used in the shell command is a special data type for models. It creates a new column on your database table with the provided model name appended with an \_id that can hold integer values. To get a better understanding, analyze the db/schema.rb file after running the migration.

### Update existing models after migration:

https://guides.rubyonrails.org/getting_started.html#creating-the-blog-application:~:text=To%20choose%20the,status%3A%20%22public%22).
To choose the status for the existing articles and comments you can add a default value to the generated migration files by adding the default: "public" option and launch the migrations again. You can also call in a rails console Article.update_all(status: "public") and Comment.update_all(status: "public").

### Install Bootstrap

`gem 'bootstrap'`
`gem 'sassc-rails'`

```
# app/assets/stylesheets/application.scss
@import "bootstrap";
```

`bin/importmap pin bootstrap`

```
// app/javascript/application.js
import "@popperjs/core"
import "bootstrap"
```

```
// app/assets/config/manifest.js
//= link popper.js
//= link bootstrap.min.js
```

```
# config/importmap.rb

# replace these lines:
# pin "bootstrap" # @5.3.2
# pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8

# with this:
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
```

### Like Button

[adding-likes-rails-hotwire-turbo](https://webcrunch.com/posts/adding-likes-rails-hotwire-turbo)

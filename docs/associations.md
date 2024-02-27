```bash
rails generate model Comment commenter:string body:text article:references
```

A Comment `belongs_to :article` - Active Record association

The (:references) keyword used in the shell command is a special data type for models. It creates a new column on your database table with the provided model name appended with an \_id that can hold integer values. To get a better understanding, analyze the db/schema.rb file after running the migration.

### Update existing models after migration:

https://guides.rubyonrails.org/getting_started.html#creating-the-blog-application:~:text=To%20choose%20the,status%3A%20%22public%22).
To choose the status for the existing articles and comments you can add a default value to the generated migration files by adding the default: "public" option and launch the migrations again. You can also call in a rails console Article.update_all(status: "public") and Comment.update_all(status: "public").

# Specifications for the Rails Assessment
rails s -b 'ssl://localhost:3000?key=/Users/Morgan/Development/movie_database/localhost.key&cert=/Users/Morgan/Development/movie_database/localhost.crt'

Specs:
- [x] Using Ruby on Rails for the project
    ## Self-evident
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    ## User has_many Movies, Movie has_many Users, both have_many UserMovies
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    ## UserMovie belongs_to both User and Movie
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    ## User has_many Movies through UserMovies, and vice-versa
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    ## User has_many Movies, and vice-versa
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    ## UserMovie has submittable attribute 'Rating'
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    ## Both Users and Movies have validations
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    ## Released_before is a scope method that returns all movies before a desired date
- [x] Include signup (how e.g. Devise)
    ## Users are allowed to sign up or sign in through Github, password is authenticated and salted through BCrypt
- [x] Include login (how e.g. Devise)
    ## Included
- [x] Include logout (how e.g. Devise)
    ## Included
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    ## Users are allowd to sign in through Github using OmniAuth
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    ## A nested index route shows a list of all the movies a User owns (User/5/Movies)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    ## a nested new route allows Users to add a movie to their collection and creates a new UserMovie object (User/3/Movie/New)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    ## All New and Edit Views will show any errors resulting in objects not being saved

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
# recommend-me-rails
This is a rails application to organize and share recommendations among a group


1. Review file structure, and figure out what initial gems are needed, etc.
2. Figure out schema, models, relationships, etc.
    User has many recommendations; has many Categories through recommendations
    Recommendation belongs to a User; belongs to Category
    Category have many recommendations; and many users through recommendations
    Comments belong to a Recommendation; belong to a User; many-to-many relationships
3. creating migrations and models
4. Create Oauth connection
5. "user" side of things, create new account, login, logout, etc.
6. create nested resources - comments within recommendation - see namespaced routes lab
7. create ActiveRecord scope method (see instructions for project)
8. validation errors - a. Your fields should be enclosed within a fields_with_errors class b. Error messages describing the validation failures must be present within the view.
9. use helper methods and partials

# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes);
User has_many :recommendations; has_many :comments, etc.
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
Comment belongs_to :commentor, etc.
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
User has_many :commented_recommendations, :through => :comments, :source => :recommendation;
Recommendation has_many :commentors, :class_name => 'User', through: :comments
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
Comments.text
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item); User, Recommendations, Category
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup (how e.g. Devise); new_user path
- [x] Include login (how e.g. Devise); /login - sessions#new
- [x] Include logout (how e.g. Devise); logout - sessions#destroy
- [x] Include third party signup/login (how e.g. Devise/OmniAuth); oauth - Google
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new); check on this - my form goes there - URL doesn't display
- [x] Include form display of validation errors (form URL e.g. /recipes/new); recommendations form

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [x] Views use helper methods if appropriate; recommendation form edit and delete buttons use helper methods to view
- [x] Views use partials if appropriate; comment, recommendation, and form partials

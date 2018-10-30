# recommend-me-rails
This is a rails application to organize and share recommendations among a group


1. Review file structure, and figure out what initial gems are needed, etc.
2. Figure out schema, models, relationships, etc.
    User has many recommendations; has many Categories through recommendations
      string:name string:email string:password_digest string :uid
    Recommendation belongs to a User; belongs to Category
      string:title text:description integer:user_id integer:category_id
    Category have many recommendations; and many users through recommendations
      string:name
    Comments belongs to a Recommendation; belongs to a User; many-to-many relationships
      text:text integer:user_id integer:recommendation_id
3. creating migrations and models
4. Create Oauth connection
5. "user" side of things, create new account, login, logout, etc.

6. create nested resources - comments within recommendation - see namespaced routes lab
• You must include a nested index or show route e.g. categories/2/recommendations; users/3/comments
would recommendations/1/comments count?
• You must include a nested new route with form that relates to the parent resource;
would recommendations/1/comments(new) count?

7. create ActiveRecord scope method (see instructions for project); done

8. validation errors - a. Your fields should be enclosed within a fields_with_errors class b. Error messages describing the validation failures must be present within the view.; done

9. use helper methods and partials; perhaps use some of the helper methods within the views; done
10. testing
11. record demo of product
12. write README
13. submit project etc.
14. write blog

# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) The app includes several has_many relationships, a user:( has_many students). A student:(has many appointments). A tutor: (has_many appointments)

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) An appointment belongs_to a student and a tutor

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) A user:( has_many tutors, through students, and has_many appointments through students). A student: (has_many tutors through appointments). A tutor:(has_many sutdents through appointments)

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) A student: (has_many tutors through appointments). A tutor:(has_many sutdents through appointments) 

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) A user signed in as either a student or tutor, can create a student and a tutor and set up appointments.

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) Set up validations in each model to ensure that all attributes were submited and not left blank also, for the appointments in case any appointments overlapped for both the tutor and the student.

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) Set up scopes in appointments model to filter appointments

- [x] Include signup (how e.g. Devise) Used to devise guide online to install and setup login, signup, logout

- [x] Include login (how e.g. Devise)

- [x] Include logout (how e.g. Devise)

- [x] Include third party signup/login (how e.g. Devise/OmniAuth) Used google omniauth2

- [x] Include nested resource show or index (URL e.g. users/2/recipes) My tutor and student both have nested resources for appointments with index

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) My tutor and student both have nested resources for appointments with new

- [x] Include form display of validation errors (form URL e.g. /recipes/new) I use the devise error messages, that will display validation errors


Confirm:
- [x] The application is pretty DRY : I use _form when needed and render partials
- [x] Limited logic in controllers : There are many controllers for all the different request, each one does something specific
- [x] Views use helper methods if appropriate : use an error_helper method to display errors
- [x] Views use partials if appropriate : the edit and new views render a _forn partial

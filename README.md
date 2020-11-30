# README

Welcome to my rails application, Tutor appointments rails.
This is a rails web application that uses ruby(2.6.1) on rails(6.0.3).
The application allows you to start up a server for a tutor website.


* Database initialization

To start the database structre

-run rails db:migrate
-run rails db:seed to use seeded data(optional)

* Services 

Allow you to schedule appointments with many tutors and many students.

* Deployment instructions

Once you fork and clone this repository the first thing to do is run bundle install

Next, run rails db:migration to create all of our tables for the models.

There is also already data for some of the models in the seed.rb file. 

Feel free to run rails db:seed to start the server with some data or don't and create
your own upon entering the browser.

To start the server run rails s.

This will open a webpage localhost:3000 which should diect you to a login/singup page.

From here you can sign up as a user. A user can login as a student/parent to register
students for the tutoring website. A user can also login as a tutor and create tutors.

A user can only create what they are logged in as. A tutor cannot create a student, 
and a sutdent cannot create a tutor. This would make sense as one user shouldn't have 
access to another users created data. 

After creating some data for students and tutor, we can make appointments.

Appointments are between one tutor and student. The appointments model is where we make
all of our relations join together. 

There are also validations in place so no appointments 
with a tutor or aother student can overlap. 

Thats about all the functionality we have right now. We can create a tutor or a student 
and the make an apointment.

We can view the student, teacher and appointment information. Also if you have access 
(depending on who you are logged in as) you can edit the information.
* ...

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.first_or_create(email: "antromo@test.com", password: "testpass", phone_number: '(111)111-1111')

s1 = user.students.find_or_create_by(name: "Romo")
s2 = user.students.find_or_create_by(name: "Nicole")

t1 = Tutor.find_or_create_by(name: "Mr A", phone_number: "631-111-1111", specializations: "Math & Physics")
t2 = Tutor.find_or_create_by(name: "Mr R", phone_number: "631-111-2222", specializations: "English & History")
 

10.times do
    tutor = [t1, t2].sample
    start = [1,2,3,4,5,6].sample.days.ago + [1,2,3,4,5,6,7].sample.hour
    tutor.appointments.find_or_create_by(
        student: [s1,s2].sample,
        start_time: start,
        end_time: start + 1.hour,
        location: ["Library", "School Classroom", "Learning Center"].sample
    )
end
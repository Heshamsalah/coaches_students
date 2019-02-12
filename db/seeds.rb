# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "======================================================="
puts "======================================================="

puts "Seeding data into the database ..... "

coaches = FactoryBot.create_list(:coach_with_students, 20, students_count: 10, capacity: 50)

FactoryBot.create_list(:student, 100)

puts "You have #{Coach.count} Coaches and #{Student.count} Students."

puts "Finshed Seeding data successfully!"
puts "======================================================="
puts "======================================================="


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

coaches = []

(1..10).each do |i|
  coaches << Coach.create(name: "Coach#{i}")
  puts "Created Coach 'Coach#{i}'"
end

coaches.each do |coach|
  (1..rand(2...10)).each do |i|
    coach.students.create(name: "Student#{i}")
    puts "Created Student 'Student#{i}', for Coach #{coach.name}"
  end
end

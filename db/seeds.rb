# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times.each do |index|
  coach = Coach.create(name: "Coach ##{index}")

  5.times.each do |index_2|
    course = coach.courses.create(name: "Coach ##{index}, Course ##{index_2}", self_assignable: index_2 % 2)
    5.times.each do |index_3|
      course.activities.create(name: "Coach ##{index}, Course ##{index_2}, Activity ##{index_3}")
    end
  end
end
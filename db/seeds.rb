# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Category.create({name: "Sleep"})
Category.create({name: "Study"})

Challenge.create({name: "Sleep 40 hours a week", category: Sleep, goal: 40, progress: 0, units: “hours”, ends_at: Date.parse(“2024-08-15”) })
Challenge.create({name: "Study 18 hours a week", category: Study, goal: 18, progress: 0, units: “hours”, ends_at: Date.parse(“2024-08-15”) })

Activity.create({amount: 8, note: "Went to bed on time"})
Activity.create({amount: 3, note: "Got it done right after lunch"})


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: "a1@b.c", password: "password")
User.create!(email: "a2@b.c", password: "password")
User.create!(email: "a3@b.c", password: "password")
User.create!(email: "a4@b.c", password: "password")

# rake db:seed
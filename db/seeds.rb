# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

random = Array.new(100) do
  {
    name: Faker::Name.first_name,
    email: Faker::Internet.email,
    age: Faker::Number.within(range: 19..80)
  }
end

fixed = [
  { name: "John", email: "jdoe@example.com", age: 21 },
  { name: "Emma", email: "emma@example.com", age: 30 },
  { name: "Don", email: "don@example.com", age: 34 },
  { name: "Boris", email: "boris@example.com", age: 62 },
  { name: "Mary", email: "mary@example.com", age: 18 },
  { name: "Dave", email: "dave@example.com", age: 29 },
  { name: "Chris", email: "chris@example.com", age: 51 },
  { name: "Ed", email: "ed@example.com", age: 43 },
  { name: "Kevin", email: "kevin@example.com", age: 81 },
  { name: "Dave", email: "dave@example.com", age: 76 }
]

(random + fixed).each(&Contact.method(:create))

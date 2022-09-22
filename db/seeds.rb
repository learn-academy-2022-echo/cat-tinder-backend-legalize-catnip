# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

cats = [
    {
    name:"Puss in Boots",
    age:7,
    enjoys:"dueling",
    image:"https://images.immediate.co.uk/production/volatile/sites/3/2022/03/Puss-in-Boots-2--b3ae519-e1647428302345.png?resize=620,413?quality=90&webp=true&resize=620,414"
},
    {
    name:"Kaat",
    age:3,
    enjoys:"mewoing",
    image:"https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.nationalgeographic.com%2Fanimals%2Farticle%2Fanimals-cats-training-pets&psig=AOvVaw2SdGHiSBHnCV7lf19R-hAE&ust=1663972158689000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCNjLwr-5qfoCFQAAAAAdAAAAABAD"
},
    ]

cats.each do |indiv_cat|
    Cat.create indiv_cat
    p "A new cat named #{indiv_cat} was added."
end

p Cat.all

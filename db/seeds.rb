# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all

Category.create(name: "Aneis", description: "")
Category.create(name: "Pulseiras", description: "")
Category.create(name: "Brincos", description: "")
cat = Category.create(name: "Colares", description: "")

Product.create(name: "Produto1", category: cat, price: 20.2)





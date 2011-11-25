# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Category.destroy_all

Category.create(name: "Aneis", description: "", logo: "http://www.todayifoundout.com/wp-content/uploads/2010/09/Wedding-rings.jpg")
Category.create(name: "Pulseiras", description: "", logo: "http://www.doleanddowdjewelers.com/images/gold_bracelet.jpg?333")
Category.create(name: "Brincos", description: "", logo: "http://1.bp.blogspot.com/_4DZeuZWSETU/TQdCA4PrU7I/AAAAAAAAA_Q/9He0V7GRleI/s400/semi_precious_gemstone_earrings.jpg")
cat = Category.create(name: "Colares", description: "", logo: "http://annemaadesigns.com/beadedjewelry_images/semi_precious_gemstone_necklaces.jpg")

Product.create(name: "Produto1", category: cat, price: 20.2)





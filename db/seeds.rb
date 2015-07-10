# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "--- Deleting all users ---"
User.destroy_all
puts "--- Deleting all products ---"
Product.destroy_all

def create_product_for(user)

    Product.create(
    	user_id: User.last[:id],
    	title: "Title of product",
    	description: "Description of product",
    	deadline: rand(0..90).days.ago
        )
end


user1 = User.create!(
	name: 'Наталья', 
	email: 'наталья12@яандекс.com', 
	)
user2 = User.create!(
	name: 'Алексей', 
	email: 'алексей4133@рт.com', 
	)
user3 = User.create!(
	name: 'Джордэн', 
	email: 'синийджорд@яандекс.com', 
	)
user4 = User.create!(
	name: 'Алисэн', 
	email: 'алис@яандекс.com', 
	)
user5 = User.create!(
	name: 'Ирина', 
	email: 'Ирина12@яандекс.com', 
	)

create_product_for(user1)
create_product_for(user2)
create_product_for(user3)
create_product_for(user4)
create_product_for(user5)





# User1 = User.new(name: "Наталья", email: 'something@exmaple.com')
# User2 = User.new(name: "Алексей", email: 'something@example.com')
# User3 = User.new(name: "Джордэн", email: 'something@exmaple.com')
# User4 = User.new(name: "Ирина", email: 'something@exmaple.com')
# # sharon.products.create(user_id: User[:id], title: "Sharon's product", description: "really awesome", deadline: rand(0..90).days.ago)

# users = User.all

# users.each do |user|
# 	user.products.create(user_id: User[:id], title: "Cool product", description: "really awesome", deadline: rand(0..90).days.ago)
# end






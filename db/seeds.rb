# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "--- Deleting all users and projects ---"
User.destroy_all
Product.destroy_all

def create_product_for(user)
    Product.create(
    	user_id: User.last[:id],
    	title: "Title of product",
    	description: "Description of product",
    	deadline: DateTime.new(2012, 8, 29,  0,  0,  0)
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

create_product_for(user1)
create_product_for(user2)
create_product_for(user3)
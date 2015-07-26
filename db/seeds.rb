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
puts "--- Deleting all bids ---"
Bid.destroy_all

6.times do (
	def create_product_for(user)

    product = Product.create!(
    	user_id: User.last[:id],
    	title: Faker::Commerce.product_name,
    	description: Faker::Lorem.sentence(2),
    	deadline: Faker::Time.forward(23, :evening)
        )
	end


user = User.create!(
	name: Faker::Name.name, 
	email: Faker::Internet.email,
	password: Faker::Lorem.words(8)
	)


create_product_for(user)


)
end








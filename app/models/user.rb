class User < ActiveRecord::Base
	has_many :products

	validates :name, presence: true
	validates :email, presence: true

	def self.last_created(n)
		order('name ASC')
	end

	def show_name
		[name].compact.join(" - ")
	end

	def show_email
		[email].compact.join(" - ")
	end

	def proper_email
		unless email.include? '@'
      	errors.add(:proper_email, 'Invalid email')
    	end
	end

end

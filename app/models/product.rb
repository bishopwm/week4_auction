class Product < ActiveRecord::Base
	belongs_to :user
	has_many :bids

	validates :user_id, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validates :deadline, presence: true

	def self.last_created(n)
		order('user_id ASC')
	end


end

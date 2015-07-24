class Product < ActiveRecord::Base
	belongs_to :user
    has_many :bids, through: :users


  	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
 	validates_attachment_file_name :photo, :matches => [/png\Z/, /jpe?g\Z/]	


	validates :user_id, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validates :deadline, presence: true

	def self.last_created(n)
		order('user_id ASC')
	end



end

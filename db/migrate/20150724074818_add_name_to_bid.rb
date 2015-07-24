class AddNameToBid < ActiveRecord::Migration
  def change
  	add_column :bids, :name, :string 
  end
end

class RemoveNameFromBids < ActiveRecord::Migration
  def change
  	remove_column :bids, :name, :string 
  end
end

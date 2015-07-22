class AddBidsColumnToTable < ActiveRecord::Migration
  def change
    add_column :bids, :bid, :integer
  end
end

class RemoveTextFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :text, :string
  end
end

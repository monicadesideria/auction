class AddWinnerIdToProducts < ActiveRecord::Migration[5.1]
  def up
  	add_column :products, :winner_id, :integer
  end

  def down
  	remove_column :products, :winner_id, :integer
  end
end

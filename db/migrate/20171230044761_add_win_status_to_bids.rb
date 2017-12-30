class AddWinStatusToBids < ActiveRecord::Migration[5.1]
  def up
  	add_column :bids, :win_status, :integer, default: 0
  end

  def down
  	remove_column :bids, :win_status, :integer, default: 0
  end
end

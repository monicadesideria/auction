class AddCustomerIdToBids < ActiveRecord::Migration[5.1]
  def up
  	add_column :bids, :customer_id, :string
  end

  def down
  	remmove_column :bids, :customer_id, :string
  end
end

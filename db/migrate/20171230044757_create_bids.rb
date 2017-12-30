class CreateBids < ActiveRecord::Migration[5.1]
  def change
    create_table :bids do |t|
      t.decimal :amount, precision: 14, scale: 2, default: 0.0
      t.references :user, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end

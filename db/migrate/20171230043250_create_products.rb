class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :detail
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :price, precision: 14, scale: 2, default: 0.0
      t.integer :status, default: 1
      t.references :user, index: true

      t.timestamps
    end
  end
end

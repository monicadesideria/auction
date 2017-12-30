class AddImagesToProducts < ActiveRecord::Migration[5.1]
  def up
    add_column :products, :images, :json
  end

  def down
  	add_column :products, :images, :json
  end
end

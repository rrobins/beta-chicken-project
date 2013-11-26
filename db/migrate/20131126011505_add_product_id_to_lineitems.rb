class AddProductIdToLineitems < ActiveRecord::Migration
  def change
    add_column :lineitems, :product_id, :integer
  end
end

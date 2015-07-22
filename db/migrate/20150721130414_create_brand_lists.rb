class CreateBrandLists < ActiveRecord::Migration
  def change
    create_table :brand_lists do |t|
      t.string :brand
      t.string :label

      t.timestamps null: false
    end
  end
end

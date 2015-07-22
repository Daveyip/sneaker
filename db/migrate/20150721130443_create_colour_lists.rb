class CreateColourLists < ActiveRecord::Migration
  def change
    create_table :colour_lists do |t|
      t.string :color
      t.string :label

      t.timestamps null: false
    end
  end
end

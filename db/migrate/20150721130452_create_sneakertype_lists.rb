class CreateSneakertypeLists < ActiveRecord::Migration
  def change
    create_table :sneakertype_lists do |t|
      t.string :sneakertype
      t.string :label

      t.timestamps null: false
    end
  end
end

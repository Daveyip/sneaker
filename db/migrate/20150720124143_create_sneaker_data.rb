class CreateSneakerData < ActiveRecord::Migration
  def change
    create_table :sneaker_data do |t|
      t.string :name
      t.string :description
      t.string :sneakertype
      t.string :brand
      t.string :gender
      t.string :colour
      t.date :time

      t.timestamps null: false
    end
  end
end

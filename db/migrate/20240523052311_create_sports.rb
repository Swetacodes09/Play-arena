class CreateSports < ActiveRecord::Migration[7.1]
  def change
    create_table :sports do |t|
      t.string :name
      t.string :location
      t.string :pincode
      t.decimal :price
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end

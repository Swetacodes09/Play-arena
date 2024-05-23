class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :status

      t.timestamps
    end
  end
end

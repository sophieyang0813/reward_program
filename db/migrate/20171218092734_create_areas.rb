class CreateAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :areas do |t|
      t.integer :partner_id
      t.string :location
      t.string :room_type
      t.integer :num_of_guest
      t.integer :price_per_night
      t.string :avatar

      t.timestamps
    end
  end
end

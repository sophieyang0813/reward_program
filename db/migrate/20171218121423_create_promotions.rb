class CreatePromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :promotions do |t|
      t.integer :area_id
      t.string :name
      t.string :reward_type
      t.integer :value
      t.integer :point
      t.string :description
      t.string :terms_conditions
      t.datetime :valid_from
      t.datetime :valid_to

      t.timestamps
    end
  end
end

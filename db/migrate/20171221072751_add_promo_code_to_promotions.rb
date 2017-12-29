class AddPromoCodeToPromotions < ActiveRecord::Migration[5.1]
  def change
    add_column :promotions, :promo, :string
    add_column :partners, :code, :string
  end
end

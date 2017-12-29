class CreatePointWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :point_wallets do |t|
      t.belongs_to :user, index: true
      t.integer :balance
      t.integer :earned
      t.integer :redeemed

      t.timestamps
    end
  end
end
